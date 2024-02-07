import 'package:flutter/material.dart';
import 'package:note_mate/utils/theme/custom_themes/text_themes.dart';

class NoteMateTheme {
  NoteMateTheme._();

  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'PlusJakartaSans',
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      primaryColor: Colors.blue,
      textTheme: NoteMateTextTheme.lightTextTheme);
}
