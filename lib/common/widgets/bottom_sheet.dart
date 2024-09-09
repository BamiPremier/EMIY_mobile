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
              const SizedBox(height: 12.0),
              // Container(
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(10.0),
              //     color: Theme.of(context).disabledColor
              //   ),
              //   height: 4.0,
              //   width: 40.0,
              // ),
              const SizedBox(height: 32.0),
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
