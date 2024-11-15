import 'package:flutter/material.dart';
import 'package:umai/utils/themes.dart';

class ActionWidget extends StatelessWidget {
  final String title;
  final Widget icon;
  final VoidCallback onTap;

  const ActionWidget(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppTheme.lightGrey,
            child: icon,
          ),
          const SizedBox(width: 16),
          Text(
            title,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}
