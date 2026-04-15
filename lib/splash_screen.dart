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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 🌺 Hibiscus Icon
            Icon(Icons.local_florist, size: 110, color: hibiscus),

            const SizedBox(height: 20),

            Text(
              "Sri Vijaya's Beauty Salon",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: hibiscus,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              "Glow with Confidence ✨",
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                color: hibiscus.withOpacity(0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
