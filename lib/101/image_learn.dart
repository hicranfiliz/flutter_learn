import 'package:flutter/material.dart';

class ImageLearn extends StatelessWidget {
  const ImageLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('image learn'),
      ),
      body: Column(
        children: [
          SizedBox(
              height: 200,
              width: 300,
              child: PngImage(name: ImageItems.flower2WithoutPath))
        ],
      ),
    );
  }
}

class ImageItems {
  static String flower = "assets/flowerr.png";
  static String flower2 = "assets/png/dal.png";
  static String flower2WithoutPath = "dal";
}

class PngImage extends StatelessWidget {
  const PngImage({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      _nameWithPath,
      fit: BoxFit.cover,
    );
  }

  String get _nameWithPath => 'assets/png/$name.png';
}
