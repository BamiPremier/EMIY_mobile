import 'package:flutter/material.dart';

class CommentTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final TextInputAction textInputAction;
  final void Function()? onEditingCompleted;
  final Widget? prefixIcon;
  final int counter;

  final void Function(String)? onChanged;
  const CommentTextField(
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
      this.counter = 0,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      minLines: 6,
      maxLines: 15,
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      textCapitalization: textCapitalization,
      textInputAction: textInputAction,
      onEditingComplete: onEditingCompleted,
      validator: validator,
      cursorHeight: 16,
      style: Theme.of(context).inputDecorationTheme.labelStyle,
      onChanged: onChanged,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
          borderSide: BorderSide(color: Theme.of(context).disabledColor),
        ),
        hintText: hintText,
        hintStyle: Theme.of(context).inputDecorationTheme.labelStyle,
        filled: true,
        fillColor: Theme.of(context).colorScheme.surfaceContainerHighest,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        counterText: '',
      ),
    );
  }
}
