import 'package:flutter/material.dart';
import 'package:umai/utils/themes.dart';

class ActionWidget extends StatelessWidget {
  const ActionWidget(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTap});
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          // Cercle avec l'icône de partage
          CircleAvatar(
            backgroundColor:
                ThemeApp.disabledGreySurface, // Couleur d'arrière-plan
            child: Icon(icon),
          ),
          const SizedBox(width: 16),
          // Texte "Partager..."
          Text(
            title,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}
