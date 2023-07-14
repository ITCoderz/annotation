import 'package:flutter/material.dart';

class CustomThemeData {
  CustomThemeData._();

  static ThemeData lightViewTheme = ThemeData(
    brightness: Brightness.light,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
  );
}
