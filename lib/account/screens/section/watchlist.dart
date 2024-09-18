import 'package:potatoes/potatoes.dart';
import 'package:flutter/material.dart';

class WatchList extends StatefulWidget {
  const WatchList({super.key});

  @override
  State<WatchList> createState() => _WatchListState();
}

class _WatchListState extends State<WatchList> with CompletableMixin {
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
