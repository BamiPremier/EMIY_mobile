import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/activity/widgets/activity/activity_btn_type1.dart';
import 'package:umai/activity/widgets/activity/activity_head.dart';
import 'package:umai/activity/widgets/activity/post/post_info.dart';
import 'package:umai/common/bloc/common_cubit.dart';
import 'package:umai/common/bloc/person_cubit.dart';
import 'package:umai/common/models/user.dart';
import 'package:umai/common/screens/common_details.dart';
import 'package:umai/common/services/person_cubit_manager.dart';
import 'package:umai/social/bloc/post_cubit.dart';
import 'package:umai/social/models/post.dart';
import 'package:umai/social/services/post_cubit_manager.dart';

class LikePostWidget extends StatefulWidget {
  final Post? post;
  final String targetEntity;

  const LikePostWidget.forNoPost({
    required this.targetEntity,
  }) : post = null;

  const LikePostWidget.forPost({
    required this.post,
    required this.targetEntity,
  });

  static Widget get({
    required BuildContext context,
    Post? post,
    required User user,
    required String targetEntity,
  }) {
    if (post == null) {
      return BlocProvider.value(
          value: context.read<PersonCubitManager>().get(user),
          child: LikePostWidget.forNoPost(targetEntity: targetEntity));
    } else {
      final postCubit = context.read<PostCubitManager>().get(post);
      return MultiBlocProvider(
        providers: [
          BlocProvider.value(value: postCubit),
          BlocProvider<XCommonCubit<Post>>.value(value: postCubit),
          BlocProvider.value(
            value: context.read<PersonCubitManager>().get(user),
          ),
        ],
        child: LikePostWidget.forPost(post: post, targetEntity: targetEntity),
      );
    }
  }

  @override
  State<LikePostWidget> createState() => _LikePostWidgetState();
}

class _LikePostWidgetState extends State<LikePostWidget> {
  final isCollapsed = ValueNotifier<bool>(true);
  @override
  Widget build(BuildContext context) {
    return (widget.post == null) ? buildNoPost() : buildPost(widget.post!);
  }

  Widget buildNoPost() {
    final user = context.read<PersonCubit>().user;
    return Container(
        margin: const EdgeInsets.only(
          left: 8,
          right: 8,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ActivityHeadWidget.get(
                targetEntity: widget.targetEntity,
                context: context,
                user: user),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onInverseSurface,
                        borderRadius: BorderRadius.circular(8)),
                    child: Text(
                      "Le contenu n’est plus disponible",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }

  Widget buildPost(Post post) {
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
                      )),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ActivityHeadWidget.get(
                  targetEntity: widget.targetEntity,
                  context: context,
                  user: post.user),
              const SizedBox(height: 8),
              const PostInfo(),
              ActivityBtnType1Widget<Post>(onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => CommonDetailsScreen.fromPost(
                            context: context,
                            post: post,
                          )),
                );
              })
            ],
          ));
    });
  }
}
