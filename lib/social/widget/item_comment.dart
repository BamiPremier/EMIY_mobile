import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:potatoes/auto_list/widgets/auto_list_view.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/common/bloc/user_cubit.dart';
import 'package:umai/common/widgets/profile_picture.dart';
import 'package:umai/account/screens/person_account.dart';
import 'package:umai/social/bloc/comment_cubit.dart';
import 'package:umai/social/bloc/load_comment_cubit.dart';
import 'package:umai/social/bloc/post_cubit.dart';
import 'package:umai/social/model/comment.dart';
import 'package:umai/social/widget/action_comment.dart';
import 'package:umai/social/widget/item_comment_response.dart';
import 'package:umai/utils/themes.dart';
import 'package:umai/utils/time_elapsed.dart';

class ItemComment extends StatefulWidget {
  static Widget get({
    required BuildContext context,
    required Comment comment,
    required String idPost,
  }) {
    return BlocProvider(
      create: (context) => CommentCubit(context.read(), comment),
      child: ItemComment(),
    );
  }

  @override
  State<ItemComment> createState() => _ItemCommentState();
}

class _ItemCommentState extends State<ItemComment> {
  late final commentCubit = context.read<CommentCubit>();
  late final postCubit = context.read<PostCubit>();
  late final loadCommentCubit = LoadCommentCubit(
    context.read(),
    postCubit.post.id,
    comment.id,
    context.read(),
  );
  late final comment = commentCubit.comment;

  @override
  void dispose() {
    // loadCommentCubit.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommentCubit, CommentState>(builder: (context, state) {
      return BlocBuilder<LoadCommentCubit, LoadCommentState>(
          builder: (context, stateL) {
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                contentPadding: const EdgeInsets.only(top: 8.0, left: 16.0),
                leading: InkWell(
                  child: ProfilePicture(
                    image: comment.user.image,
                    height: 40,
                    width: 40,
                  ),
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PersonAccountScreen.get(
                          context: context, user: comment.user))),
                ),
                title: InkWell(
                    child: Text(
                      comment.user.username,
                      style: Theme.of(context).textTheme.bodyLarge,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PersonAccountScreen.get(
                            context: context, user: comment.user)))),
                subtitle: null,
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      comment.createdAt.elapsed(),
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            color: AppTheme.grey,
                          ),
                    ),
                    const SizedBox(width: 8),
                    PopupMenuButton<String>(
                      onSelected: (value) {
                        if (value == 'Signaler') {
                          commentCubit.signalerComment();
                        } else if (value == 'Supprimer') {
                          loadCommentCubit.deleteComment(comment);
                        } else if (value == 'Copier') {
                          Clipboard.setData(
                                  ClipboardData(text: comment.content))
                              .then((_) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      'Commentaire copié dans le presse-papiers')),
                            );
                          });
                        }
                      },
                      padding: EdgeInsets.zero,
                      itemBuilder: (BuildContext context) {
                        List<String> options = ['Copier', 'Signaler'];

                        if (comment.user.id ==
                            context.read<UserCubit>().user.id) {
                          options.add('Supprimer');
                        }
                        return options.map((String choice) {
                          return PopupMenuItem<String>(
                            padding:
                                const EdgeInsets.only(right: 48.0, left: 16.0),
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
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(
                  comment.content,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              const ActionComment()
            ],
          ),
          if (state is SeeCommentResponseState) const Divider(),
          if (state is SeeCommentResponseState)
            AutoListView.get<Comment>(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              cubit: loadCommentCubit,
              itemBuilder: (context, comment) => ItemCommentResponse.get(
                  context: context,
                  comment: comment,
                  idPost: postCubit.post.id),
              loadingBuilder: (context) => Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(16),
                  child: LinearProgressIndicator(
                    color: Theme.of(context).colorScheme.tertiary,
                    backgroundColor:
                        Theme.of(context).colorScheme.tertiaryContainer,
                    borderRadius: BorderRadius.circular(30),
                  )),
              errorBuilder: (context, retry) => Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("Une erreur est survenue"),
                    TextButton(
                      onPressed: retry,
                      child: const Text("Réessayer"),
                    )
                  ],
                ),
              ),
            ),
          if (state is SeeCommentResponseState) const Divider(),
        ]);
      });
    });
  }
}
