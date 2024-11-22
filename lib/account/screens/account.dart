import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:potatoes/common/widgets/loaders.dart';
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
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/dialogs.dart';
import 'package:umai/utils/svg_utils.dart';

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

  Widget counter(
      {required int count, required String label, VoidCallback? onTap}) {
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
              appBar: AppBar(
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
                  )
                ],
              ),
              body: DefaultTabController(
                length: 5,
                child: NestedScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  headerSliverBuilder: (context, _) => [
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          SizedBox(height: 16),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const UserProfilePicture(size: 80),
                                const SizedBox(width: 16.0),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '@${user.usertag}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
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
                          const SizedBox(height: 32.0),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Row(
                              children: [
                                toSvgIcon(
                                    icon: Assets.iconsTrending, size: 16.0),
                                const SizedBox(width: 16),
                                counter(
                                  onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) => FollowScreen.get(
                                            context: context,
                                            title:
                                                "M'ont ajouté (${NumberFormat.compact().format(userCubit.user.followersCount)})",
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
                                                "Ajoutés (${NumberFormat.compact().format(userCubit.user.followingCount)})",
                                            followCubit: followingCubit)));
                                  },
                                  count: user.followingCount,
                                  label: "ajoutés",
                                ),
                                const Spacer(),
                                toSvgIcon(
                                    icon: Assets.iconsDirectionRight,
                                    size: 16.0),
                              ],
                            ),
                          ),
                          const Divider(thickness: 0.7),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Row(
                              children: [
                                toSvgIcon(
                                    icon: Assets.iconsTrending, size: 16.0),
                                const SizedBox(width: 16),
                                counter(
                                    count: user.animesViewedCount,
                                    label: "vus"),
                                counter(
                                    count: user.watchlistCount,
                                    label: "à voir"),
                                const Spacer(),
                                toSvgIcon(
                                    icon: Assets.iconsDirectionRight,
                                    size: 16.0),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ],
                  body: DefaultTabController(
                    length: 5,
                    child: Column(
                      children: [
                        TabBar(
                          isScrollable: true,
                          tabAlignment: TabAlignment.start,
                          indicatorSize: TabBarIndicatorSize.tab,
                          labelPadding:
                              const EdgeInsets.symmetric(horizontal: 32),
                          unselectedLabelColor:
                              Theme.of(context).colorScheme.onSurfaceVariant,
                          labelStyle: Theme.of(context)
                              .tabBarTheme
                              .labelStyle!
                              .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onSurface),
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
                              const AnimesTab(),
                              WatchList(),
                              const PostTab(),
                              QuizUserScreen(),
                            ],
                          ),
                        )
                      ],
                    ),
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
            padding: const EdgeInsets.only(top: 24.0),
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
                    Navigator.of(innerContext).pop();
                  },
                ),
                const SizedBox(height: 16),
                ActionWidget(
                  title: 'Éditer mon profil',
                  icon: toSvgIcon(
                    icon: Assets.iconsEdit,
                  ),
                  onTap: () {
                    Navigator.of(innerContext).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const EditProfileScreen()));
                  },
                ),
                const SizedBox(height: 16),
                ActionWidget(
                  title: 'Paramètres',
                  icon: toSvgIcon(
                    icon: Assets.iconsSetting,
                  ),
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
                  icon: const Icon(Icons.logout),
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
