import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:potatoes/libs.dart';
import 'package:readmore/readmore.dart';
import 'package:umai/animes/models/anime.dart';
import 'package:umai/animes/services/anime_cubit_manager.dart';
import 'package:umai/common/bloc/anime_manip_cubit.dart';
import 'package:umai/common/widgets/action_widget.dart';
import 'package:umai/common/widgets/bottom_sheet.dart';
import 'package:umai/common/widgets/buttons.dart';
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/monthToString.dart';
import 'package:umai/utils/themes.dart';

class QuizInfo extends StatefulWidget {
  const QuizInfo({super.key});

  @override
  State<QuizInfo> createState() => _QuizInfoState();
}

class _QuizInfoState extends State<QuizInfo>
    with SingleTickerProviderStateMixin {
  late final animeManipCubit = context.read<AnimeManipCubit>();

  final isCollapsed = ValueNotifier<bool>(true);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ListTile(
          title: Text(
            "Animes de foot (version intermédiaire)",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          contentPadding: const EdgeInsets.only(
            top: 8.0,
          ),
          subtitle: Text(
            "Lorem ipsum dolor sit amet consectetur. Placerat dui vitae placerat ac augue. Utahimeipsum dolor sit amet consectetur. Placerat dui vitae placerat ac augue. Utahime",
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: AppTheme.disabledText,
                ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            SvgPicture.asset(
              Assets.iconStar,
            ),
            const SizedBox(width: 8),
            Text(
              "Captain Tsubasa: Road to 2002",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            SvgPicture.asset(
              Assets.defaultAvatar,
              height: 20,
              width: 20,
            ),
            const SizedBox(width: 8),
            Text(
              "Hari randoll",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ],
    );
  }
}
