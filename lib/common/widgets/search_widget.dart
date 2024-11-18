import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/common/bloc/user_cubit.dart';
import 'package:umai/common/services/cache_manager.dart';
import 'package:umai/common/widgets/home_search_anime_delegate.dart';
import 'package:umai/common/widgets/home_search_user_delegate.dart';
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/svg_utils.dart';
import 'package:umai/utils/themes.dart';

class SearchWidget extends StatelessWidget {
  final int index;

  const SearchWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => onTap(context: context, index: index),
        child: Row(
          children: [
            Container(
              height: 40,
              width: 40,
              clipBehavior: Clip.hardEdge,
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: AppTheme.errorRed),
              child: toSvgIcon(
                icon: Assets.iconsSearch,
                size: 24,
                color: AppTheme.white,
              ),
            ),
            const SizedBox(width: 16.0)
          ],
        ));
  }

  onTap({required BuildContext context, required int index}) {
    if ([2, 3].contains(index)) {
      showSearch(
        context: context,
        delegate: HomeSearchAnimeDelegate(context),
      );
    }
    if ([0, 1].contains(index)) {
      showSearch(
        context: context,
        delegate: HomeSearchUserDelegate(context),
      );
    }
  }
}
