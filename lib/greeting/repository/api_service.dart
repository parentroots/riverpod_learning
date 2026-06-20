import 'dart:math';

class GreetingApiService {
  Future<String> fetchGreeting() async {
    await Future.delayed(const Duration(seconds: 2));
    if (Random().nextDouble() < 0.3) {
      throw Exception('Failed to fetch greeting');
    } else {
      return 'Good Evening Md Ebrahim Nazmul';
    }
  }
}
