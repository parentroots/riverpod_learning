import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../provider/greeting_provider.dart';


class GreetingScreen extends ConsumerWidget {
  const GreetingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final greeting = ref.watch(greetingFutureProvider);

    return Scaffold(
      body: Center(
        child: greeting.when(
          skipLoadingOnRefresh: false,
          data: (data) => Text(data),
          error: (error, stackTrace) =>
              Column(
                mainAxisAlignment: .center,
                crossAxisAlignment: .center,
                children: [
                  Text(error.toString()),
                  ElevatedButton(
                    onPressed: () =>
                        ref.refresh(greetingFutureProvider),
                    child: const Text('Retry'),
                  ),
                ],
              ),
          loading: () =>
          const CircularProgressIndicator(
            backgroundColor: Colors.blue,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
