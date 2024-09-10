import 'package:flutter/material.dart';
import 'package:umai/utils/app_dimension.dart';
import 'package:umai/utils/themes.dart';

enum _ButtonHierarchy { primary, secondary, tertiary, quaternary }

class UmaiButton extends StatelessWidget {
  final _ButtonHierarchy _hierarchy;
  final VoidCallback? onPressed;
  final String text;
  final bool large;

  const UmaiButton.primary({
    super.key,
    required this.onPressed,
    required this.text,
    this.large = true,
  }) : _hierarchy = _ButtonHierarchy.primary;

  const UmaiButton.secondary({
    super.key,
    required this.onPressed,
    required this.text,
    this.large = true,
  }) : _hierarchy = _ButtonHierarchy.secondary;

  const UmaiButton.tertiary({
    super.key,
    required this.onPressed,
    required this.text,
    this.large = true,
  }) : _hierarchy = _ButtonHierarchy.tertiary;

  const UmaiButton.quaternary({
    super.key,
    required this.onPressed,
    required this.text,
    this.large = true,
  }) : _hierarchy = _ButtonHierarchy.quaternary;

  Color _backgroundColor(BuildContext context) {
    switch (_hierarchy) {
      case _ButtonHierarchy.primary:
        if (large) {
          return Theme.of(context).colorScheme.primary;
        }
        return Theme.of(context).colorScheme.primaryContainer;
      case _ButtonHierarchy.secondary:
        return ThemeApp.white;
      case _ButtonHierarchy.tertiary:
        return Theme.of(context).colorScheme.primaryContainer;
      case _ButtonHierarchy.quaternary:
        return Theme.of(context).disabledColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttonStyle;
    if (large) {
      buttonStyle = ElevatedButton.styleFrom(
        backgroundColor: _backgroundColor(context),
        minimumSize: const Size.fromHeight(45.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.0)),
      );
    } else {
      buttonStyle = ElevatedButton.styleFrom(
        backgroundColor: _backgroundColor(context),
        minimumSize: const Size(0, 24.0),
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.0)),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      );
    }

    return ElevatedButton(
      onPressed: onPressed,
      style: buttonStyle,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.labelLarge,
      ),
    );
  }
}
