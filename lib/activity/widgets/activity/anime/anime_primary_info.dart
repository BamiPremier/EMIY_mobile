import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/animes/widgets/primary_info.dart';
import 'package:umai/common/bloc/anime_manip_cubit.dart';
import 'package:umai/utils/month_to_string.dart';
import 'package:umai/utils/themes.dart'; 

class ActivityAnimePrimaryInfo extends StatefulWidget {
  const ActivityAnimePrimaryInfo({super.key});

  @override
  State<ActivityAnimePrimaryInfo> createState() =>
      _ActivityAnimePrimaryInfoState();
}

class _ActivityAnimePrimaryInfoState extends State<ActivityAnimePrimaryInfo>
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
          if (anime.averageScore != null)
            Container(
                padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                decoration: BoxDecoration(
                  color: anime.averageScore! <= 35
                      ? AppTheme.lowRed
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
          if (anime.animeStatus != null) Status(status: anime.animeStatus!),
          if (anime.startDate != null)
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
        ],
      );
    });
  }
}
