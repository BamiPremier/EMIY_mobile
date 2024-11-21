import 'package:flutter/material.dart';
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/svg_utils.dart';
import 'package:umai/utils/themes.dart';

class EmptyBuilder extends StatelessWidget {
  const EmptyBuilder();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          toSvgIcon(
            icon: Assets.iconsEmpty,
            size: 56,
            color: AppTheme.disabledText,
          ),
          const SizedBox(height: 32),
          Container(
            width: 130,
            child: Text(
              'Aucun élément disponible',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: AppTheme.disabledText,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
