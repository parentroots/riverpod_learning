import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:intl/intl.dart';

final helloWorldProvider = StateProvider<String>((ref) {
  return 'Hello World';
});

final dateFormatterProvider = StateProvider<DateFormat>((
  ref,
) {
  return DateFormat.Hms();
});

final clockProvider = StreamProvider<DateTime>((ref) {
  return Stream.periodic(
    const Duration(seconds: 1),
    (_) => DateTime.now(),
  );
});

class NameScreen extends ConsumerWidget {
  const NameScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint("Build");
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(helloWorldProvider.notifier).state =
              'Hello Ibrahim';
        },
        child: const Icon(Icons.edit),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Consumer(
              builder: (context, ref, child) {
                final helloWorld = ref.watch(
                  helloWorldProvider,
                );

                return Text(helloWorld);
              },
            ),

            /*
           Consumer(
              builder: (context, ref, child) {
                final dateFormateProvider = ref.watch(
                  dateFormatterProvider,
                );

                return Text(
                  dateFormateProvider.format(
                    DateTime.now(),
                  ),
                );
              },
            ),

*/
            Consumer(
              builder: (context, ref, child) {
                final clock = ref.watch(clockProvider);

                return clock.when(
                  data: (time) =>
                      Text(DateFormat.Hms().format(time)),
                  loading: () =>
                      const CircularProgressIndicator(),
                  error: (e, s) => Text(e.toString()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
