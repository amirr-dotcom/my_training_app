import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MyCacheImage extends StatelessWidget {
  final String imageUrl;
  const MyCacheImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return  CachedNetworkImage(
      fit: BoxFit.cover,
      progressIndicatorBuilder: (context, url, progress) => Center(
        child: CircularProgressIndicator(
          value: progress.progress,
        ),
      ),
      errorWidget: (context, url, error) {
        return const Icon(Icons.error);
      },
      imageUrl: imageUrl,
    );
  }
}
