import 'package:flutter/material.dart';
import 'package:umai/account/screens/edit_profile.dart';
import 'package:umai/account/screens/param/settings.dart';
import 'package:umai/account/screens/section/activites.dart';
import 'package:umai/account/screens/section/animes.dart';
import 'package:umai/account/screens/section/sociale.dart';
import 'package:umai/account/screens/section/watchlist.dart';
import 'package:umai/account/widgets/profile_button.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Désiré Adama",
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => actionsOptions(),
              icon: const Icon(Icons.more_vert))
        ],
      ),
      body: SafeArea(
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
                          '@desireadams',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Proident aliquip officia sint aute tempor adipisicing esse nostrud officia quis ex cillum. Et anim est est cillum sint nulla ex pariatur eiusmod laborum irure laborum cupidatat. Laboris ipsum esse ea dolore tempor dolor sint anim incididunt amet mollit laborum.',
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
                            '14',
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
                            '38',
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
                            '257',
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
                            '9',
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
                children: [
                  Activite(),
                  Animes(),
                  const WatchList(),
                  const Sociale(),
                ],
              ),
            ),
          ]),
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
              PartagerWidget(
                title: 'Partager...',
                icon: Icons.share,
                onTap: () => print(''),
              ),
              const SizedBox(
                height: 16,
              ),
              PartagerWidget(
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
              PartagerWidget(
                title: 'Paramètres',
                icon: Icons.settings,
                onTap: () {
                  Navigator.of(context).pop();

                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const SettingsPage()),
                  );
                },
              ),
            ],
          )));
}
