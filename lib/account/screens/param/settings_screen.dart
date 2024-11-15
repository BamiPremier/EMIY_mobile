import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/account/screens/param/blocked_user.dart';
import 'package:umai/common/bloc/notification_cubit.dart';
import 'package:umai/common/bloc/user_cubit.dart';
import 'package:umai/common/services/preferences_service.dart';
import 'package:open_settings/open_settings.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen>
    with WidgetsBindingObserver {
  NotificationSettings? _settings;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _fetchNotificationSettings(); // Récupère les paramètres au démarrage.
  }

  Future<void> _fetchNotificationSettings() async {
    final settings = await FirebaseMessaging.instance.getNotificationSettings();
    setState(() {
      _settings = settings;
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed && mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  Future<NotificationSettings> _getNotificationSettings() {
    return FirebaseMessaging.instance.getNotificationSettings();
  }

  late final notificationCubit = context.read<NotificationCubit>();
  late final preferencesService = notificationCubit.preferencesService;
  void _openNotificationSettings() {
    if (Platform.isAndroid) {
      OpenSettings
          .openNotificationSetting(); // Redirige vers les paramètres Android.
    } else if (Platform.isIOS) {
      OpenSettings
          .openAppNotificationSetting(); // Redirige vers les paramètres iOS.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paramètres'),
        centerTitle: true,
      ),
      body: SafeArea(
          minimum: const EdgeInsets.only(bottom: 48),
          child: ListView(
            children: [
              FutureBuilder<NotificationSettings>(
                future: _getNotificationSettings(),
                builder: (context, snapshot) {
                  print(snapshot.connectionState);

                  final settings = snapshot.data;
                  final isAuthorized = settings?.authorizationStatus ==
                      AuthorizationStatus.authorized;

                  return SwitchListTile.adaptive(
                    title: Text(
                      'Notifications générales',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    subtitle: Text(
                      isAuthorized ? 'Activées' : 'Désactivées',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    value: isAuthorized,
                    onChanged: (_) async {
                      if (settings?.authorizationStatus ==
                          AuthorizationStatus.notDetermined) {
                        await notificationCubit
                            .requestNotificationPermission()
                            .then((value) {
                          setState(() {});
                        });
                      } else {
                        _openNotificationSettings();
                      }
                    },
                  );
                },
              ),
              ListTile(
                title: Text(
                  'Confidentialité',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                subtitle: Text(
                  'Utilisateurs bloqués',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                trailing: const Icon(Icons.arrow_right),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const BlockedUserScreen()));
                },
              ),
              ListTile(
                title: Text(
                  'Confidentialité',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                subtitle: Text(
                  'Voir la politique de confidentialité',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                trailing: const Icon(Icons.arrow_right),
                onTap: () {},
              ),
              ListTile(
                title: Text(
                  'Version',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                trailing: const Icon(Icons.arrow_right),
                subtitle: Text(
                  preferencesService.packageInfo.version,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          )),
    );
  }
}
