import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:trippin/pages/login_page.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background di luar AnimatedSplashScreen
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image:
                    AssetImage("lib/images/splash/bg.png"), // Path yang benar
                fit: BoxFit.cover,
              ),
            ),
          ),
          // AnimatedSplashScreen
          AnimatedSplashScreen(
            splash: Image.asset(
              'lib/images/splash/logo.png', // Path yang benar
              width: 800, // Sesuaikan ukuran logo sesuai kebutuhan
              height: 800, // Sesuaikan ukuran logo sesuai kebutuhan
            ),
            duration: 1500,
            splashTransition: SplashTransition.fadeTransition,
            nextScreen: LoginPage(), // Ganti dengan halaman utama yang sesuai
            backgroundColor: Colors
                .transparent, // Mengatur latar belakang menjadi transparan
          ),
        ],
      ),
    );
  }
}
