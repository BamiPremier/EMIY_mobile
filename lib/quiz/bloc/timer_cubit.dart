import 'dart:isolate';

import 'package:potatoes/libs.dart';

part 'timer_state.dart';

String durationToMinutes(Duration? duration) {
  if (duration == null || duration.inSeconds <= 0) return '00:00';

  int minutes = duration.inMinutes;
  int seconds = duration.inSeconds % 60;
  return "${minutes < 10 ? "0$minutes" : minutes}:"
      "${seconds < 10 ? "0$seconds" : seconds}";
}

class TimerCubit extends Cubit<ATimerState> {
  late DateTime _start, _end;
  final TimerIsolate _isolate;

  TimerCubit(DateTime startTime, DateTime endTime)
      : _start = startTime,
        _end = endTime,
        _isolate = TimerIsolate(),
        super(const TimerInitializing()) {
    _run();
  }

  TimerCubit.duration(Duration duration)
      : _isolate = TimerIsolate(),
        super(const TimerInitializing()) {
    _start = DateTime.now();
    _end = _start.add(duration);
    _run();
  }

  Duration get maxDuration => _end.difference(_start);

  void start() {
    _run();
  }

  void _run() {
    _isolate.start(
        startTime: _start,
        endTime: _end,
        onUpdate: (dynamic state) {
          if (!isClosed) emit(state as ATimerState);
        });
    print("=isClosed==$isClosed===$isClosed===run timer");
  }

  void reset() {
    _isolate.dispose();
    final now = DateTime.now();
    _end = now.add(_end.difference(_start));
    _start = now;
    print("===$_start===$_end===reset timer");

    _run();
  }

  @override
  Future<void> close() {
    print("============close timer");
    _isolate.dispose();
    return super.close();
  }
}
