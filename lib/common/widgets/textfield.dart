import 'package:umai/common/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UmaiTextField extends StatefulWidget {
  final bool autoFocus;
  final TextEditingController? controller;
  final InputDecoration? decoration;
  final bool enabled;
  final bool? enableInteractiveSelection;
  final FocusNode? focusNode;
  final String? initialValue;
  final String? subText;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final int? maxLines;
  final int? minLines;
  final TextCapitalization textCapitalization;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingCompleted;
  final VoidCallback? onTap;
  final bool readOnly;
  final TextAlign textAlign;
  final String? Function(String?)? validator;

  const UmaiTextField(
      {super.key,
      this.subText,
      this.autoFocus = false,
      this.controller,
      this.decoration,
      this.enabled = true,
      this.enableInteractiveSelection,
      this.focusNode,
      this.initialValue,
      this.inputFormatters,
      this.maxLength,
      this.maxLengthEnforcement,
      this.maxLines = 1,
      this.minLines,
      this.textCapitalization = TextCapitalization.none,
      this.textInputAction,
      this.keyboardType,
      this.obscureText = false,
      this.onChanged,
      this.onEditingCompleted,
      this.onTap,
      this.readOnly = false,
      this.textAlign = TextAlign.start,
      this.validator});

  @override
  State<UmaiTextField> createState() => _UmaiTextFieldState();
}

class _UmaiTextFieldState extends State<UmaiTextField> {
  late bool _textVisible = !widget.obscureText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          autofocus: widget.autoFocus,
          controller: widget.controller,
          decoration: (widget.decoration ?? const InputDecoration()).copyWith(),
          enabled: widget.enabled,
          enableInteractiveSelection: widget.enableInteractiveSelection,
          focusNode: widget.focusNode,
          initialValue: widget.initialValue,
          inputFormatters: widget.inputFormatters,
          maxLength: widget.maxLength,
          maxLengthEnforcement: widget.maxLengthEnforcement,
          maxLines: widget.maxLines,
          minLines: widget.minLines,
          textCapitalization: widget.textCapitalization,
          textInputAction: widget.textInputAction,
          keyboardType: widget.keyboardType,
          obscureText: widget.obscureText && !_textVisible,
          onChanged: widget.onChanged,
          onEditingComplete: widget.onEditingCompleted,
          onTap: widget.onTap,
          readOnly: widget.readOnly,
          textAlign: widget.textAlign,
          style: Theme.of(context).textTheme.bodyMedium,
          validator: widget.validator,
        ),
        if (widget.subText != null)
          Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: Text(
              widget.subText!,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
      ],
    );
  }
}
