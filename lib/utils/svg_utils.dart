import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart'; 

SvgPicture toSvgIcon({
  required String icon,
  double? size = 20,
  Color? color
}) {
  return SvgPicture.asset(
    icon,
    height: size,
    width: size,
    colorFilter: color != null
      ? ColorFilter.mode(color, BlendMode.srcIn)
      : null
  );
}
