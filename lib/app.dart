import 'package:flutter/material.dart';
import 'package:river_pod/greeting/screen/greeting_screen.dart';
import 'package:river_pod/strem/screen/timer_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const GreetingScreen(),
    );
  }
}
