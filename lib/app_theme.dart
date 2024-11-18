import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData light() => ThemeData(
    textTheme: TextTheme(),
    buttonTheme: ButtonThemeData()
  );
}