import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/activity/widgets/activity/activity_btn_type2.dart';
import 'package:umai/activity/widgets/activity/activity_head.dart';
import 'package:umai/activity/widgets/activity/anime/anime_info.dart';
import 'package:umai/animes/models/anime.dart';
import 'package:umai/animes/services/anime_cubit_manager.dart';
import 'package:umai/common/bloc/anime_manip_cubit.dart';
import 'package:umai/common/bloc/person_cubit.dart';
import 'package:umai/common/models/user.dart';
import 'package:umai/common/services/person_cubit_manager.dart';

class AnimeAddViewedWidget extends StatelessWidget {
  final String targetEntity;
  static Widget get(
      {required BuildContext context,
      required String targetEntity,
      required Anime anime,
      required User user}) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: context.read<AnimeCubitManager>().get(anime),
        ),
        BlocProvider<PersonCubit>.value(
          value: context.read<PersonCubitManager>().get(user),
        ),
      ],
      child: AnimeAddViewedWidget._(targetEntity: targetEntity),
    );
  }

  const AnimeAddViewedWidget._({required this.targetEntity});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnimeManipCubit, AnimeManipState>(
      builder: (context, state) {
        final personCubit = context.read<PersonCubit>();

        final user = personCubit.user;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ActivityHeadWidget.get(
                targetEntity: targetEntity, context: context, user: user),
            const SizedBox(height: 8),
            const AnimeInfo(),
            const ActivityBtnType2Widget(),
          ],
        );
      },
    );
  }
}
