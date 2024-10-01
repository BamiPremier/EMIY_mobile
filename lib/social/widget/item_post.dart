import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/auth/bloc/auth_cubit.dart';
import 'package:umai/common/bloc/follow_cubit.dart';
import 'package:umai/common/bloc/user_cubit.dart';
import 'package:umai/common/widgets/image_profil.dart';
import 'package:umai/social/cubit/post_manip_cubit.dart';
import 'package:umai/social/model/post.dart';
import 'package:umai/social/screens/post_details.dart';
import 'package:umai/social/widget/button_post.dart';
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/themes.dart';

class PostItem extends StatelessWidget {
  static Widget get({required BuildContext context, required Post post}) {
    return BlocProvider(
      create: (context) => PostManipCubit(context.read(), post),
      child: const PostItem._(),
    );
  }

  const PostItem._();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostManipCubit, PostManipState>(
        builder: (context, state) {
      final postCubit = context.read<PostManipCubit>();
      final post = postCubit.post!;

      return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PostDetailsScreen.from(cubit: postCubit)),
          );
        },
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 16.0, right: 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: ImageProfil(
                          image: post.user.image ?? '', height: 48, width: 48),
                      title: Text(
                        post.user.username,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      subtitle: Text(
                        'Il y a 10h',
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(color: AppTheme.grey),
                      ),
                      trailing: PopupMenuButton<String>(
                        onSelected: (value) {
                          // Gérer les options de chaque commentaire
                        },
                        padding: EdgeInsets.zero,
                        itemBuilder: (BuildContext context) {
                          List<String> options = ['Signaler'];
                          if (post.user.id ==
                              context.read<UserCubit>().user.id) {
                            options.add('Supprimer');
                          }
                          return options.map((String choice) {
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
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Text(
                        post.content,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              ),
              post.image == null || post.image == '' || post.image!.isEmpty
                  ? const SizedBox()
                  : Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Image.network(
                        post.image ?? '',
                        height: 368,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        frameBuilder: (BuildContext context, Widget child,
                            int? frame, bool wasSynchronouslyLoaded) {
                          if (wasSynchronouslyLoaded) {
                            return child;
                          }
                          return AnimatedOpacity(
                            opacity: frame == null ? 0 : 1,
                            duration: const Duration(seconds: 1),
                            curve: Curves.easeOut,
                            child: child,
                          );
                        },
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          }
                          return SizedBox(
                            height: 368,
                            width: double.infinity,
                            child: Center(
                              child: CircularProgressIndicator(
                                color: Theme.of(context).colorScheme.tertiary,
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        (loadingProgress.expectedTotalBytes ??
                                            1)
                                    : null,
                              ),
                            ),
                          );
                        },
                        errorBuilder: (BuildContext context, Object error,
                            StackTrace? stackTrace) {
                          return Container(
                            height: 368,
                            width: double.infinity,
                            color: Colors.grey[300],
                            child: const Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.error,
                                      color: Colors.red, size: 48),
                                  SizedBox(height: 16),
                                  Text(
                                    "Erreur de chargement de l'image",
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
              ButtonPost(postCubit: context.read<PostManipCubit>())
            ],
          ),
        ),
      );
    });
  }
}
