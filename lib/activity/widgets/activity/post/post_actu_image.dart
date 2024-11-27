import 'dart:math';

import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/common/services/cache_manager.dart';
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/svg_utils.dart';

class PostActuImage extends StatelessWidget {
  final String url;

  const PostActuImage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = min(450, width);

    return ClipRRect(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
      child: Image(
        image: context.read<AppCacheManager>().getImage(url),
        height: height,
        width: width,
        fit: BoxFit.cover,
        loadingBuilder:
            (BuildContext context, Widget child, ImageChunkEvent? progress) {
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
                  toSvgIcon(
                    icon: Assets.iconsError,
                    color: Theme.of(context).colorScheme.onTertiaryContainer,
                    // size: 48
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Erreur de chargement de l'image",
                    style: TextStyle(
                        color:
                            Theme.of(context).colorScheme.onTertiaryContainer),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
