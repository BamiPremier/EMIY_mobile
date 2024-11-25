import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:readmore/readmore.dart';
import 'package:umai/account/screens/person_account.dart';
import 'package:umai/activitie/widgets/activitie/actu_btn_type1.dart';
import 'package:umai/activitie/widgets/activitie/actu_btn_type2.dart';
import 'package:umai/activitie/widgets/activitie/actu_btn_type3.dart';
import 'package:umai/activitie/widgets/activitie/actu_head.dart';
import 'package:umai/activitie/widgets/activitie/anime/anime_add_viewed.dart';
import 'package:umai/animes/bloc/episode_cubit.dart';
import 'package:umai/animes/models/anime.dart';
import 'package:umai/animes/models/episode.dart';
import 'package:umai/animes/services/anime_cubit_manager.dart';
import 'package:umai/common/bloc/anime_manip_cubit.dart';
import 'package:umai/common/bloc/common_cubit.dart';
import 'package:umai/common/bloc/person_cubit.dart';
import 'package:umai/common/models/user.dart';
import 'package:umai/common/services/cache_manager.dart';
import 'package:umai/common/services/person_cubit_manager.dart';
import 'package:umai/common/services/report_util_service.dart';
import 'package:umai/common/widgets/bottom_sheet.dart';
import 'package:umai/common/widgets/buttons.dart';
import 'package:umai/common/widgets/profile_picture.dart';
import 'package:umai/social/bloc/post_cubit.dart';
import 'package:umai/social/models/post.dart';
import 'package:umai/social/services/social_service.dart';
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/svg_utils.dart';
import 'package:umai/utils/themes.dart';
import 'package:umai/animes/services/episode_cubit_manager.dart';
import 'package:umai/utils/time_elapsed.dart';

class LikeEpisodeWidget extends StatelessWidget {
  static Widget get(
      {required BuildContext context,
      required Episode episode,
      required User user}) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PersonCubit>.value(
          value: context.read<PersonCubitManager>().get(user),
        ),
        BlocProvider.value(
          value: context.read<EpisodeCubitManager>().get(episode),
        ),
      ],
      child: const LikeEpisodeWidget._(),
    );
  }

  const LikeEpisodeWidget._();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EpisodeCubit, XCommonState>(
      listener: (context, state) {},
      builder: (context, state) {
        Episode episode = context.read<EpisodeCubit>().x as Episode;

        final personCubit = context.read<PersonCubit>();
        final user = personCubit.user;
        return Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ActuHeadWidget.get(
                  context: context, action: " a aimé", user: user),
              const SizedBox(height: 8),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(8)
                      .add(const EdgeInsets.only(left: 8)),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onInverseSurface,
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image(
                          image: context
                              .read<AppCacheManager>()
                              .getAnimeImage(episode.anime),
                          width: 72,
                          height: 88,
                          fit: BoxFit.cover,
                          frameBuilder:
                              (context, child, frame, wasSynchronouslyLoaded) {
                            if (frame != null) return child;
                            return Container(
                              width: 72,
                              height: 88,
                              color: Theme.of(context)
                                  .colorScheme
                                  .tertiaryContainer,
                              child: wasSynchronouslyLoaded
                                  ? child
                                  : Center(
                                      child: SizedBox(
                                        height: 16.0,
                                        width: 16.0,
                                        child: CircularProgressIndicator(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onTertiaryContainer,
                                          strokeWidth: 2.0,
                                        ),
                                      ),
                                    ),
                            );
                          },
                          errorBuilder: (_, __, ___) => toSvgIcon(
                            icon: Assets.iconsError,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              episode.anime.title.romaji,
                              style: Theme.of(context).textTheme.titleMedium,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            if (episode.anime.title.english != null)
                              Text(
                                episode.anime.title.english!,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurfaceVariant),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            const SizedBox(height: 9),
                            Text(
                              "Épisode ${episode.episode}",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurfaceVariant),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ActuBtnType1Widget()
            ],
          ),
        );
      },
    );
  }
}
