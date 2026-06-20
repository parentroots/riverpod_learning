import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/timer_repository.dart';

final timerProvider = Provider((ref) => TimerRepository());

final timerStreamProvider=StreamProvider<int>((ref) {
  final repository = ref.watch(timerProvider);
  return repository.getTimerStream();
});
