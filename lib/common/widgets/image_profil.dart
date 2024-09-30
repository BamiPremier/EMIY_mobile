import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:umai/common/models/user.dart';
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/themes.dart';

class ImageProfil extends StatelessWidget {
  final String image;
  final double height;
  final double width;

  const ImageProfil({
    super.key,
    required this.image,
    this.height = 80,
    this.width = 80,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      height: height,
      width: width,
      fit: BoxFit.cover,
      imageBuilder: (context, imageProvider) => CircleAvatar(
        radius: height / 2,
        backgroundImage: imageProvider,
      ),
      placeholder: (context, url) => SvgPicture.asset(
        Assets.defaultAvatar,
        height: height,
        width: width,
      ),
      errorWidget: (context, url, error) => SvgPicture.asset(
        Assets.defaultAvatar,
        height: height,
        width: width,
      ),
    );
  }
}
