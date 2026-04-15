import 'dart:async';
import 'package:flutter/material.dart';
import 'bottom_nav_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  final Color hibiscus = const Color(0xFFC2185B);

  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // 🎬 Animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // 🌫️ Fade animation
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);

    // 🔍 Scale animation (slight zoom)
    _scaleAnimation = Tween<double>(begin: 0.9, end: 1).animate(_controller);

    _controller.forward();

    // ⏳ Navigate after delay
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const BottomNavPage()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Center(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: Column(
              mainAxisSize: MainAxisSize.min,
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

                // 🛕 IMAGE
                Image.asset(
                  'assets/gopuram.png',
                  height: 220,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
