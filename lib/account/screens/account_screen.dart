import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/account/cubit/account_cubit.dart';
import 'package:umai/account/screens/edit_profile_screen.dart';
import 'package:umai/account/screens/param/settings_screen.dart';
import 'package:umai/account/screens/section/activites.dart';
import 'package:umai/account/screens/section/animes.dart';
import 'package:umai/account/screens/section/sociale.dart';
import 'package:umai/account/screens/section/watchlist.dart';
import 'package:umai/common/widgets/action_widget.dart';
import 'package:umai/common/widgets/bottom_sheet.dart';
import 'package:umai/utils/assets.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen>
    with SingleTickerProviderStateMixin {
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

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountCubit, AccountState>(
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          title: Text(
            context.read<AccountCubit>().user!.username!,
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () => actionsOptions(),
                icon: const Icon(Icons.more_vert))
          ],
        ),
        body: SafeArea(
          minimum: const EdgeInsets.only(bottom: 48),
          child: Container(
            margin: const EdgeInsets.only(top: 16),
            child: Column(children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 16),
                      width: 80,
                      height: 80,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(Assets.user),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            context.read<AccountCubit>().user!.usertag,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            context.read<AccountCubit>().user!.biography ?? '',
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
                              '${context.read<AccountCubit>().user!.followersCount}',
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
                              '${context.read<AccountCubit>().user!.followingCount}',
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
                              '${context.read<AccountCubit>().user!.animesViewedCount}',
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
                              '${context.read<AccountCubit>().user!.watchlistCount}',
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
              TabBar(
                controller: _tabController,
                tabs: const [
                  Tab(text: 'Activité'),
                  Tab(text: 'Animes'),
                  Tab(text: 'Watchlist'),
                  Tab(text: 'Social'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    Activite(),
                    Animes(),
                    WatchList(),
                    Sociale(),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  void actionsOptions() => showAppBottomSheet(
      context: context,
      horizontalPadding: 0,
      maxHeight: 192,
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
            ],
          )));
}
