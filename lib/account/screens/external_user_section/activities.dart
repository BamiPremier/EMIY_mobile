import 'package:potatoes/potatoes.dart';
import 'package:flutter/material.dart';

class EActivityTab extends StatefulWidget {
  const EActivityTab({super.key});

  @override
  State<EActivityTab> createState() => _EActivityTabState();
}

class _EActivityTabState extends State<EActivityTab> with CompletableMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 8, bottom: 16),
        alignment: Alignment.center,
        child: Text('Activites', style: Theme.of(context).textTheme.bodySmall));
  }
}
