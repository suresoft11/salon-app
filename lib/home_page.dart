import 'package:flutter/material.dart';
import 'booking_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final Color hibiscus = const Color(0xFFC2185B);

  final List<String> services = [
    "Hair Services",
    "Facial & Skin Care",
    "Threading",
    "Waxing",
    "Manicure & Pedicure",
    "Nail Art",
    "Makeup",
    "Bridal Packages",
  ];

  final List<IconData> icons = [
    Icons.content_cut,
    Icons.face,
    Icons.remove_red_eye,
    Icons.spa,
    Icons.clean_hands,
    Icons.brush,
    Icons.palette,
    Icons.favorite,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),

      appBar: AppBar(title: const Text("Salon Services"), centerTitle: true),

      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: services.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 14,
          mainAxisSpacing: 14,
        ),
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(12),

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: hibiscus.withOpacity(0.25)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // 🔝 ICON
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: hibiscus.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icons[index], size: 24, color: hibiscus),
                ),

                const SizedBox(height: 8),

                // 📝 TEXT
                Text(
                  services[index],
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 12),

                // 🔻 BUTTON (no spacer → no extra gap)
                SizedBox(
                  width: double.infinity,
                  height: 36,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: hibiscus,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => BookingPage(service: services[index]),
                        ),
                      );
                    },
                    child: const Text(
                      "Book",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
