import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart' hide Notification;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:potatoes/common/bloc/cubit_state.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/common/bloc/notification_cubit.dart';
import 'package:umai/common/models/notification.dart';
import 'package:umai/utils/themes.dart';

const androidChannelId = "HIGH_IMPORTANCE_CHANNEL_ID";
const androidChannelName = "Notifications";

class NotificationService {
  BuildContext? _context;
  late final FlutterLocalNotificationsPlugin _plugin;

  NotificationService() : _context = null {
    _createLocalNotificationsPlugin().then((plugin) => _plugin = plugin);
  }

  set context(BuildContext context) => _context = context;

  Future<void> requestPermission(ValueChanged<String> sendToken) async {
    final messaging = FirebaseMessaging.instance;
    final settings = await messaging.requestPermission();
    if (Platform.isIOS) {
      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        messaging.setForegroundNotificationPresentationOptions(
          alert: true,
          badge: true,
        );
        _configure();
      }
    } else {
      _configure();
    }

    messaging.onTokenRefresh.listen((token) {
      print('FirebaseMessaging token changed : $token');
      sendToken(token);
    });
    messaging.getToken().then((token) {
      if (token != null) {
        print('FirebaseMessaging token retrieve : $token');
        sendToken(token);
      }
    });
    messaging.getInitialMessage().then((RemoteMessage? message) {
      if (message != null) {
        _onNotificationOnAppOpened(message.data);
      }
    });
  }

  Future<void> _configure() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log('tt: ${message.notification?.title}');
      log('bb: ${message.notification?.body}');
      log('dd: ${message.data}');

      // la permission est déjà demandée plus haut pour afficher les notifications sur iOS
      if (Platform.isAndroid && message.notification != null) {
        _fireLocalNotification(
            title: message.notification?.title,
            body: message.notification?.body,
            payload: jsonEncode(message.data));
      }
    });

    FirebaseMessaging.onBackgroundMessage(onBackgroundMessage);

    // handle push notification click when app is in background
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      _onNotificationOnAppOpened(message.data);
    });
  }

  Notification _parse(Map<String, dynamic> payload) {
    return Notification.fromJson(payload);
  }

  bool _onNotificationOnAppOpened(Map<String, dynamic> payload) {
    try {
      log('payload: $payload');
      log('context: $_context');
      if (_context == null) return false;
      log('payload: $payload');
      _context!
          .read<NotificationCubit>()
          .onNotification(notification: _parse(payload));
    } catch (e, t) {
      CubitErrorState.record(e, t);
    }

    return false;
  }

  void _fireLocalNotification({String? title, String? body, String? payload}) {
    const androidPlatformChannelSpecifics = AndroidNotificationDetails(
        androidChannelId, androidChannelName,
        priority: Priority.max,
        color: AppTheme.primaryYellow,
        enableLights: true);
    const iOSPlatformChannelSpecifics = DarwinNotificationDetails();
    const platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    _plugin.show(0, title, body, platformChannelSpecifics, payload: payload);
  }

  Future<FlutterLocalNotificationsPlugin>
      _createLocalNotificationsPlugin() async {
    final localNotifications = FlutterLocalNotificationsPlugin();
    localNotifications
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(const AndroidNotificationChannel(
          androidChannelId,
          androidChannelName,
          importance: Importance.max,
          ledColor: AppTheme.primaryYellow,
          enableLights: true,
          playSound: false,
        ));
    await localNotifications.initialize(
      const InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
        iOS: DarwinInitializationSettings(
            requestAlertPermission: false,
            requestBadgePermission: false,
            requestSoundPermission: false),
      ),
      onDidReceiveNotificationResponse: _onLocalNotificationTap,
    );

    return localNotifications;
  }

  void _onLocalNotificationTap(NotificationResponse response) {
    if (response.payload == null) return;

    final data = jsonDecode(response.payload!);
    _onNotificationOnAppOpened(data);
  }
}

Future<void> onBackgroundMessage(RemoteMessage message) async {}
