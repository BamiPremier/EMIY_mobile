import 'package:flutter/material.dart';

import 'package:potatoes/auto_list/widgets/auto_list_view.dart';
import 'package:umai/common/widgets/empty_builder.dart';
import 'package:umai/common/widgets/error_builder.dart'; 
import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';
import 'package:umai/account/bloc/user_anime_cubit.dart';
import 'package:umai/animes/models/anime.dart';
import 'package:umai/animes/widgets/item_anime.dart';
import 'package:umai/common/bloc/person_cubit.dart';

class AnimesTab extends StatefulWidget {
  final bool currentUser;

  const AnimesTab({super.key, this.currentUser = true});

  @override
  State<AnimesTab> createState() => _AnimesTabState();
}

class _AnimesTabState extends State<AnimesTab> with CompletableMixin {
  late final userAnimeCubit;
  @override
  void initState() {
    super.initState();

    if (widget.currentUser) {
      userAnimeCubit = UserAnimeCubit(
        cubitManager: context.read(),
        userService: context.read(),
      );
    } else {
      late final personCubit = context.read<PersonCubit>();
      userAnimeCubit = UserAnimeCubit(
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
        cubit: userAnimeCubit,
        viewType: ViewType.grid,
        itemBuilder: (context, anime) =>
            AnimeItem.get(context: context, anime: anime, withSelect: false),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 2.0,
            mainAxisSpacing: 2.0,
            childAspectRatio: .65),
        emptyBuilder: (ctx) => const EmptyBuilder(),
        errorBuilder: (context, retry) => ErrorBuilder(retry: retry));
  }
}
