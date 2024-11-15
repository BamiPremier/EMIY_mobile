import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart'; 

SvgPicture toSvgIcon(
    {required String icon,
    double? height = 24,
    double? width = 24,
    Color? color}) {
  return SvgPicture.asset(icon,
      height: height,
      width: width,
      colorFilter: ColorFilter.mode(color ?? Colors.black, BlendMode.srcIn));
}
