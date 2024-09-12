import 'package:flutter/material.dart'; 

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final TextInputAction textInputAction;
  final void Function()? onEditingCompleted;
  final String? subText;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.subText,
    this.validator,
    this.focusNode,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction = TextInputAction.done,
    this.onEditingCompleted,
  });

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
      textInputAction: textInputAction,
      onEditingComplete: onEditingCompleted,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).dividerColor),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide:
              BorderSide(color: Theme.of(context).dividerColor, width: 2.0),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).dividerColor),
        ),
      ),
    ),
          ),
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
