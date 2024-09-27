import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:potatoes/common/widgets/loaders.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/account/screens/edit_profile_screen.dart';
import 'package:umai/account/screens/param/settings_screen.dart';
import 'package:umai/account/screens/section/activities.dart';
import 'package:umai/account/screens/section/animes.dart';
import 'package:umai/account/screens/section/posts.dart';
import 'package:umai/account/screens/section/watchlist.dart';
import 'package:umai/auth/screens/onboarding_screen.dart';
import 'package:umai/common/bloc/user_cubit.dart';
import 'package:umai/common/widgets/action_widget.dart';
import 'package:umai/common/widgets/bottom_sheet.dart';
import 'package:umai/utils/assets.dart';
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

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCubit, UserState>(
      listener: onEventReceived,
      child: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: Text(context.read<UserCubit>().user.username),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: onActionsPressed,
                icon: const Icon(Icons.more_vert)
              )
            ],
          ),
          body: DefaultTabController(
            length: 4,
            child: Column(children: [
              const SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CachedNetworkImage(
                      imageUrl: context.read<UserCubit>().user.image ?? '',
                      height: 80,
                      width: 80,
                      fit: BoxFit.cover,
                      imageBuilder: (context, imageProvider) => Container(
                          margin: const EdgeInsets.only(right: 16),
                          child: CircleAvatar(
                            radius: 40,
                            backgroundImage: imageProvider,
                          )),
                      placeholder: (context, url) => SvgPicture.asset(
                        Assets.defaultAvatar,
                      ),
                      errorWidget: (context, url, error) => SvgPicture.asset(
                        Assets.defaultAvatar,
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '@${context.read<UserCubit>().user.usertag}',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            // TODO
                            context.read<UserCubit>().user.biography ?? '',
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .surfaceTint),
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
                      children: [
                        const Icon(Icons.account_box),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '${context.read<UserCubit>().user.followersCount}',
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                            Text(
                              "m'ont ajouté",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '${context.read<UserCubit>().user.followingCount}',
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                            Text(
                              "ajoutés",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                        margin: const EdgeInsets.only(right: 8),
                        child: const Icon(Icons.arrow_forward_ios, size: 16)),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                margin: const EdgeInsets.only(top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.account_box),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '${context.read<UserCubit>().user.animesViewedCount}',
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                            Text(
                              "vus",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                        const SizedBox(width: 24),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '${context.read<UserCubit>().user.watchlistCount}',
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                            Text(
                              "à voir",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                        margin: const EdgeInsets.only(right: 8),
                        child: const Icon(Icons.arrow_forward_ios, size: 16)),
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
                ],
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    ActivityTab(),
                    AnimesTab(),
                    WatchList(),
                    PostTab(),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
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
      showErrorToast(state.error);
    }
  }

  void onActionsPressed() => showAppBottomSheet(
      context: context,
      horizontalPadding: 0,
      maxHeight: 280,
      isScrollControlled: true,
      builder: (_) => Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ).add(const EdgeInsets.only(top: 24.0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ActionWidget(
                title: 'Partager...',
                icon: Icons.share,
                onTap: () => print(''),
              ),
              const SizedBox(
                height: 16,
              ),
              ActionWidget(
                title: 'Éditer mon profil',
                icon: Icons.edit_outlined,
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const EditProfileScreen()));
                },
              ),
              const SizedBox(
                height: 16,
              ),
              ActionWidget(
                title: 'Paramètres',
                icon: Icons.settings,
                onTap: () {
                  Navigator.of(context).pop();

                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const SettingsScreen()),
                  );
                },
              ),
              const SizedBox(
                height: 16,
              ),
              ActionWidget(
                title: 'Déconnexion',
                icon: Icons.logout,
                onTap: () {
                  userCubit.signOut();
                },
              ),
            ],
          )));
}
