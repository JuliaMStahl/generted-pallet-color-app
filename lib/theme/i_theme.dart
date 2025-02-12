import 'package:flutter/material.dart';

abstract class ITheme {
  ThemeData light();
  ThemeData lightMediumContrast();
  ThemeData lightHighContrast();

  ThemeData dark();
  ThemeData darkMediumContrast();
  ThemeData darkHighContrast();
}
