import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NewShoes extends StatelessWidget {
  const NewShoes({
    super.key, required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 0.2,
            offset: Offset(0, 1),
          ),
        ],
      ),
      height: MediaQuery.of(context).size.height *
          0.12,
      width: MediaQuery.of(context).size.width *
          0.28,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
