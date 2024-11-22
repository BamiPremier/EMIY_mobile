import 'package:intl/intl.dart';

extension TimeElapsed on DateTime {
  String elapsed() {
    final duration = DateTime.now().difference(this);
    final isFuture = duration.isNegative;
    final absDuration = duration.abs();

    if (absDuration.inMinutes < 1) {
      return isFuture ? 'dans un instant' : 'à l\'instant';
    }
    if (absDuration.inHours < 1) {
      final minutes = absDuration.inMinutes;
      return '${isFuture ? "dans" : "il y a"} $minutes minute${minutes < 2 ? "" : "s"}';
    }
    if (absDuration.inDays < 1) {
      final hours = absDuration.inHours;
      return '${isFuture ? "dans" : "il y a"} $hours heure${hours < 2 ? "" : "s"}';
    }
    if (absDuration.inDays < 7) {
      final days = absDuration.inDays;
      return '${isFuture ? "dans" : "il y a"} $days jour${days < 2 ? "" : "s"}';
    }
    if (absDuration.inDays < 30) {
      final weeks = absDuration.inDays ~/ 7;
      return '${isFuture ? "dans" : "il y a"} $weeks semaine${weeks < 2 ? "" : "s"}';
    }
    if (absDuration.inDays < 365) {
      final months = absDuration.inDays ~/ 30;
      return '${isFuture ? "dans" : "il y a"} $months mois';
    }
    final years = absDuration.inDays ~/ 365;
    return '${isFuture ? "dans" : "il y a"} $years an${years < 2 ? "" : "s"}';
  }
}
