import 'dart:math';

import 'package:flutter/material.dart';
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/svg_utils.dart';
import 'package:umai/utils/themes.dart';

class ErrorBuilder extends StatelessWidget {
  final VoidCallback retry;
  final double? height;

  const ErrorBuilder({super.key, required this.retry, this.height});

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
                icon: Assets.iconsError,
                size: 56,
                color: AppTheme.disabledText,
              ),
              if (constraints.maxHeight > 132)
                ...[
                  const SizedBox(height: 32),
                  OutlinedButton(
                    onPressed: retry,
                    child: const Text('Réessayer'),
                  ),
                ]
            ],
          ),
        );
      }
    );
  }
}
