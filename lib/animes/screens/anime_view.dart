import 'package:flutter/material.dart';
import 'package:umai/animes/screens/anime_info.dart';
import 'package:umai/utils/themes.dart';
import 'package:potatoes/auto_list/bloc/auto_list_cubit.dart';
import 'package:potatoes/auto_list/models/paginated_list.dart';
import 'package:potatoes/auto_list/widgets/auto_list_view.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/account/services/account_service.dart';
import 'package:umai/common/models/anime_response.dart';
import 'package:umai/common/widgets/anime_item.dart';

class AnimeView extends StatefulWidget {
  const AnimeView({super.key});

  @override
  State<AnimeView> createState() => _AnimeViewState();
}

class _AnimeViewState extends State<AnimeView> {
  int isSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FilterChip(
                  label: const Text("Tendances"),
                  selectedColor:
                      Theme.of(context).colorScheme.tertiaryContainer,
                  labelStyle: Theme.of(context)
                      .primaryTextTheme
                      .labelLarge!
                      .copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onTertiaryContainer),
                  selected: isSelected == 0,
                  onSelected: (selected) {
                    setState(() {
                      isSelected = 0;
                    });
                  },
                ),
                FilterChip(
                  label: const Text("Saison prochaine"),
                  selectedColor:
                      Theme.of(context).colorScheme.tertiaryContainer,
                  labelStyle: Theme.of(context)
                      .primaryTextTheme
                      .labelLarge!
                      .copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onTertiaryContainer),
                  selected: isSelected == 1,
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
                  labelStyle: Theme.of(context)
                      .primaryTextTheme
                      .labelLarge!
                      .copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onTertiaryContainer),
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
                    provider: ({int page = 1}) => context
                            .read<AccountService>()
                            .getAnimeView(
                              page: page,
                            )
                            .then((p) {
                          return PaginatedList(
                              items: p.content, page: p.page, total: p.total);
                        })),
                viewType: ViewType.grid,
                itemBuilder: (context, anime) => AnimeItem(
                    anime: anime,
                    onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const AnimeInfoScreen()),
                        )),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 2.0,
                    mainAxisSpacing: 2.0,
                    childAspectRatio: .65),
                emptyBuilder: (context) => const Center(
                      child: Text("Empty list"),
                    ),
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
