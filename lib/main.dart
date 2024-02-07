import 'package:flutter/material.dart';
import 'package:note_mate/utils/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: NoteMateTheme.lightTheme,
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
