import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:umai/social/model/post_response.dart';
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/themes.dart';

class PostUserWidget extends StatelessWidget {
  final Post post;

  const PostUserWidget({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
      color: Theme.of(context).colorScheme.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.only(
                  left: 16.0,
                  top: 16.0,
                  bottom: 16.0,
                  right: 0.0), // Espacement interne
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: CachedNetworkImage(
                        imageUrl: post.user.image ?? '',
                        height: 80,
                        width: 80,
                        fit: BoxFit.cover,
                        imageBuilder: (context, imageProvider) => Container(
                            margin: const EdgeInsets.only(right: 16),
                            child: CircleAvatar(
                              radius: 28,
                              backgroundImage: imageProvider,
                            )),
                        placeholder: (context, url) => const CircleAvatar(
                          radius: 28,
                          backgroundImage: AssetImage(Assets.user),
                        ),
                        errorWidget: (context, url, error) => Container(
                          margin: const EdgeInsets.only(right: 16),
                          child: CircleAvatar(
                            radius: 28,
                            backgroundImage: AssetImage(Assets.user),
                          ),
                        ),
                      ),
                      title: Text(
                        post.user.username,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      subtitle: Text(
                        'Il y a 10h',
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(color: ThemeApp.grey),
                      ),
                      trailing: PopupMenuButton<String>(
                        onSelected: (value) {
                          // Gérer les options de chaque commentaire
                        },
                        padding: EdgeInsets.zero,
                        itemBuilder: (BuildContext context) {
                          return ['Copier', 'Signaler', 'Supprimer']
                              .map((String choice) {
                            return PopupMenuItem<String>(
                              padding: const EdgeInsets.only(
                                  right: 48.0, left: 16.0),
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface),
                              value: choice,
                              child: Text(choice),
                            );
                          }).toList();
                        },
                      ),
                    ),

                    // Row(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     Container(
                    //       margin: const EdgeInsets.only(right: 16),
                    //       width: 48,
                    //       height: 48,
                    //       decoration: const BoxDecoration(
                    //         shape: BoxShape.circle,
                    //         image: DecorationImage(
                    //           image: AssetImage(Assets.user),
                    //           fit: BoxFit.cover,
                    //         ),
                    //       ),
                    //     ),
                    //     const SizedBox(width: 8),
                    //     Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       mainAxisAlignment: MainAxisAlignment.start,
                    //       children: [
                    //         Text(
                    //           'Hari Randoll',
                    //           style: Theme.of(context).textTheme.bodyLarge,
                    //         ),
                    //         const SizedBox(height: 4),
                    //         Text(
                    //           'Il y a 18h',
                    //           style: Theme.of(context)
                    //               .textTheme
                    //               .labelMedium!
                    //               .copyWith(color: const Color(0xffD9D9D9)),
                    //         ),
                    //       ],
                    //     ),
                    //   ],
                    // ),
                    const SizedBox(height: 8),
                    Text(
                      'Lorem ipsum dolor sit amet consectetur. Odio ornare malesuada non et dignissim erat leo amet aliquet.',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 8),
                  ])),
          ClipRRect(
            borderRadius: BorderRadius.zero,
            child: Image.network(
              'https://img.freepik.com/photos-gratuite/representations-experience-utilisateur-design-interface_23-2150104489.jpg?t=st=1726481260~exp=1726484860~hmac=71aa8b5d32271a5f3d6a968bb6731cb8d35a797e60f574caa80514a1ff4bcac3&w=900',
              height: 368,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
