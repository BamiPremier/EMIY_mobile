import 'package:flutter/material.dart';
import 'package:potatoes/auto_list/bloc/auto_list_cubit.dart';
import 'package:potatoes/auto_list/widgets/auto_list_view.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/animes/models/anime.dart';
import 'package:umai/animes/services/anime_service.dart';
import 'package:umai/animes/widgets/item_anime.dart';

class AnimeHomeScreen extends StatefulWidget {
  const AnimeHomeScreen({super.key});

  @override
  State<AnimeHomeScreen> createState() => _AnimeHomeScreenState();
}

class _AnimeHomeScreenState extends State<AnimeHomeScreen> {
  int isSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FilterChip(
                  label: const Text("Tendances"),
                  selectedColor:
                      Theme.of(context).colorScheme.tertiaryContainer,
                  labelStyle: isSelected == 0
                      ? Theme.of(context).textTheme.labelLarge!.copyWith(
                          color:
                              Theme.of(context).colorScheme.onTertiaryContainer)
                      : Theme.of(context).primaryTextTheme.labelLarge!.copyWith(
                          color:
                              Theme.of(context).colorScheme.onSurfaceVariant),
                  selected: isSelected == 0,
                  onSelected: (selected) {
                    setState(() {
                      isSelected = 0;
                    });
                  },
                  side: isSelected == 0
                      ? BorderSide.none
                      : BorderSide(
                          color:
                              Theme.of(context).colorScheme.onSurfaceVariant),
                  showCheckmark: false,
                ),
                FilterChip(
                  label: const Text("Saison prochaine"),
                  selectedColor:
                      Theme.of(context).colorScheme.tertiaryContainer,
                  labelStyle: isSelected == 1
                      ? Theme.of(context).textTheme.labelLarge!.copyWith(
                          color:
                              Theme.of(context).colorScheme.onTertiaryContainer)
                      : Theme.of(context).primaryTextTheme.labelLarge!.copyWith(
                          color:
                              Theme.of(context).colorScheme.onSurfaceVariant),
                  selected: isSelected == 1,
                  side: isSelected == 1
                      ? BorderSide.none
                      : BorderSide(
                          color:
                              Theme.of(context).colorScheme.onSurfaceVariant),
                  onSelected: (selected) {
                    setState(() {
                      isSelected = 1;
                    });
                  },
                ),
                FilterChip(
                  label: const Text("Tous"),
                  selectedColor:
                      Theme.of(context).colorScheme.tertiaryContainer,
                  labelStyle: isSelected == 2
                      ? Theme.of(context).textTheme.labelLarge!.copyWith(
                          color:
                              Theme.of(context).colorScheme.onTertiaryContainer)
                      : Theme.of(context).primaryTextTheme.labelLarge!.copyWith(
                          color:
                              Theme.of(context).colorScheme.onSurfaceVariant),
                  side: isSelected == 2
                      ? BorderSide.none
                      : BorderSide(
                          color:
                              Theme.of(context).colorScheme.onSurfaceVariant),
                  selected: isSelected == 2,
                  onSelected: (selected) {
                    setState(() {
                      isSelected = 2;
                    });
                  },
                ),
              ],
            )),
        Expanded(
            child: AutoListView.get<Anime>(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                cubit: AutoListCubit(
                  provider: context.read<AnimeService>().getAnimes
                ),
                viewType: ViewType.grid,
                itemBuilder: (context, anime) => AnimeItem(anime: anime),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 2.0,
                    mainAxisSpacing: 2.0,
                    childAspectRatio: .65),
                errorBuilder: (context, retry) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text("An error occured"),
                        TextButton(
                          onPressed: retry,
                          child: const Text("Retry"),
                        )
                      ],
                    )))
      ],
    );
  }
}
