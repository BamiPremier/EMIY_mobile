import 'package:flutter/material.dart';
import 'package:potatoes/auto_list/bloc/auto_list_cubit.dart';
import 'package:potatoes/auto_list/widgets/auto_list_view.dart';
import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';
import 'package:umai/account/bloc/user_anime_cubit.dart';
import 'package:umai/animes/models/anime.dart';
import 'package:umai/animes/widgets/item_anime.dart';
import 'package:umai/common/services/user_service.dart';

class AnimesTab extends StatefulWidget {
  const AnimesTab({super.key});

  @override
  State<AnimesTab> createState() => _AnimesTabState();
}

class _AnimesTabState extends State<AnimesTab> with CompletableMixin {
  late final userAnimeCubit = UserAnimeCubit(
    cubitManager: context.read(),
    userService: context.read(),
  );

  @override
  Widget build(BuildContext context) {
    return AutoListView.get<Anime>(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        cubit: userAnimeCubit,
        viewType: ViewType.grid,
        itemBuilder: (context, anime) =>
            AnimeItem.get(context: context, anime: anime, withAction: true),
        shrinkWrap: true,
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
            ));
  }
}
