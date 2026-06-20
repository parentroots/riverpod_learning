import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/timer_stream_provider.dart';

class TimerScreen extends ConsumerWidget {
  const TimerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timer = ref.watch(timerStreamProvider);

    return Scaffold(
      body: Center(
        child: switch (timer) {
          AsyncData(:final value) => Text(
              "$value",
              style: Theme.of(context).textTheme.displayLarge,
            ),
          AsyncError(:final error) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Error: $error'),
                ElevatedButton(
                  onPressed: () => ref.invalidate(timerStreamProvider),
                  child: const Text('Retry'),
                ),
              ],
            ),
          _ => const CircularProgressIndicator(),
        },
      ),
    );
  }
}
