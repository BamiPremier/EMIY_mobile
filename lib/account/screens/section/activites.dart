import 'package:potatoes/potatoes.dart';
import 'package:flutter/material.dart';

class Activite extends StatefulWidget {
  const Activite({super.key});

  @override
  State<Activite> createState() => _ActiviteState();
}

class _ActiviteState extends State<Activite> with CompletableMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 8, bottom: 16),
        alignment: Alignment.center,
        child: Text('Activites', style: Theme.of(context).textTheme.bodySmall));
  }
}
