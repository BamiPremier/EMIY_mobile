import 'dart:io';

abstract class Links {
  static const String faq = 'https://mycocobeauty.fr/#faq';
  static const String cgu = 'https://mycocobeauty.fr/cgu';
  static const String privacy = 'https://mycocobeauty.fr/politique-de-confidentialite/';
  static const String contact = 'https://mycocobeauty.fr/#contact';

  static String get subscriptions {
    if (Platform.isAndroid) {
      return 'https://play.google.com/store/account/subscriptions?package=com.spacekola.cocobeauty';
    } else if (Platform.isIOS) {
      return 'https://apps.apple.com/account/subscriptions';
    }
    throw UnimplementedError();
  }
}