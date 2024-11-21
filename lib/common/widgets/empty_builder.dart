 
import 'package:flutter/material.dart';
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/svg_utils.dart'; 

class EmptyBuilder extends StatelessWidget {
  const EmptyBuilder();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: toSvgIcon(
        icon: Assets.iconsEmpty,
        size: 56,
      ),
    );
  }
}
