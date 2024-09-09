import 'package:flutter/material.dart';
import 'package:umai/utils/app_dimension.dart';

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
    Key? key,
    required this.controller,
    required this.hintText,
    this.subText,
    this.validator,
    this.focusNode,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction = TextInputAction.done,
    this.onEditingCompleted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      TextFormField(
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
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).primaryColor, width: 2.0),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
        ),
      ),
      if (subText != null)
        Container(
          margin: const EdgeInsets.symmetric(
              vertical: 8.0, horizontal: Dimension.kMarginX / 2),
          child: Text(
            subText!,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
    ]));
  }
}
