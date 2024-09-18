import 'package:flutter/material.dart';
import 'package:umai/auth/models/anime_response.dart';

class AnimeItem extends StatefulWidget {
  final Anime anime;
  AnimeItem({required this.anime});
  @override
  _AnimeItemState createState() => _AnimeItemState();
}

class _AnimeItemState extends State<AnimeItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        showContextMenu(context, details.globalPosition);
      },
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
        margin: const EdgeInsets.all(2),
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
                  color: Colors.black.withOpacity(.4),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Positive votes counter
                    Row(
                      children: [
                        Text(
                          "428",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                        Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 24.0,
                        ),
                      ],
                    ),
                    // Negative votes counter
                    Row(
                      children: [
                        Text(
                          "59",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                        Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 24.0,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showContextMenu(BuildContext context, Offset position) async {
    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        position.dx,
        position.dy,
        position.dx + 1,
        position.dy + 1,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      color: Colors.white,
      items: <PopupMenuEntry>[
        PopupMenuItem(
          value: 'visited',
          child: ListTile(
            leading: Icon(Icons.check_circle_outline),
            title: Text("J'ai vu",
                style: Theme.of(context).popupMenuTheme.textStyle),
          ),
        ),
        PopupMenuItem(
          value: 'add_to_list',
          child: ListTile(
            leading: Icon(Icons.add_circle_outline),
            title: Text("Ajouter à la liste",
                style: Theme.of(context).popupMenuTheme.textStyle),
          ),
        ),
      ],
    );
  }
}
