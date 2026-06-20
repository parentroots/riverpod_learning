import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final emailProvider = StateProvider<String>((ref) {
  return '';
});

final passwordProvider = StateProvider<String>((ref) {
  return '';
});

final loginValidationProvider = Provider<String?>((ref) {
  final email = ref.watch(emailProvider);
  final password = ref.watch(passwordProvider);

  if (email.isEmpty) {
    return 'Email cannot be empty';
  }

  if (!email.contains('@')) {
    return 'Invalid email';
  }

  if (password.isEmpty) {
    return 'Password cannot be empty';
  }

  if (password.length < 6) {
    return 'Password must be at least 6 characters';
  }

  return null;
});