import 'package:flutter/material.dart';

import '../../domain/entities/image_entity.dart';

class FixedImageCard extends StatelessWidget {
  final ImageEntity image;

  const FixedImageCard({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      margin: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: const [BoxShadow(blurRadius: 10, color: Colors.black12)],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.memory(
          image.bytes,
          fit: BoxFit.contain,
          cacheWidth: 1080,
          filterQuality: FilterQuality.low,
        ),
      ),
    );
  }
}
