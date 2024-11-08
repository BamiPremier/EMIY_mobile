import 'package:flutter/material.dart';
import 'package:potatoes/common/widgets/loaders.dart';
import 'package:potatoes/libs.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/account/screens/edit_profile.dart';
import 'package:umai/account/screens/follow.dart';
import 'package:umai/account/screens/param/settings_screen.dart';
import 'package:umai/account/screens/sections/activities.dart';
import 'package:umai/account/screens/sections/animes.dart';
import 'package:umai/account/screens/sections/posts.dart';
import 'package:umai/account/screens/sections/quiz_user.dart';
import 'package:umai/account/screens/sections/watchlist.dart';
import 'package:umai/auth/screens/onboarding_screen.dart';
import 'package:umai/common/bloc/follow_cubit.dart';
import 'package:umai/common/bloc/user_cubit.dart';
import 'package:umai/common/services/user_service.dart';
import 'package:umai/common/widgets/action_widget.dart';
import 'package:umai/common/widgets/bottom_sheet.dart';
import 'package:umai/common/widgets/buttons.dart';
import 'package:umai/common/widgets/profile_picture.dart';
import 'package:umai/utils/dialogs.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen>
    with SingleTickerProviderStateMixin, CompletableMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  late final userCubit = context.read<UserCubit>();

  late final followersCubit = FollowCubit(
      context.read<UserService>().getUserFollowers(), context.read());

  late final followingCubit = FollowCubit(
      context.read<UserService>().getUserFollowing(), context.read());

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
        listener: onEventReceived,
        builder: (context, state) {
          late final user = userCubit.user;

          return Scaffold(
              body: DefaultTabController(
            length: 5,
            child: NestedScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              headerSliverBuilder: (context, _) => [
                SliverAppBar(
                  title: Text(user.username),
                  centerTitle: true,
                  actions: [
                    IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: onActionsPressed,
                        icon: const Icon(Icons.more_vert))
                  ],
                ),
                SliverToBoxAdapter(
                    child: Column(
                  children: [
                    const SizedBox(height: 16.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const UserProfilePicture(height: 80, width: 80),
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
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ).add(const EdgeInsets.only(bottom: 12)),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Theme.of(context).colorScheme.outlineVariant,
                          ),
                        ),
                      ),
                      margin: const EdgeInsets.only(top: 32),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Icon(Icons.people_outline),
                              const SizedBox(width: 16),
                              GestureDetector(
                                onTap: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => FollowScreen.get(
                                            context: context,
                                            title:
                                                "M'ont ajouté (${userCubit.user.followersCount})",
                                            followCubit: followersCubit))),
                                child: SizedBox(
                                  width: 76,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${user.followersCount}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge,
                                      ),
                                      Text(
                                        "M'ont ajouté",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              GestureDetector(
                                onTap: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => FollowScreen.get(
                                            context: context,
                                            title:
                                                "Ajoutés (${userCubit.user.followingCount})",
                                            followCubit: followingCubit))),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${user.followingCount}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge,
                                    ),
                                    Text(
                                      "ajoutés",
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: Icon(Icons.arrow_forward_ios, size: 16),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 8,
                        left: 16,
                        right: 16,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.people_outline),
                              const SizedBox(width: 16),
                              SizedBox(
                                  width: 76,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${user.animesViewedCount}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge,
                                      ),
                                      Text(
                                        "Vus",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      ),
                                    ],
                                  )),
                              const SizedBox(width: 24),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '${user.watchlistCount}',
                                    style:
                                        Theme.of(context).textTheme.labelLarge,
                                  ),
                                  Text(
                                    "à voir",
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: Icon(Icons.arrow_forward_ios, size: 16),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    const TabBar(
                      tabs: [
                        Tab(text: 'Activité'),
                        Tab(text: 'Animes'),
                        Tab(text: 'Watchlist'),
                        Tab(text: 'Social'),
                        Tab(text: 'Quiz'),
                      ],
                    ),
                  ],
                ))
              ],
              body: TabBarView(
                children: [
                  const ActivityTab(),
                  AnimesTab(),
                  WatchList(),
                  PostTab(),
                  QuizUserScreen(),
                  QuizUserScreen(),
                ],
              ),
            ),
          ));
        });
  }

  void onEventReceived(BuildContext context, UserState state) async {
    await waitForDialog();

    if (state is UserLoggingOut) {
      loadingDialogCompleter = showLoadingBarrier(context: context);
    } else if (state is UserNotLoggedState) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const OnboardingScreen()),
        (route) => false,
      );
    } else if (state is UserErrorState) {
      showErrorToast(content: state.error, context: context);
    }
  }

  void onActionsPressed() => showAppBottomSheet(
      context: context,
      builder: (innerContext) => Padding(
            padding: const EdgeInsets.only(top: 24.0, bottom: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ActionWidget(
                  title: 'Partager...',
                  icon: Icons.share,
                  onTap: () {
                    Navigator.of(innerContext).pop();
                  },
                ),
                const SizedBox(height: 16),
                ActionWidget(
                  title: 'Éditer mon profil',
                  icon: Icons.edit_outlined,
                  onTap: () {
                    Navigator.of(innerContext).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const EditProfileScreen()));
                  },
                ),
                const SizedBox(height: 16),
                ActionWidget(
                  title: 'Paramètres',
                  icon: Icons.settings,
                  onTap: () {
                    Navigator.of(innerContext).pop();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const SettingsScreen()),
                    );
                  },
                ),
                const SizedBox(height: 16),
                ActionWidget(
                  title: 'Déconnexion',
                  icon: Icons.logout,
                  onTap: () async {
                    Navigator.pop(innerContext);
                    await disconnect(context: context);
                  },
                ),
              ],
            ),
          ));

  Future disconnect({required BuildContext context}) {
    return showAppBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
            padding: const EdgeInsets.only(top: 24.0, bottom: 16.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('Déconnexion',
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.titleLarge!),
                  const SizedBox(
                    height: 32,
                  ),
                  Text('Veux-tu vraiment te déconnecter de cet appareil?',
                      style: Theme.of(context).textTheme.bodyMedium!),
                  const SizedBox(
                    height: 32,
                  ),
                  UmaiButton.primary(
                    onPressed: userCubit.signOut,
                    text: "Se Déconnecter",
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  UmaiButton.white(
                    onPressed: () => Navigator.pop(context),
                    text: 'Annuler',
                  )
                ]));
      },
    );
  }
}
