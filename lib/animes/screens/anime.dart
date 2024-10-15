import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:umai/animes/models/anime.dart';
import 'package:umai/common/widgets/action_widget.dart';
import 'package:umai/common/widgets/bottom_sheet.dart';
import 'package:umai/common/widgets/buttons.dart';
import 'package:umai/utils/themes.dart';

class AnimeDetailsScreen extends StatefulWidget {
  final Anime anime;

  const AnimeDetailsScreen({required this.anime, super.key});

  @override
  State<AnimeDetailsScreen> createState() => _AnimeDetailsScreenState();
}

class _AnimeDetailsScreenState extends State<AnimeDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Anime Image
          Stack(
            children: [
              CachedNetworkImage(
                imageUrl: widget.anime.coverImage.extraLarge,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: (context, url) => const Center(
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Padding(
                      padding: const EdgeInsets.only(top: 24),
                      child: Row(
                        children: [
                          IconButton(
                            padding: EdgeInsets.zero,
                            icon: const Icon(
                              Icons.arrow_back,
                              color: AppTheme.white,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          const Spacer(),
                          IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () => actionsOptions(),
                              color: AppTheme.white,
                              icon: const Icon(Icons.more_vert))
                        ],
                      )))
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title and Info
                Text(
                  widget.anime.title.english!,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  widget.anime.title.romaji,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Chip(
                        side: BorderSide.none,
                        backgroundColor:
                            Theme.of(context).colorScheme.tertiaryContainer,
                        padding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 8),
                        label: Text(
                          "72",
                          style:
                              Theme.of(context).textTheme.labelSmall!.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onTertiaryContainer,
                                  ),
                        )),
                    const SizedBox(width: 8),
                    Chip(
                        side: BorderSide.none,
                        backgroundColor:
                            Theme.of(context).colorScheme.tertiaryContainer,
                        padding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 8),
                        label: Text(
                          "Mars 2024",
                          style:
                              Theme.of(context).textTheme.labelSmall!.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onTertiaryContainer,
                                  ),
                        )),
                    const SizedBox(width: 8),
                    Chip(
                        side: BorderSide.none,
                        backgroundColor:
                            Theme.of(context).colorScheme.surfaceVariant,
                        padding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 8),
                        label: Text(
                          "24 episodes",
                          style:
                              Theme.of(context).textTheme.labelSmall!.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurfaceVariant,
                                  ),
                        )),
                    const SizedBox(width: 8),
                    Chip(
                        side: BorderSide.none,
                        backgroundColor:
                            Theme.of(context).colorScheme.surfaceVariant,
                        padding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 8),
                        label: Text(
                          "En cours",
                          style:
                              Theme.of(context).textTheme.labelSmall!.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurfaceVariant,
                                  ),
                        )),
                  ],
                ),
                const SizedBox(height: 32),
                // Add to List Button
                Row(
                  children: [
                    Expanded(
                      child: UmaiButton.primary(
                        icon: const Icon(
                          Icons.add,
                          color: AppTheme.black,
                        ),
                        onPressed: () {},
                        text: "Ajouter à ma liste",
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppTheme.black,
                        ),
                        child: Text(
                          'W',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(color: AppTheme.white),
                        )),
                  ],
                ),

                const SizedBox(height: 32),
                // Synopsis
                Text(
                  "Synopsis",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: 4),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                  "Nunc non mauris volutpat pharetra eu facilisis velit amet.",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: const Color(0xff79747E)),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Chip(
                        padding: const EdgeInsets.symmetric(
                            vertical: 6, horizontal: 16),
                        label: Text(
                          "Action",
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(fontWeight: FontWeight.normal),
                        )),
                    const SizedBox(width: 8),
                    Chip(
                        padding: const EdgeInsets.symmetric(
                            vertical: 6, horizontal: 16),
                        label: Text(
                          "Aventure",
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(fontWeight: FontWeight.normal),
                        )),
                    const SizedBox(width: 8),
                    Chip(
                        padding: const EdgeInsets.symmetric(
                            vertical: 6, horizontal: 16),
                        label: Text(
                          "comédie",
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(fontWeight: FontWeight.normal),
                        )),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          TabBar(
            controller: _tabController,
            labelColor: AppTheme.black,
            unselectedLabelColor:
                Theme.of(context).colorScheme.onSurfaceVariant,
            indicatorColor: Theme.of(context).colorScheme.primary,
            labelStyle: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: Theme.of(context).colorScheme.onSurface),
            tabs: const [
              Tab(text: "Épisodes"),
              Tab(text: "Recommandations"),
              Tab(text: "Quiz"),
            ],
          ),
          SizedBox(
            height: 200,
            child: TabBarView(
              controller: _tabController,
              children: [
                const Center(child: Text("Épisodes Content")),
                SizedBox(
                    height: double.infinity,
                    child: GridView.builder(
                      padding: const EdgeInsets.all(0),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 2.0,
                              mainAxisSpacing: 2.0,
                              childAspectRatio: .65),
                      itemCount: 50,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => InkWell(
                        // onTap: () => Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //       builder: (context) => const AnimeInfoScreen(anime: anime,)),
                        // ),
                        child: Card(
                          elevation: 0,
                          margin: const EdgeInsets.all(0.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0.0)),
                          child: Stack(
                            children: [
                              // Image at the top of the card
                              ClipRRect(
                                child: Image.network(
                                  'https://img.freepik.com/photos-gratuite/representations-experience-utilisateur-design-interface_23-2150104489.jpg?t=st=1726481260~exp=1726484860~hmac=71aa8b5d32271a5f3d6a968bb6731cb8d35a797e60f574caa80514a1ff4bcac3&w=900',
                                  height: 368,
                                  width: double.infinity,
                                  // height: 500.0,
                                  // width: 300.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4.0),
                                  decoration: BoxDecoration(
                                    color: AppTheme.black.withOpacity(.4),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // Positive votes counter
                                      Row(
                                        children: [
                                          Text("428",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelMedium!
                                                  .copyWith(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .inverseSurface)),
                                          Icon(
                                            Icons.check,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .inverseSurface,
                                            size: 24.0,
                                          ),
                                        ],
                                      ),
                                      // Negative votes counter
                                      Row(
                                        children: [
                                          Text("59",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelMedium!
                                                  .copyWith(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .inverseSurface)),
                                          Icon(
                                            Icons.close,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .inverseSurface,
                                            size: 24.0,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 30,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )),
                const Center(child: Text("Quiz Content")),
              ],
            ),
          ),
        ],
      ),
    ));
  }

  void actionsOptions() => showAppBottomSheet(
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
                onTap: () => print(''),
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          )));
}
