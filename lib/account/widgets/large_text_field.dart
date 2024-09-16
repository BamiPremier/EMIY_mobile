import 'package:flutter/material.dart';

class LargeTextField extends StatelessWidget {
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
  const LargeTextField(
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            TextFormField(
              maxLines: 4,
              maxLength: 150,
              controller: controller,
              focusNode: focusNode,
              keyboardType: keyboardType,
              textCapitalization: textCapitalization,
              textInputAction: textInputAction,
              onEditingComplete: onEditingCompleted,
              validator: validator,
              cursorHeight: 16,
              onChanged: onChanged,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  borderSide:
                      BorderSide(color: Theme.of(context).disabledColor),
                ),
                hintText: hintText,
                filled: true,
                fillColor:
                    Theme.of(context).colorScheme.surfaceContainerHighest,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  borderSide: BorderSide.none,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                counterText: '',
              ),
            ),
            Positioned(
              right: 10,
              top: 10,
              child: Text(
                '$counter/150',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
