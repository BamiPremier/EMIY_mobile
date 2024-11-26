import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:readmore/readmore.dart';
import 'package:umai/account/screens/person_account.dart';
import 'package:umai/activitie/widgets/activitie/actu_btn_type1.dart';
import 'package:umai/activitie/widgets/activitie/actu_btn_type3.dart';
import 'package:umai/activitie/widgets/activitie/actu_head.dart';
import 'package:umai/activitie/widgets/activitie/post/post_actu_image.dart';
import 'package:umai/common/bloc/action_comment_cubit.dart';
import 'package:umai/common/bloc/common_cubit.dart';
import 'package:umai/common/bloc/person_cubit.dart';
import 'package:umai/common/bloc/user_cubit.dart';
import 'package:umai/common/models/comment.dart';
import 'package:umai/common/services/person_cubit_manager.dart';
import 'package:umai/common/services/report_util_service.dart';
import 'package:umai/common/widgets/bottom_sheet.dart';
import 'package:umai/common/widgets/buttons.dart';
import 'package:umai/common/widgets/profile_picture.dart';
import 'package:umai/social/bloc/post_cubit.dart';
import 'package:umai/social/models/post.dart';
import 'package:umai/social/services/post_cubit_manager.dart';
import 'package:umai/social/services/social_service.dart';
import 'package:umai/social/widgets/post_image.dart';
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/svg_utils.dart';
import 'package:umai/utils/themes.dart';
import 'package:umai/utils/time_elapsed.dart';

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
              BlocProvider<XCommonCubit<Post>>(
                create: (context) => context.read<PostCubit>(),
              ),
              BlocProvider<ActionCommentBaseCubit<PostCubit>>(
                  create: (context) =>
                      ActionCommentCubit(context.read<PostCubit>())),
              BlocProvider.value(
                value: context.read<PostCubitManager>().get(post),
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
  late final ActionCommentBaseCubit<PostCubit> actionCommentCubit =
      context.read<ActionCommentBaseCubit<PostCubit>>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("build =============================${widget.post}");
    return (widget.post == null) ? buildNoPost() : buildPost(widget.post!);
  }

  Widget buildNoPost() {
    return Container(
        margin: const EdgeInsets.all(8),
        child: Column(
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
      return Container(
          margin: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ActuHeadWidget.get(
                  targetEntity: widget.targetEntity,
                  context: context,
                  user: widget.comment.user),
              Container(
                  padding: const EdgeInsets.all(8),
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
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onInverseSurface,
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  children: [
                    Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Column(children: [
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
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
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
                          const SizedBox(height: 16),
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
              ActuBtnType3Widget<Post, PostCubit,
                  ActionCommentBaseCubit<PostCubit>>(
                actionCommentBaseCubit: actionCommentCubit,
              )
            ],
          ));
    });
  }
}
