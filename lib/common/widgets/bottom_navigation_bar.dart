import 'package:umai/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CocoBottomNavigationBar extends StatefulWidget {
  final List<BottomNavigationIcon> items;
  final ValueChanged<int>? onTap;
  final int? currentIndex;

  const CocoBottomNavigationBar(
      {super.key, required this.items, this.onTap, this.currentIndex});

  @override
  State<CocoBottomNavigationBar> createState() =>
      _CocoBottomNavigationBarState();
}

class _CocoBottomNavigationBarState extends State<CocoBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(20.0)),
      clipBehavior: Clip.antiAlias,
      color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
      elevation: Theme.of(context).bottomNavigationBarTheme.elevation ?? 4.0,
      child: SafeArea(
        child: AnimatedContainer(
          alignment: Alignment.center,
          curve: Curves.fastOutSlowIn,
          duration: kThemeAnimationDuration,
          height: kBottomNavigationBarHeight + 8.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: widget.items.asMap().entries.map((entry) {
              final child = GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => widget.onTap?.call(entry.key),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 8.0),
                  child: entry.value,
                ),
              );
              return entry.value.selected ? Flexible(child: child) : child;
            }).toList(),
          ),
        ),
      ),
    );
  }
}

const _kAnimationDuration = Duration(milliseconds: 100);

class BottomNavigationIcon extends StatelessWidget {
  final String icon;
  final String title;
  final bool selected;

  const BottomNavigationIcon(
      {super.key,
      required this.icon,
      required this.title,
      required this.selected});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        curve: Curves.easeOut,
        duration: _kAnimationDuration,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: selected ? Theme.of(context).primaryColor : null),
        padding: selected
            ? const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0)
            : null,
        child: AnimatedSize(
          curve: Curves.easeOut,
          duration: _kAnimationDuration,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                icon,
                alignment: Alignment.bottomCenter,
                colorFilter: ColorFilter.mode(
                    selected
                        ? ThemeApp.boldText
                        : ThemeApp.boldText.withOpacity(0.6),
                    BlendMode.srcIn),
                height: 24.0,
                width: 24.0,
              ),
              if (selected) ...[
                const SizedBox(width: 4.0),
                Flexible(
                  child: Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ]
            ],
          ),
        ));
  }
}
