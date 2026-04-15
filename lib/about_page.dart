import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  final Color hibiscus = const Color(0xFFC2185B);

  final String mapUrl = "https://maps.app.goo.gl/LYZMXBjJKioFcFeq5";

  Future<void> openMap() async {
    final Uri uri = Uri.parse(mapUrl);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("About Us"), centerTitle: true),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🌺 Title
            Text(
              "Sri Vijaya's Beauty Salon",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: hibiscus,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "Glow with Confidence ✨",
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 20),

            // 📖 About
            const Text(
              "About Us",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            const Text(
              "Located in Chennai, Sri Vijaya's Beauty Salon is dedicated to enhancing your natural beauty with professional care and premium services. Our experienced staff ensures that every customer receives personalized attention in a comfortable and relaxing environment.",
              style: TextStyle(fontSize: 15),
            ),

            const SizedBox(height: 20),

            // 💇 Services
            const Text(
              "Our Services",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            _buildBullet("Hair Cutting & Styling"),
            _buildBullet("Facial & Skin Care"),
            _buildBullet("Bridal Makeup"),
            _buildBullet("Manicure & Pedicure"),
            _buildBullet("Waxing & Threading"),

            const SizedBox(height: 20),

            // 🌟 Why Choose Us
            const Text(
              "Why Choose Us",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            _buildFeature(Icons.star, "Experienced professionals"),
            _buildFeature(Icons.clean_hands, "Hygienic & safe environment"),
            _buildFeature(Icons.spa, "Premium quality products"),
            _buildFeature(Icons.favorite, "Customer satisfaction first"),

            const SizedBox(height: 20),

            // 📍 Clickable Location
            InkWell(
              onTap: openMap,
              child: Row(
                children: [
                  Icon(Icons.location_on, color: hibiscus),
                  const SizedBox(width: 8),
                  Text(
                    "Chennai, Tamil Nadu",
                    style: TextStyle(
                      fontSize: 15,
                      color: hibiscus,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ❤️ Closing
            const Center(
              child: Text(
                "We are committed to making you look and feel your best every day 💖",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 Bullet
  Widget _buildBullet(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text("• $text"),
    );
  }

  // 🌺 Feature row
  Widget _buildFeature(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFFC2185B)),
          const SizedBox(width: 10),
          Text(text),
        ],
      ),
    );
  }
}
