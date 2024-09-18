import 'package:flutter/material.dart';
import 'package:umai/animes/screens/anime_info.dart';
import 'package:umai/social/widget/post_card.dart';
import 'package:umai/utils/themes.dart';

class AnimeView extends StatefulWidget {
  const AnimeView({super.key});

  @override
  State<AnimeView> createState() => _AnimeViewState();
}

class _AnimeViewState extends State<AnimeView> {
  int isSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FilterChip(
                  label: const Text("Tendances"),
                  selectedColor:
                      Theme.of(context).colorScheme.tertiaryContainer,
                  labelStyle: Theme.of(context).chipTheme.labelStyle!.copyWith(
                      color: Theme.of(context).colorScheme.onTertiaryContainer),
                  selected: isSelected == 0,
                  onSelected: (selected) {
                    setState(() {
                      isSelected = 0;
                    });
                  },
                ),
                FilterChip(
                  label: const Text("Saison prochaine"),
                  selectedColor:
                      Theme.of(context).colorScheme.tertiaryContainer,
                  labelStyle: Theme.of(context).chipTheme.labelStyle!.copyWith(
                      color: Theme.of(context).colorScheme.onTertiaryContainer),
                  selected: isSelected == 1,
                  onSelected: (selected) {
                    setState(() {
                      isSelected = 1;
                    });
                  },
                ),
                FilterChip(
                  label: const Text("Tous"),
                  selectedColor:
                      Theme.of(context).colorScheme.tertiaryContainer,
                  labelStyle: Theme.of(context).chipTheme.labelStyle!.copyWith(
                      color: Theme.of(context).colorScheme.onTertiaryContainer),
                  selected: isSelected == 2,
                  onSelected: (selected) {
                    setState(() {
                      isSelected = 2;
                    });
                  },
                ),
              ],
            )),
        Expanded(
            child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 2.0,
              mainAxisSpacing: 2.0,
              childAspectRatio: .65),
          itemCount: 50,
          itemBuilder: (context, index) => InkWell(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const AnimeInfoScreen()),
            ),
            child: Card(
              margin: const EdgeInsets.all(0.0),
              elevation: 0,
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

                  // The voting area (counters and buttons) at the bottom
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      decoration: BoxDecoration(
                        color: ThemeApp.black.withOpacity(.4),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          SizedBox(
                            width: 32,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ))
      ],
    );
  }
}
