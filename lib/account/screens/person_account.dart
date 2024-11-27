import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:potatoes/common/widgets/loaders.dart';
import 'package:potatoes/libs.dart';
import 'package:share_plus/share_plus.dart';
import 'package:umai/account/screens/account.dart';
import 'package:umai/account/screens/follow.dart';
import 'package:umai/account/screens/sections/activities.dart';
import 'package:umai/account/screens/sections/animes.dart';
import 'package:umai/account/screens/sections/posts.dart';
import 'package:umai/account/screens/sections/quiz_user.dart';
import 'package:umai/account/screens/sections/watchlist.dart';
import 'package:umai/common/bloc/follow_cubit.dart';
import 'package:umai/common/bloc/person_cubit.dart';
import 'package:umai/common/bloc/user_cubit.dart';
import 'package:umai/common/models/user.dart';
import 'package:umai/common/services/person_cubit_manager.dart';
import 'package:umai/common/services/user_service.dart';
import 'package:umai/common/widgets/action_post.dart';
import 'package:umai/common/widgets/action_widget.dart';
import 'package:umai/common/widgets/bottom_sheet.dart';
import 'package:umai/common/widgets/profile_picture.dart';
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/svg_utils.dart';
import 'package:umai/utils/themes.dart';

class PersonAccountScreen extends StatefulWidget {
  const PersonAccountScreen({super.key});

  static Widget get({
    required BuildContext context,
    required User user,
  }) {
    if (user.id == context.read<UserCubit>().user.id) {
      return const AccountScreen();
    }
    return BlocProvider.value(
      value: context.read<PersonCubitManager>().get(user),
      child: const PersonAccountScreen(),
    );
  }

  @override
  State<PersonAccountScreen> createState() => _PersonAccountScreenState();
}

