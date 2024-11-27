import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:readmore/readmore.dart';
import 'package:umai/activity/widgets/activity/actu_btn_type3.dart';
import 'package:umai/activity/widgets/activity/actu_head.dart';
import 'package:umai/activity/widgets/activity/post/post_info.dart';
import 'package:umai/common/bloc/action_comment_cubit.dart';
import 'package:umai/common/bloc/comment_cubit.dart';
import 'package:umai/common/bloc/common_cubit.dart';
import 'package:umai/common/models/comment.dart';
import 'package:umai/common/screens/common_details.dart';
import 'package:umai/social/bloc/post_cubit.dart';
import 'package:umai/social/models/post.dart';
import 'package:umai/social/services/post_cubit_manager.dart';

class CommentPostWidget extends StatefulWidget {
  final Post? post;
  final Comment comment;
  final String targetEntity;

  const CommentPostWidget.forNoPost({
    required this.comment,
    required this.targetEntity,
  }) : post = null;

  const CommentPostWidget.forPost({
    required this.post,
    required this.comment,
    required this.targetEntity,
  });

  static Widget get({
    required BuildContext context,
    Post? post,
    required Comment comment,
    required dynamic targetEntity,
  }) {
    return (post == null)
        ? CommentPostWidget.forNoPost(
            comment: comment, targetEntity: targetEntity)
        : MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: context.read<PostCubitManager>().get(post),
              ),
              BlocProvider<XCommonCubit<Post>>(
                  create: (context) =>
                      context.read<PostCubit>() as XCommonCubit<Post>),
              BlocProvider(
                  create: (context) =>
                      ActionCommentCubit(context.read<PostCubit>())
                          as ActionCommentBaseCubit<XCommonCubit<Post>>),
              BlocProvider(
                create: (context) => CommentCubit<Post>(
                  context.read<XService<Post>>(),
                  comment,
                ),
              ),
            ],
            child: CommentPostWidget.forPost(
              post: post,
              comment: comment,
              targetEntity: targetEntity,
            ),
          );
  }

  @override
  State<CommentPostWidget> createState() => _CommentPostWidgetState();
}

class _CommentPostWidgetState extends State<CommentPostWidget> {
  final isCollapsed = ValueNotifier<bool>(true);
  final _trimMode = TrimMode.Line;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (widget.post == null) ? buildNoPost() : buildPost(widget.post!);
  }

  Widget buildNoPost() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ActuHeadWidget.get(
            targetEntity: widget.targetEntity,
            context: context,
            user: widget.comment.user),
        Container(
            padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
            child: AnimatedSize(
                duration: const Duration(milliseconds: 300),
                alignment: Alignment.topCenter,
                curve: Curves.easeInOut,
                child: ReadMoreText(
                  widget.comment.content,
                  trimMode: _trimMode,
                  trimLines: 3,
                  isCollapsed: isCollapsed,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                  colorClickableText: Theme.of(context).primaryColor,
                  trimCollapsedText: 'Lire plus',
                  trimExpandedText: ' moins',
                ))),
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
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildPost(Post post) {
    late final ActionCommentBaseCubit<XCommonCubit<Post>> actionCommentCubit =
        context.read<ActionCommentBaseCubit<XCommonCubit<Post>>>();
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
                  )
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ActuHeadWidget.get(
                  targetEntity: widget.targetEntity,
                  context: context,
                  user: widget.comment.user),
              Container(
                  margin: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    bottom: 16,
                  ),
                  child: AnimatedSize(
                      duration: const Duration(milliseconds: 300),
                      alignment: Alignment.topCenter,
                      curve: Curves.easeInOut,
                      child: ReadMoreText(
                        widget.comment.content,
                        trimMode: _trimMode,
                        trimLines: 3,
                        isCollapsed: isCollapsed,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                        colorClickableText: Theme.of(context).primaryColor,
                        trimCollapsedText: 'Lire plus',
                        trimExpandedText: ' moins',
                      ))),
              const PostInfo(),
              ActuBtnType3Widget<Post, XCommonCubit<Post>,
                  ActionCommentBaseCubit<XCommonCubit<Post>>>(
                actionCommentBaseCubit: actionCommentCubit,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => CommonDetailsScreen.fromPost(
                            context: context,
                            post: post)),
                  );
                },
              )
            ],
          ));
    });
  }
}
