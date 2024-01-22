import 'package:flutter/material.dart';
import 'view/home.dart';



class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pro Hardware Extreme',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF003366)
      ),
      home: const HomePage()
    );
  }
}