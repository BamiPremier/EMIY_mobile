import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/common/bloc/user_cubit.dart';
import 'package:umai/common/widgets/profile_picture.dart';
import 'package:umai/social/cubit/post_cubit.dart';
import 'package:umai/social/model/post.dart';
import 'package:umai/social/screens/post_details.dart';
import 'package:umai/social/widget/button_post.dart';
import 'package:umai/utils/themes.dart';
import 'package:readmore/readmore.dart';
import 'package:umai/utils/time_elapsed.dart';

class PostItem extends StatefulWidget {
  static Widget get({required BuildContext context, required Post post}) {
    return BlocProvider(
      create: (context) => PostCubit(context.read(), post),
      child: PostItem._(),
    );
  }

  PostItem._();

  @override
  _PostItemState createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  final isCollapsed = ValueNotifier<bool>(true);
  final _trimMode = TrimMode.Line;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostCubit, PostState>(builder: (context, state) {
      final postCubit = context.read<PostCubit>();
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
             Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: ProfilePicture(
                          image: post.user.image, height: 48, width: 48),
                      title: Text(
                        post.user.username,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      subtitle: Text(
                        post.createdAt.elapsed(),
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(color: AppTheme.grey),
                      ),
                      trailing: PopupMenuButton<String>(
                        onSelected: (value) {
                          if (value == 'Signaler') {
                            postCubit.report();
                          } else if (value == 'Supprimer') {
                            postCubit.delete();
                          }
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
                              value: choice,
                              child: Text(choice),
                            );
                          }).toList();
                        },
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: AnimatedSize(
                          duration: const Duration(milliseconds: 300),
                          alignment: Alignment.topCenter,
                          curve: Curves.easeInOut,
                          child: ReadMoreText(
                            post.content,
                            trimMode: _trimMode,
                            trimLines: 3,
                            isCollapsed: isCollapsed,
                            style: Theme.of(context).textTheme.bodyMedium,
                            colorClickableText: Theme.of(context).primaryColor,
                            trimCollapsedText: 'Lire plus',
                            trimExpandedText: ' moins',
                          ),
                        )),
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
                          return Container(
                            height: 368,
                            width: double.infinity,
                            color:
                                Theme.of(context).colorScheme.tertiaryContainer,
                            child: Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        (loadingProgress.expectedTotalBytes ??
                                            1)
                                    : null,
                                color: Theme.of(context).colorScheme.tertiary,
                                backgroundColor: Theme.of(context)
                                    .colorScheme
                                    .onTertiaryContainer,
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
              ButtonPost(postCubit: context.read<PostCubit>())
            ],
          ),
        ),
      );
    });
  }
}
