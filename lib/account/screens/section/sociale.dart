import 'package:potatoes/potatoes.dart';
import 'package:umai/account/widgets/post_widget.dart';
import 'package:flutter/material.dart';

class Sociale extends StatefulWidget {
  const Sociale({super.key});

  @override
  State<Sociale> createState() => _SocialeState();
}

class _SocialeState extends State<Sociale> with CompletableMixin {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10, // Nombre d'éléments dans la liste
      itemBuilder: (context, index) {
        return PostCard();
      },
    );
  }
}
