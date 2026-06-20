class TimerRepository {
  Stream<int> getTimerStream() async* {
    for (int i = 0; i < 10; i++) {
      await Future.delayed(const Duration(seconds: 1));
      yield i;
    }

    throw Exception('Timer finished');
  }
}