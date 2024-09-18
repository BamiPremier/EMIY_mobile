import 'package:potatoes/potatoes.dart';
import 'package:flutter/material.dart';

class Animes extends StatefulWidget {
  const Animes({super.key});

  @override
  State<Animes> createState() => _AnimesState();
}

class _AnimesState extends State<Animes> with CompletableMixin {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 2.0,
          mainAxisSpacing: 2.0,
          childAspectRatio: .65),
      itemCount: 30,
      itemBuilder: (context, index) {
        return Container(
          color: Colors.grey,
          child: const Center(
            child: Text(
              '',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }
}
