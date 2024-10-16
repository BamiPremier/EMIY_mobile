import 'package:flutter/material.dart';
import 'package:potatoes/common/widgets/loaders.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/person_account/screens/section/activities.dart';
import 'package:umai/person_account/screens/section/animes.dart';
import 'package:umai/person_account/screens/section/posts.dart';
import 'package:umai/person_account/screens/section/watchlist.dart';
import 'package:umai/common/bloc/person_cubit.dart';
import 'package:umai/common/models/user.dart';
import 'package:umai/common/widgets/action_widget.dart';
import 'package:umai/common/widgets/bottom_sheet.dart';
import 'package:umai/common/widgets/profile_picture.dart';
import 'package:umai/utils/themes.dart';
 
class PersonAccountScreen extends StatefulWidget {
  const PersonAccountScreen({super.key});

  static Widget get({
    required BuildContext context,
    required User user,
  }) {
    return BlocProvider(
      create: (context) => PersonCubit(context.read(), user),
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

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PersonCubit, PersonState>(
        listener: onEventReceived,
        builder: (context, state) {
          final personCubit = context.read<PersonCubit>();
          final user = personCubit.user;
          return Scaffold(
              appBar: AppBar(
                title: Text(user.username),
                centerTitle: true,
                actions: [
                  IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: onActionsPressed,
                      icon: const Icon(Icons.more_vert))
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
                        ProfilePicture(
                            image: user.image, height: 80, width: 80),
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
                      horizontal: 16,
                    ).add(const EdgeInsets.only(top: 32, bottom: 28)),
                    child: !user.followed
                        ? ElevatedButton(
                            onPressed: () => personCubit.followUser(),
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Theme.of(context).colorScheme.primary,
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                    color: AppTheme.mainText,
                                  ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                state is PersonLoadingState
                                    ? const SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          color: AppTheme.white,
                                        ),
                                      )
                                    : const Icon(
                                        Icons.add,
                                      ),
                                const SizedBox(width: 8),
                                Text(
                                  'ajouter',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .copyWith(
                                        color: AppTheme.mainText,
                                      ),
                                ),
                              ],
                            ),
                          )
                        : ElevatedButton(
                            onPressed: () => personCubit.unFollowUser(),
                            style: ElevatedButton.styleFrom(
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
                                state is PersonLoadingState
                                    ? const SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          color: AppTheme.white,
                                        ),
                                      )
                                    : const Icon(Icons.check),
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
                            SizedBox(
                              width: 76,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '${user.followersCount}',
                                    style:
                                        Theme.of(context).textTheme.labelLarge,
                                  ),
                                  Text(
                                    "M'ont ajouté",
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '${user.followingCount}',
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${user.animesViewedCount}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge,
                                    ),
                                    Text(
                                      "Vus",
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ],
                                )),
                            const SizedBox(width: 24),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '${user.watchlistCount}',
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
              ));
        });
  }

  void onEventReceived(BuildContext context, PersonState state) async {
    await waitForDialog();
    if (state is InitializingPersonState) {
    
    }
  }

  void onActionsPressed() => showAppBottomSheet(
      context: context,
      horizontalPadding: 0,
      maxHeight: 100,
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
                onTap: () =>Navigator.pop(context),
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          )));
}
