import 'package:flutter/material.dart';
import 'package:umai/utils/app_dimension.dart';
import 'package:umai/utils/themes.dart';

class UserProfileItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String description;
  final VoidCallback onFollowPressed;

  const UserProfileItem({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.onFollowPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          // Image circulaire à gauche
          CircleAvatar(
            radius: 28,
            backgroundImage: AssetImage(imageUrl),
          ),
          const SizedBox(width: 16),
          // Colonne au milieu avec nom et description
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: Theme.of(context).textTheme.bodyLarge),
                Text(
                  description,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(color: Theme.of(context).colorScheme.secondary),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          // Bouton "Suivre" à droite
          ElevatedButton.icon(
            onPressed: onFollowPressed,
            icon: const Icon(Icons.add),
            label:
                Text('Suivre', style: Theme.of(context).textTheme.labelLarge),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    100), // Ajustez la valeur pour plus ou moins d'arrondi
              ),
            ),
          ),
        ],
      ),
    );
  }
}
