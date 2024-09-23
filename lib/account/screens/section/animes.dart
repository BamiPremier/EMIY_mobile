import 'package:potatoes/auto_list/bloc/auto_list_cubit.dart';
import 'package:potatoes/auto_list/models/paginated_list.dart';
import 'package:potatoes/auto_list/widgets/auto_list_view.dart';
import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';
import 'package:flutter/material.dart';
import 'package:umai/account/services/account_service.dart';
import 'package:umai/common/models/anime_response.dart';
import 'package:umai/common/widgets/anime_item.dart';

class Animes extends StatefulWidget {
  const Animes({super.key});

  @override
  State<Animes> createState() => _AnimesState();
}

class _AnimesState extends State<Animes> with CompletableMixin {
  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                onTap: () {
                  print(anime.id);  
                }),
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
                )));
  }
}
