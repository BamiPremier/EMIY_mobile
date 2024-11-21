import 'package:flutter/material.dart'; 

class ErrorBuilder extends StatelessWidget {
  final void Function() retry;

  const ErrorBuilder({super.key, required this.retry});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => retry,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Une erreur s'est produite"),
              TextButton(
                onPressed: retry,
                child: const Text("Réessayer"),
              )
            ],
          ),
        ));
  }
}
