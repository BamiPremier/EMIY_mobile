import 'package:flutter/material.dart';
import 'package:potatoes/auto_list/widgets/auto_list_view.dart';
import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';
import 'package:umai/account/bloc/user_watxhlist_cubit.dart';
import 'package:umai/animes/models/anime.dart';
import 'package:umai/animes/widgets/item_anime.dart';
import 'package:umai/common/bloc/person_cubit.dart';

class WatchList extends StatefulWidget {
  final bool currentUser;
  WatchList({super.key, this.currentUser = true});

  @override
  State<WatchList> createState() => _WatchListState();
}

class _WatchListState extends State<WatchList> with CompletableMixin {
  late final userWatchlistCubit;
  @override
  void initState() {
    super.initState();

    if (widget.currentUser) {
      userWatchlistCubit = UserWatchlistCubit(
        cubitManager: context.read(),
        userService: context.read(),
      );
    } else {
      late final personCubit = context.read<PersonCubit>();
      userWatchlistCubit = UserWatchlistCubit(
        cubitManager: context.read(),
        userService: context.read(),
        userId: personCubit.user.id,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AutoListView.get<Anime>(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        cubit: userWatchlistCubit,
        viewType: ViewType.grid,
        itemBuilder: (context, anime) =>
            AnimeItem.get(context: context, anime: anime, withAction: true),
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
