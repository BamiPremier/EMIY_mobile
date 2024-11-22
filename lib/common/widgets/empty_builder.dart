import 'dart:math';

import 'package:flutter/material.dart';
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/svg_utils.dart';
import 'package:umai/utils/themes.dart';

class EmptyBuilder extends StatelessWidget {
  final double? height;

  const EmptyBuilder({super.key, this.height});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxHeight < 56) return const SizedBox();

        return Container(
          alignment: Alignment.center,
          height: height == null ? null : max(56, height!),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              toSvgIcon(
                icon: Assets.iconsEmpty,
                size: 56,
                color: AppTheme.disabledText,
              ),
              if (constraints.maxHeight > 132)
                ...[
                  const SizedBox(height: 32),
                  SizedBox(
                    width: 130,
                    child: Text(
                      'Aucun élément disponible',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: AppTheme.disabledText,
                      ),
                    ),
                  ),
                ]
            ],
          ),
        );
      }
    );
  }
}
