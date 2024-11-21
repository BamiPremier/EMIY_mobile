import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:open_settings/open_settings.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/account/screens/param/blocked_user.dart';
import 'package:umai/common/bloc/notification_cubit.dart';
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/svg_utils.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _fetchNotificationSettings(); // Récupère les paramètres au démarrage.
  }

  Future<void> _fetchNotificationSettings() async {
      await FirebaseMessaging.instance.getNotificationSettings();
    setState(() {});
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
      OpenSettings.openNotificationSetting();
    } else if (Platform.isIOS) {
      OpenSettings.openAppNotificationSetting();
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
                  return SwitchListTile(

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
                trailing: toSvgIcon(icon: Assets.iconsDirectionRight, size: 16.0),
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
                trailing: toSvgIcon(icon: Assets.iconsDirectionRight, size: 16.0),
                onTap: () {},
              ),
              ListTile(
                title: Text(
                  'Version',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                trailing: toSvgIcon(icon: Assets.iconsDirectionRight, size: 16.0),
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
