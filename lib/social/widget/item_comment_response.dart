import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:potatoes/auto_list/widgets/auto_list_view.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/common/bloc/user_cubit.dart';
import 'package:umai/common/widgets/profile_picture.dart';
import 'package:umai/social/bloc/comment_cubit.dart';
import 'package:umai/social/bloc/load_comment_cubit.dart';
import 'package:umai/social/bloc/action_comment_cubit.dart';
import 'package:umai/social/model/comment.dart';
import 'package:umai/social/widget/action_comment_response.dart';
import 'package:umai/utils/themes.dart';
import 'package:umai/utils/time_elapsed.dart';

class ItemCommentResponse extends StatefulWidget {
  final String idPost;
  static Widget get({
    required BuildContext context,
    required String idPost,
    required Comment comment,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => CommentCubit(context.read(), comment)),
        // BlocProvider(
        //     create: (context) =>
        //         LoadCommentCubit(context.read(), idPost, comment.id)),
      ],
      child: ItemCommentResponse._(idPost: idPost),
    );
  }

  const ItemCommentResponse._({
    required this.idPost,
  });
  @override
  State<ItemCommentResponse> createState() => _ItemCommentResponseState();
}

class _ItemCommentResponseState extends State<ItemCommentResponse> {
  late final commentCubit = context.read<CommentCubit>();
  late final loadCommentCubit =
      LoadCommentCubit(context.read(), widget.idPost, comment.id);
  late final comment = commentCubit.comment!;

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
                contentPadding: const EdgeInsets.only(top: 8.0, left: 8.0),
                leading: SizedBox(
                  child: Row(mainAxisSize: MainAxisSize.min, children: [
                    const Icon(
                      Icons.subdirectory_arrow_right,
                      color: Color(0xFF5F6368),
                      size: 24,
                    ),
                    ProfilePicture(
                      image: comment.user.image,
                      height: 32,
                      width: 32,
                    )
                  ]),
                ),
                title: Text(
                  comment.user.username,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                subtitle: null,
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      comment.createdAt.elapsed(),
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color: AppTheme.grey,
                          ),
                    ),
                    const SizedBox(width: 8),
                    PopupMenuButton<String>(
                      onSelected: (value) {
                        if (value == 'Signaler') {
                          commentCubit.signalerComment();
                        } else if (value == 'Supprimer') {
                          context
                              .read<LoadCommentCubit>()
                              .deleteComment(comment);
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
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              ActionCommentResponse()
            ],
          ),
          if (state is SeeCommentResponseState)
            AutoListView.get<Comment>(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              cubit: loadCommentCubit,
              itemBuilder: (context, comment) => ItemCommentResponse.get(
                  context: context, comment: comment, idPost: widget.idPost),
              loadingBuilder: (context) => Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(16),
                child: const SizedBox(
                  height: 30,
                  width: 30,
                  child: CircularProgressIndicator(),
                ),
              ),
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
        ]);
      });
    });
  }
}
