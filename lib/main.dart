import 'package:flutter/material.dart';
// import 'package:trippin/pages/galery.dart';
import 'package:trippin/pages/splash_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tripin',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0XFF3485FF)),
      ),
      home: SplashScreen(), // Gunakan SplashScreen dari splash.dart
    );
  }
}
