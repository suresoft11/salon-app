import 'package:flutter/material.dart';

class PriceListPage extends StatelessWidget {
  PriceListPage({super.key});

  final Color hibiscus = const Color(0xFFC2185B);

  final List<Map<String, dynamic>> services = [
    {"service": "Forehead", "price": "₹20"},
    {"service": "Upper Lip", "price": "₹30"},
    {"service": "Chin", "price": "₹30"},
    {"service": "Eye Brows", "price": "₹50"},
    {"service": "Beard", "price": "₹60"},
    {"service": "Waxing Underarms", "price": "₹100+"},
    {"service": "Haircut", "price": "₹200"},
    {"service": "Front", "price": "₹200"},
    {"service": "Waxing Full Face", "price": "₹250"},
    {"service": "Full Face", "price": "₹250"},
    {"service": "Waxing Hands", "price": "₹300+"},
    {"service": "Haircut U Style", "price": "₹300"},
    {"service": "Haircut V Style", "price": "₹300"},
    {"service": "Back", "price": "₹300"},
    {"service": "Bleaching", "price": "₹400"},
    {"service": "D Tan", "price": "₹400"},
    {"service": "Manicure", "price": "₹400"},
    {"service": "Waxing Legs", "price": "₹400+"},
    {"service": "Face Rice", "price": "₹450"},
    {"service": "Foot Massage", "price": "₹450"},
    {"service": "Pedicure", "price": "₹500"},
    {"service": "Clean Up", "price": "₹500"},
    {"service": "Back Massage", "price": "₹500"},
    {"service": "Haircut Layer", "price": "₹500"},
    {"service": "Haircut Step", "price": "₹500"},
    {"service": "Hand", "price": "₹500"},
    {"service": "Spa Manicure", "price": "₹600"},
    {"service": "Facial", "price": "₹600"},
    {"service": "Fruit Facial", "price": "₹700"},
    {"service": "Wine Facial", "price": "₹700"},
    {"service": "Pearl Facial", "price": "₹700"},
    {"service": "Head Massage", "price": "₹700"},
    {"service": "Spa Pedicure", "price": "₹800"},
    {"service": "Gold Facial", "price": "₹1000"},
    {"service": "Hair Spa", "price": "₹1000+"},
    {"service": "Body Spa", "price": "₹1000+"},
    {"service": "Vitamin C Facial", "price": "₹1200"},
    {"service": "Retinal Facial", "price": "₹1200"},
    {"service": "Skin Lighting", "price": "₹1300"},
    {"service": "Skin Brightening", "price": "₹1400"},
    {"service": "Dandruff Spa", "price": "₹1500+"},
    {"service": "Skin Whitening", "price": "₹1500"},
    {"service": "Party Makeup", "price": "₹2500"},
    {"service": "Bridal Makeup", "price": "₹5000"},
    {"service": "HD Makeup", "price": "₹8500+"},
  ];

  // 🔥 Convert price string → int for sorting
  int extractPrice(String price) {
    return int.parse(price.replaceAll(RegExp(r'[^0-9]'), ''));
  }

  @override
  Widget build(BuildContext context) {
    // ✅ Correct sorting
    services.sort(
      (a, b) => extractPrice(a["price"]).compareTo(extractPrice(b["price"])),
    );

    return Scaffold(
      appBar: AppBar(title: const Text("Price List"), centerTitle: true),

      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: services.length,
        itemBuilder: (context, index) {
          final service = services[index];

          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: hibiscus.withOpacity(0.3)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  service["service"], // ✅ fixed
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                Text(
                  service["price"], // ✅ already has ₹
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: hibiscus,
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
