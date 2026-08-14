import 'package:chatx/features/auth/presentation/login.dart';
import 'package:chatx/theme/dark_mode.dart';
import 'package:chatx/theme/light_mode.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      darkTheme: darkMode,
      home: const Login(),
    );
  }
}
