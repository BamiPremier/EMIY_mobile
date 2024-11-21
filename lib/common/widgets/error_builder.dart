import 'package:flutter/material.dart';
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/svg_utils.dart';
import 'package:umai/utils/themes.dart';

class ErrorBuilder extends StatelessWidget {
  final void Function() retry;

  const ErrorBuilder({super.key, required this.retry});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => retry,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              toSvgIcon(
                icon: Assets.iconsError,
                size: 56,
                color: AppTheme.disabledText,
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: 133,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.white,
                    foregroundColor: AppTheme.white,
                    textStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant),
                    side: BorderSide(
                      width: 2,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                  onPressed: retry,
                  child: Text(
                    'Réessayer',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
