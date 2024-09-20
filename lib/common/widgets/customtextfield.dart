import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final void Function(String)? onChanged;
  final TextInputAction textInputAction;
  final void Function()? onEditingCompleted;
  final Widget? prefixIcon;
  final String? helperText; //
  final List<TextInputFormatter>? inputFormatters; //
  const CustomTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      this.prefixIcon,
      this.validator,
      this.focusNode,
      this.keyboardType,
      this.textCapitalization = TextCapitalization.none,
      this.textInputAction = TextInputAction.done,
      this.onEditingCompleted,
      this.onChanged,
      this.helperText,
      this.inputFormatters});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      textCapitalization: textCapitalization,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      onChanged: onChanged,
      textInputAction: textInputAction,
      onEditingComplete: onEditingCompleted,
      inputFormatters: inputFormatters,
      validator: validator,
      style: Theme.of(context).inputDecorationTheme.labelStyle,
      decoration: InputDecoration(
        hintStyle: Theme.of(context).inputDecorationTheme.labelStyle,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Theme.of(context).disabledColor),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none),
        hintText: hintText,
        filled: true,
        fillColor: Theme.of(context).colorScheme.surfaceContainerHighest,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        prefixStyle: Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
        prefixIcon: prefixIcon,
        helperText: helperText,
        helperStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
      ),
    );
  }
}
