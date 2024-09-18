import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UmaiBackButton extends StatelessWidget {
  const UmaiBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: Navigator.of(context).maybePop,
          child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(4.0)),
            height: 32.0,
            width: 32.0,
            child: const Icon(CupertinoIcons.chevron_back),
          ),
        ),
      ],
    );
  }
}
