import 'package:flutter/material.dart'; 
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
    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        backgroundColor: _backgroundColor(context),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.labelLarge,
      ),
    );
  }
}
