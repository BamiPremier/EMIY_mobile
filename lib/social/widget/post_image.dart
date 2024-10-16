import 'dart:math';

import 'package:flutter/material.dart';

class PostImage extends StatelessWidget {
  final String url;

  const PostImage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = min(450, width);

    // TODO: use flutter_cache_manager instead of cached_network_image
    return Image.network(
      url,
      height: height,
      width: width,
      fit: BoxFit.cover,
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? progress) {
        return Container(
          alignment: Alignment.center,
          height: height,
          width: width,
          color: Theme.of(context).colorScheme.tertiaryContainer,
          child: progress == null
            ? child
            : CircularProgressIndicator(
                value: progress.cumulativeBytesLoaded /
                  (progress.expectedTotalBytes ?? 1),
                color: Theme.of(context).colorScheme.onTertiaryContainer,
                backgroundColor: Theme.of(context).colorScheme.tertiary,
              ),
        );
      },
      errorBuilder: (BuildContext context, _, __) {
        return Container(
          height: height,
          width: width,
          color: Colors.grey[300],
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error,
                  color: Theme.of(context).colorScheme.onTertiaryContainer,
                  size: 48
                ),
                const SizedBox(height: 16),
                Text(
                  "Erreur de chargement de l'image",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onTertiaryContainer
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
