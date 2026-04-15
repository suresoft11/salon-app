import 'dart:async';
import 'package:flutter/material.dart';
import 'bottom_nav_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final Color hibiscus = const Color(0xFFC2185B);

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const BottomNavPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min, // 🔥 important fix
          children: [
            // 🌺 TEXT
            Text(
              "Sri Vijaya's Beauty Salon",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: hibiscus,
              ),
            ),

            const SizedBox(height: 6),

            Text(
              "Glow with Confidence ✨",
              style: TextStyle(
                fontSize: 15,
                fontStyle: FontStyle.italic,
                color: hibiscus.withOpacity(0.7),
              ),
            ),

            const SizedBox(height: 20),

            // 🛕 IMAGE (controlled size)
            Image.asset(
              'assets/gopuram.png',
              height: 220, // 🔥 fix size instead of scale
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}
