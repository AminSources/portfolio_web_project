import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  //? access to ThemeData
  ThemeData get theme => Theme.of(this);

  //? access to TextTheme
  TextTheme get textTheme => theme.textTheme;

  //? access to ColorScheme
  ColorScheme get colorScheme => theme.colorScheme;
}
