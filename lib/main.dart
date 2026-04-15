import 'package:flutter/material.dart';
import 'splash_screen.dart';

void main() {
  runApp(const SalonApp());
}

class SalonApp extends StatelessWidget {
  const SalonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Sri Vijaya's Beauty Salon",
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primarySwatch: Colors.pink,

        appBarTheme: const AppBarTheme(
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.pink,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          backgroundColor: Colors.white,
          elevation: 1,
          iconTheme: IconThemeData(color: Colors.pink),
        ),
      ),

      home: const SplashScreen(),
    );
  }
}
