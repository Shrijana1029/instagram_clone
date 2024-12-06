import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final List<String> images = [
    'assets/img/gun.png',
    'assets/img/gun.png',
    'assets/img/me.png',
    'assets/img/gun.png',
    'assets/img/gun.png',
    'assets/img/gun.png',
    'assets/img/gun.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Explore'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // Number of columns
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
              childAspectRatio: 1),
          itemCount: images.length,
          itemBuilder: (context, index) {
            ////gesture used for clicking,dragging the pictures
            return GestureDetector(
              onTap: () {
                // Handle image tap
                print('Tapped on image $index');
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Material(
                  elevation: 3, // Add subtle shadow
                  borderRadius: BorderRadius.circular(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      images[index],
                      fit: BoxFit.cover, // Scale and crop the image
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
