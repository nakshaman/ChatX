import 'package:chatx/theme/text_theme.dart';
import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(
    primary: Colors.grey.shade500,
    secondary: Colors.grey.shade200,
    tertiary: Colors.white,
    inversePrimary: Colors.grey.shade900,
    shadow: Colors.grey.shade500.withValues(alpha: 0.1),
  ),
  scaffoldBackgroundColor: Colors.grey.shade300,
  textTheme: appTextTheme,
);
