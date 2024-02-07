import 'dart:async';

import 'package:flutter/material.dart';
import 'package:note_mate/layout/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Setelah beberapa detik, pindah ke halaman berikutnya
    Timer(
      Duration(seconds: 2),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset('assets/images/img-logo-splash.png')),
    );
  }
}
