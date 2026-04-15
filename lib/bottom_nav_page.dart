import 'package:flutter/material.dart';
import 'service_selection.dart';
import 'gallery_page.dart';
import 'contact_page.dart';

class BottomNavPage extends StatefulWidget {
  const BottomNavPage({super.key});

  @override
  State<BottomNavPage> createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  int _selectedIndex = 0;

  // ❗ Removed const because GalleryPage is not const
  final List<Widget> _pages = [
    const ServiceSelection(),
    GalleryPage(),
    const ContactPage(),
  ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,

        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.grey,

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_library),
            label: "Gallery",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.phone), label: "Contact"),
        ],
      ),
    );
  }
}
