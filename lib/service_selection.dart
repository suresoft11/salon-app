import 'package:flutter/material.dart';
import 'home_page.dart';
import 'price_list_page.dart';
import 'about_page.dart';

class ServiceSelection extends StatelessWidget {
  const ServiceSelection({super.key});

  final List<String> options = const [
    "Online Booking",
    "Home Service",
    "Price List",
    "About Us",
  ];

  final List<IconData> icons = const [
    Icons.calendar_today,
    Icons.home,
    Icons.currency_rupee,
    Icons.info,
  ];

  final Color hibiscus = const Color(0xFFC2185B);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),

      appBar: AppBar(title: const Text("Choose Service"), centerTitle: true),

      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: options.length,

        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),

        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              if (options[index] == "Online Booking" ||
                  options[index] == "Home Service") {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              } else if (options[index] == "Price List") {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PriceListPage()),
                );
              } else if (options[index] == "About Us") {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutPage()),
                );
              }
            },

            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: hibiscus.withOpacity(0.3),
                  width: 1.2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 🌺 Icon with circular background
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: hibiscus.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(icons[index], size: 28, color: hibiscus),
                  ),

                  const SizedBox(height: 12),

                  Text(
                    options[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[800],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
