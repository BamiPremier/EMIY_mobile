import 'package:flutter/material.dart';
import 'package:umai/utils/themes.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: InkWell(
        child: const Icon(Icons.arrow_back, color: ThemeApp.mainText),
        onTap: () => Navigator.of(context).pop(),
      ),
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleSmall
            ?.copyWith(color: ThemeApp.mainText),
      ),
      // backgroundColor: Theme.of(context).primaryColor,
      // centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
