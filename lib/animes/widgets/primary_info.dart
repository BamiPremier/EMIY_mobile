import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:readmore/readmore.dart';
import 'package:umai/animes/models/anime.dart';
import 'package:umai/animes/services/anime_cubit_manager.dart';
import 'package:umai/common/bloc/anime_manip_cubit.dart';
import 'package:umai/common/widgets/action_widget.dart';
import 'package:umai/common/widgets/bottom_sheet.dart';
import 'package:umai/common/widgets/buttons.dart';
import 'package:umai/utils/monthToString.dart';
import 'package:umai/utils/themes.dart';

class PrimaryInfo extends StatefulWidget {
  const PrimaryInfo({super.key});

  @override
  State<PrimaryInfo> createState() => _PrimaryInfoState();
}

class _PrimaryInfoState extends State<PrimaryInfo>
    with SingleTickerProviderStateMixin {
  late final animeManipCubit = context.read<AnimeManipCubit>();

  final isCollapsed = ValueNotifier<bool>(true);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnimeManipCubit, AnimeManipState>(
        builder: (context, state) {
      final anime = animeManipCubit.anime;
      return Wrap(
        spacing: 8,
        runSpacing: 2,
        children: [
          Container(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
              decoration: BoxDecoration(
                color: anime.averageScore! <= 35
                    ? AppTheme.midRed
                    : anime.averageScore! <= 70
                        ? AppTheme.midOrange
                        : AppTheme.green,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                "${anime.averageScore}",
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: anime.averageScore! <= 35
                          ? Colors.white
                          : anime.averageScore! <= 70
                              ? AppTheme.onMidOrange
                              : AppTheme.onHighGreen,
                    ),
              )),
          Container(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                "${monthToString(anime.startDate?.month ?? 0)} ${anime.startDate?.year ?? ''}",
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              )),
          Container(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                "${anime.episodes} épisodes",
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              )),
          anime.endDate != null && anime.endDate!.year! > DateTime.now().year
              ? Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                  decoration: BoxDecoration(
                    color:
                        Theme.of(context).colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    "En cours",
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                  ))
              : Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                  decoration: BoxDecoration(
                    color: AppTheme.green,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    "Terminé",
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(color: AppTheme.onHighGreen),
                  )),
        ],
      );
    });
  }
}
