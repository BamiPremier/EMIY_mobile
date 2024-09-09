import 'package:umai/common/widgets/buttons.dart';
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ErrorContainer extends StatelessWidget {
  final String? text;
  final VoidCallback? onRetry;

  const ErrorContainer({super.key, this.text, this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: const Alignment(0, -0.2),
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            Assets.iconsError,
            height: 64.0,
            width: 64.0,
          ),
          const SizedBox(height: 32.0),
          Text(
            "Une erreur s'est produite",
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 64.0),
          Text(
            text ?? 'Impossible d\'afficher la page que vous souhaitez',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: ThemeApp.disabledText,
                ),
            textAlign: TextAlign.center,
          ),
          if (onRetry != null) ...[
            const SizedBox(height: 32.0),
            SizedBox(
              width: 200,
              child: UmaiButton.tertiary(
                onPressed: onRetry,
                text: 'Réessayer',
              ),
            )
          ]
        ],
      ),
    );
  }
}
