import 'package:flutter/material.dart';

class GalleryPage extends StatelessWidget {
  GalleryPage({super.key});

  // Generate image paths dynamically (0000 → 0014)
  final List<String> images = List.generate(
    15,
    (index) => 'assets/IMG-20260323-WA${index.toString().padLeft(4, '0')}.jpg',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gallery'), centerTitle: true),

      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: images.length,

        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 6,
          mainAxisSpacing: 6,
        ),

        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => FullScreenImage(imagePath: images[index]),
                ),
              );
            },

            child: Hero(
              tag: images[index],
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(images[index], fit: BoxFit.cover),
              ),
            ),
          );
        },
      ),
    );
  }
}

class FullScreenImage extends StatelessWidget {
  final String imagePath;

  const FullScreenImage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: Center(
        child: Hero(
          tag: imagePath,
          child: InteractiveViewer(child: Image.asset(imagePath)),
        ),
      ),
    );
  }
}
