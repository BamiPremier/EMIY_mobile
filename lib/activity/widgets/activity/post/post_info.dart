import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:readmore/readmore.dart';
import 'package:umai/account/screens/person_account.dart'; 
import 'package:umai/activity/widgets/activity/post/post_actu_image.dart'; 
import 'package:umai/common/bloc/common_cubit.dart'; 
import 'package:umai/common/screens/common_details.dart'; 
import 'package:umai/common/widgets/profile_picture.dart';
import 'package:umai/social/bloc/post_cubit.dart';
import 'package:umai/social/models/post.dart'; 
import 'package:umai/social/widgets/head_post.dart'; 
import 'package:umai/utils/themes.dart';
import 'package:umai/utils/time_elapsed.dart';

class PostInfo extends StatefulWidget {
  @override
  State<PostInfo> createState() => _PostInfoState();
}

class _PostInfoState extends State<PostInfo> {
  final isCollapsed = ValueNotifier<bool>(true);
  final _trimMode = TrimMode.Line;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
     late final postCubit = context.read<PostCubit>();

    return BlocBuilder<PostCubit, XCommonState>(builder: (context, state) {
      final post = postCubit.x as Post;
      return GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) => CommonDetailsScreen.fromPost(
                    context: context,
                    post: post,
                    head: (context) => const HeadPost())),
          );
        },
        child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onInverseSurface,
              borderRadius: BorderRadius.circular(8)),
          margin: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: <Widget>[
                            GestureDetector(
                              child: ProfilePicture(
                                image: post.user.image,
                                size: 24.0,
                              ),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        PersonAccountScreen.get(
                                            context: context,
                                            user: post.user)));
                              },
                            ),
                            const SizedBox(width: 4),
                            Expanded(
                              child: GestureDetector(
                                child: Text(
                                  post.user.username,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurfaceVariant,
                                      ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          PersonAccountScreen.get(
                                              context: context,
                                              user: post.user)));
                                },
                              ),
                            ),
                            Text(
                              post.createdAt.elapsed(),
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(color: AppTheme.disabledText),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        AnimatedSize(
                            duration: const Duration(milliseconds: 300),
                            alignment: Alignment.topCenter,
                            curve: Curves.easeInOut,
                            child: ReadMoreText(
                              post.content,
                              trimMode: _trimMode,
                              trimLines: 3,
                              isCollapsed: isCollapsed,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurfaceVariant,
                                  ),
                              colorClickableText:
                                  Theme.of(context).primaryColor,
                              trimCollapsedText: 'Lire plus',
                              trimExpandedText: ' moins',
                            )),
                      ])),
              if (post.image?.isNotEmpty ?? false)
                PostActuImage(url: post.image!),
            ],
          ),
        ),
      );
    });
  }
}
