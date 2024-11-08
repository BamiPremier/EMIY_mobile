import 'package:intl/intl.dart';

extension TimeElapsed on DateTime {
  String elapsed() {
    final duration = DateTime.now().difference(this);
    if (duration.inDays < 0) return 'dans ${-duration.inDays} j';
    if (duration.inMinutes < 1) return 'à l\'instant';
    if (duration.inHours < 1) return 'il y a ${duration.inMinutes} mins';
    if (duration.inDays < 1) return 'il y a ${duration.inHours} h';
    if (duration.inDays < 7) return 'il y a ${duration.inDays} j';
    return DateFormat('dd.MM.y HH:mm').format(this);
  }
}
