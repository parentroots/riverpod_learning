import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../provider/login_provider.dart';


class InformationUploadScreen
    extends ConsumerStatefulWidget {
  const InformationUploadScreen({super.key});

  @override
  ConsumerState<InformationUploadScreen> createState() =>
      _InformationUploadScreenState();
}

class _InformationUploadScreenState
    extends ConsumerState<InformationUploadScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();


@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              onChanged: (value) {
                ref.read(emailProvider.notifier).state =
                    value;
              },
              decoration: buildInputDecoration(
                "Enter Your Email",
              ),
            ),

            SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              onChanged: (value) {
                ref.read(passwordProvider.notifier).state =
                    value;
              },
              decoration: buildInputDecoration(
                "Enter Your Password",
              ),
            ),

            ElevatedButton(
              onPressed: () {
                final error = ref.read(
                  loginValidationProvider,
                );

                if (error != null) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(

                    SnackBar(

                    backgroundColor: Colors.red,
                        elevation:20,
                        behavior: SnackBarBehavior.floating,

                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [

                            Icon(Icons.warning_amber),


                            Text(error),
                          ],
                        )
                    ),
                  );
                  return;
                }

                print('Login Success');
              },
              child: const Text('Login'),
            ),

            Consumer(
              builder: (context, WidgetRef ref, child) {
                final email = ref.watch(emailProvider);
                final password = ref.watch(
                  passwordProvider,
                );

                return Text(
                  "Email IS:$email Password IS:$password",
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration buildInputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      border: OutlineInputBorder(),
      enabledBorder: OutlineInputBorder(),
    );
  }
}