class _PersonAccountScreenState extends State<PersonAccountScreen>
    with SingleTickerProviderStateMixin, CompletableMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  late final personCubit = context.read<PersonCubit>();

  late final followersCubit = FollowCubit(
      context.read<UserService>().getUserFollowers(userId: personCubit.user.id),
      context.read());

  late final followingCubit = FollowCubit(
      context.read<UserService>().getUserFollowing(userId: personCubit.user.id),
      context.read());
  Widget counter({
    required int count,
    required String label,
    VoidCallback? onTap
  }) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 80.0,
        child: Column(
          children: [
            Text(
              NumberFormat.compact().format(count),
              style: Theme.of(context).textTheme.labelLarge,
              textAlign: TextAlign.center,
            ),
            Text(
              label,
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PersonCubit, PersonState>(
        listener: onEventReceived,
        builder: (context, state) {
          final user = personCubit.user;
          return Scaffold(
            appBar: AppBar(
              systemOverlayStyle: Theme.of(context)
                  .appBarTheme
                  .systemOverlayStyle
                  ?.copyWith(statusBarIconBrightness: Brightness.light),
                  
              forceMaterialTransparency: true,
              title: Text(user.username),
              centerTitle: true,
              actions: [
                IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: onActionsPressed,
                  icon: toSvgIcon(
                    icon: Assets.iconsOptions,
                  ),
                ),
              ],
            ),
            body: NestedScrollView(
              physics: const BouncingScrollPhysics(),
              headerSliverBuilder: (context, _) => [
                SliverToBoxAdapter(
                    child: Column(
                  children: [
                  const  SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ProfilePicture(image: user.image, size: 80),
                          const SizedBox(width: 16.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '@${user.usertag}',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                const SizedBox(height: 4),
                                (user.biography != null &&
                                        user.biography!.isNotEmpty)
                                    ? Text(
                                        user.biography!,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .surfaceTint),
                                      )
                                    : Text(
                                        'Pas de bio',
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                                color: Theme.of(context)
                                                    .disabledColor),
                                      ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 28),
                      child: personCubit.user.hasBlocked
                          ? FilledButton(
                              onPressed: () => personCubit.unBlockUser(),
                              style: FilledButton.styleFrom(
                                backgroundColor: AppTheme.mainText,
                                foregroundColor: AppTheme.white,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 6, horizontal: 12),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  if (state is PersonLoadingBlockState)
                                    const SizedBox(
                                      width: 16,
                                      height: 16,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: AppTheme.white,
                                      ),
                                    )
                                  else
                                    toSvgIcon(
                                      icon: Assets.iconsBlock,
                                      color: AppTheme.white,
                                      size: 16.0
                                    ),
                                  const SizedBox(width: 8),
                                  Text(
                                    'Débloquer',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge!
                                        .copyWith(
                                          color: AppTheme.white,
                                        ),
                                  ),
                                ],
                              ),
                            )
                          : !user.followed
                              ? FilledButton(
                                  onPressed: () => personCubit.followUser(),
                                  style: FilledButton.styleFrom(
                                    backgroundColor:
                                        Theme.of(context).colorScheme.primary,
                                    textStyle:
                                        Theme.of(context).textTheme.labelLarge!,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      if (state is PersonLoadingState)
                                        const SizedBox(
                                          width: 16,
                                          height: 16,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                            color: AppTheme.black,
                                          ),
                                        )
                                      else
                                        toSvgIcon(
                                          icon: Assets.iconsMore,
                                          color: AppTheme.black,
                                          size: 16,
                                        ),
                                      const SizedBox(width: 8),
                                      Text(
                                        'ajouter',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge!,
                                      ),
                                    ],
                                  ),
                                )
                              : FilledButton(
                                  onPressed: () => personCubit.unFollowUser(),
                                  style: FilledButton.styleFrom(
                                    backgroundColor: Theme.of(context)
                                        .colorScheme
                                        .tertiaryContainer,
                                    textStyle: Theme.of(context)
                                        .textTheme
                                        .labelLarge!
                                        .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onTertiaryContainer,
                                        ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      if (state is PersonLoadingState)
                                        SizedBox(
                                          width: 16,
                                          height: 16,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onTertiaryContainer,
                                          ),
                                        )
                                      else
                                        toSvgIcon(
                                            icon: Assets.iconsTick,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onTertiaryContainer,
                                            size: 16),
                                      const SizedBox(width: 8),
                                      Text(
                                        'ajouté(e)',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge!
                                            .copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onTertiaryContainer),
                                      ),
                                    ],
                                  ),
                                ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          toSvgIcon(icon: Assets.iconsTrending, size: 16.0),
                          const SizedBox(width: 16),
                          counter(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => FollowScreen.get(
                                      context: context,
                                      title:
                                          "M'ont ajouté (${NumberFormat.compact().format(user.followersCount)})",
                                      followCubit: followersCubit)));
                            },
                            count: user.followersCount,
                            label: "m'ont ajouté",
                          ),
                          counter(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => FollowScreen.get(
                                      context: context,
                                      title:
                                          "Ajoutés (${NumberFormat.compact().format(user.followingCount)})",
                                      followCubit: followingCubit)));
                            },
                            count: user.followingCount,
                            label: "ajoutés",
                          ),
                          const Spacer(),
                          toSvgIcon(
                              icon: Assets.iconsDirectionRight, size: 16.0),
                        ],
                      ),
                    ),
                    const Divider(thickness: 0.7),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          toSvgIcon(icon: Assets.iconsTrending, size: 16.0),
                          const SizedBox(width: 16),
                          counter(count: user.animesViewedCount, label: "vus"),
                          counter(count: user.watchlistCount, label: "à voir"),
                          const Spacer(),
                          toSvgIcon(
                              icon: Assets.iconsDirectionRight, size: 16.0),
                        ],
                      ),
                    ),
                 const   SizedBox(height: 16),
                  ],
                ))
              ],
              body: DefaultTabController(
                length: 5,
                child: Column(
                  children: [
                    TabBar(
                      isScrollable: true,
                      tabAlignment: TabAlignment.start,
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelPadding: const EdgeInsets.symmetric(horizontal: 32),
                      unselectedLabelColor:
                          Theme.of(context).colorScheme.onSurfaceVariant,
                      labelStyle: Theme.of(context)
                          .tabBarTheme
                          .labelStyle!
                          .copyWith(
                              color: Theme.of(context).colorScheme.onSurface),
                      tabs: const [
                        Tab(text: 'Activité'),
                        Tab(text: 'Animes'),
                        Tab(text: 'Watchlist'),
                        Tab(text: 'Social'),
                        Tab(text: 'Quiz'),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          const ActivityTab(),
                          const AnimesTab(
                            currentUser: false,
                          ),
                          WatchList(
                            currentUser: false,
                          ),
                          const PostTab(
                            currentUser: false,
                          ),
                          QuizUserScreen(
                            currentUser: false,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  void onEventReceived(BuildContext context, PersonState state) async {
    await waitForDialog();

    if (state is SharePersonLoadingState) {
      loadingDialogCompleter = showLoadingBarrier(
        context: context,
      );
    } else if (state is SharePersonSuccessState) {
      await Share.share(state.shareLink);
    }
  }

  void onActionsPressed() => showAppBottomSheet(
      context: context,
      builder: (_) => Padding(
            padding: const EdgeInsets.only(top: 24.0, bottom: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ActionWidget(
                  title: 'Partager...',
                  icon: toSvgIcon(
                    icon: Assets.iconsShare,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    personCubit.shareUser();
                  },
                ),
                const SizedBox(height: 16),
                ActionWidget(
                  title: 'Bloquer',
                  icon: toSvgIcon(
                    icon: Assets.iconsBlock,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    blockUser(context: context);
                  },
                ),
              ],
            ),
          ));
}
