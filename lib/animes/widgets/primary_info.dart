 
import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart'; 
import 'package:umai/common/bloc/anime_manip_cubit.dart'; 
import 'package:umai/utils/month_to_string.dart';
import 'package:umai/utils/themes.dart';
import 'package:umai/animes/models/anime.dart';

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
          if (anime.episodes != null)
            Container(
                padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  "${anime.episodes} épisode${anime.episodes! < 2 ? '' : 's'}",
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                )),
          if (anime.animeStatus != null)
            Status(status: anime.animeStatus!)
        ],
      );
    });
  }
}

class Status extends StatelessWidget {
  final AnimeStatus status;

  const Status({required this.status});

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor, foregroundColor;
    switch (status) {
      case AnimeStatus.notYetReleased:
        backgroundColor = AppTheme.disabledText;
        foregroundColor = AppTheme.white;
      case AnimeStatus.releasing:
        backgroundColor = Theme.of(context).colorScheme.surfaceContainerHighest;
        foregroundColor = Theme.of(context).colorScheme.onSurfaceVariant;
      case AnimeStatus.finished:
        backgroundColor = AppTheme.green;
        foregroundColor = AppTheme.onHighGreen;
      case AnimeStatus.cancelled:
        backgroundColor = AppTheme.lowRed;
        foregroundColor = AppTheme.white;
      case AnimeStatus.hiatus:
        backgroundColor = AppTheme.lowRed;
        foregroundColor = AppTheme.white;
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        status.displayValue,
        style: Theme.of(context).textTheme.labelSmall!.copyWith(
          color: foregroundColor,
        ),
      )
    );
  }
}

