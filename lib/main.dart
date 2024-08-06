import 'package:flutter/material.dart';
import 'package:trippin/pages/billing_page.dart';
import 'package:trippin/pages/scan_bill_page.dart';
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: BillingPage(), // Gunakan SplashScreen dari splash.dart
    );
  }
}
