import 'package:flutter/material.dart';

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
  final String? subText;
  final Widget? prefixIcon;
  const CustomTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      this.subText,
      this.prefixIcon,
      this.validator,
      this.focusNode,
      this.keyboardType,
      this.textCapitalization = TextCapitalization.none,
      this.textInputAction = TextInputAction.done,
      this.onEditingCompleted,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(
          height: 56,
          child: TextFormField(
            controller: controller,
            focusNode: focusNode,
            keyboardType: keyboardType,
            textCapitalization: textCapitalization,
            onChanged: onChanged,
            textInputAction: textInputAction,
            onEditingComplete: onEditingCompleted,
            validator: validator,
            style: Theme.of(context).inputDecorationTheme.labelStyle,
            decoration: InputDecoration(
              hintStyle: Theme.of(context).inputDecorationTheme.labelStyle,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.0),
                borderSide: BorderSide(color: Theme.of(context).disabledColor),
              ),
              hintText: hintText,
              filled: true,
              fillColor: Theme.of(context).colorScheme.surfaceContainerHighest,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.0),
                borderSide: BorderSide.none,
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              prefixStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant),
              prefixIcon: prefixIcon,
            ),
          )),
      if (subText != null)
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16)
              .add(const EdgeInsets.only(
            top: 4.0,
          )),
          child: Text(
            subText!,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
        ),
    ]);
  }
}
