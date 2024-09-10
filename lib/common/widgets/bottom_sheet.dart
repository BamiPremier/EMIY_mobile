import 'package:flutter/material.dart';

Future<T?> showAppBottomSheet<T>(
    {required BuildContext context,
    required WidgetBuilder builder,
    bool isScrollControlled = false,
    double? maxHeight,
    double horizontalPadding = 56.0}) {
  return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: isScrollControlled,
      builder: (context) {
        return ConstrainedBox(
          constraints: BoxConstraints(
              maxHeight: maxHeight ??
                  MediaQuery.of(context).size.height -
                      112.0

                      /// [AppScaffold]'s height
                      -
                      24.0

              /// status bar height
              ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: SafeArea(
                  minimum: EdgeInsets.only(
                      left: horizontalPadding,
                      right: horizontalPadding,
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: builder(context),
                ),
              )
            ],
          ),
        );
      });
}
