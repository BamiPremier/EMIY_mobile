import 'package:potatoes/potatoes.dart';
import 'package:flutter/material.dart';

class ActivityTab extends StatefulWidget {
  const ActivityTab({super.key});

  @override
  State<ActivityTab> createState() => _ActivityTabState();
}

class _ActivityTabState extends State<ActivityTab> with CompletableMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 8, bottom: 16),
        alignment: Alignment.center,
        child: Text('Activites', style: Theme.of(context).textTheme.bodySmall));
  }
}
