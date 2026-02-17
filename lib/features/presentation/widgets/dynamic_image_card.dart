import 'package:flutter/material.dart';

import '../../domain/entities/image_entity.dart';

class DynamicImageCard extends StatelessWidget {
  final ImageEntity image;

  const DynamicImageCard({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: const [BoxShadow(blurRadius: 10, color: Colors.black12)],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: AspectRatio(
          aspectRatio: image.aspectRatio,
          child: Image.memory(
            image.bytes,
            fit: BoxFit.cover,
            cacheWidth: 1080,
            filterQuality: FilterQuality.low,
          ),
        ),
      ),
    );
  }
}
