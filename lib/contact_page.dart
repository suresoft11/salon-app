import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  final String phone = "9150643388";
  final String whatsapp = "9150643388";
  final String mapUrl = "https://maps.app.goo.gl/LYZMXBjJKioFcFeq5";

  final Color hibiscus = const Color(0xFFC2185B);

  Future<void> _callSalon() async {
    final Uri callUri = Uri.parse("tel:$phone");
    await launchUrl(callUri);
  }

  Future<void> _openWhatsapp() async {
    final Uri whatsappUri = Uri.parse(
      "https://wa.me/$whatsapp?text=Hello%20I%20want%20to%20book%20an%20appointment",
    );

    await launchUrl(whatsappUri, mode: LaunchMode.externalApplication);
  }

  Future<void> _openMap() async {
    final Uri mapUri = Uri.parse(mapUrl);
    await launchUrl(mapUri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Contact Us"), centerTitle: true),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 🌺 Hibiscus Icon
            Icon(Icons.local_florist, size: 90, color: hibiscus),

            const SizedBox(height: 20),

            const Text(
              "Sri Vijaya's Beauty Salon",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            const Text("Chennai, Tamil Nadu"),

            const SizedBox(height: 40),

            // 📞 Call Button
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: hibiscus,
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.call),
              label: const Text("Call Salon"),
              onPressed: _callSalon,
            ),

            const SizedBox(height: 15),

            // 💬 WhatsApp Button
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: hibiscus,
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.chat),
              label: const Text("WhatsApp Booking"),
              onPressed: _openWhatsapp,
            ),

            const SizedBox(height: 15),

            // 📍 Map Button
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: hibiscus,
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.location_on),
              label: const Text("Open in Google Maps"),
              onPressed: _openMap,
            ),
          ],
        ),
      ),
    );
  }
}
