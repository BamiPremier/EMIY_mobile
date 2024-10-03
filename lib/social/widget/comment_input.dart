import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:potatoes/auto_list/bloc/auto_list_cubit.dart';
import 'package:potatoes/auto_list/widgets/auto_list_view.dart';
import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';
import 'package:umai/auth/bloc/auth_cubit.dart';
import 'package:umai/common/bloc/person_cubit.dart';
import 'package:umai/common/bloc/user_cubit.dart';
import 'package:umai/common/utils/validators.dart';
import 'package:umai/common/widgets/image_profil.dart';
import 'package:umai/social/cubit/comment_cubit.dart';
import 'package:umai/social/cubit/load_comment_cubit.dart';
import 'package:umai/social/cubit/post_cubit.dart';
import 'package:umai/social/cubit/y_comment_cubit.dart';
import 'package:umai/social/model/comment.dart';
import 'package:umai/social/model/post.dart';
import 'package:umai/social/screens/post_details.dart';
import 'package:umai/social/services/social_service.dart';
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/text_utils.dart';
import 'package:umai/utils/themes.dart';

class CommentInput extends StatefulWidget {
  static Widget from({required PostCubit cubit}) {
    return MultiBlocProvider(providers: [
      BlocProvider.value(value: cubit),
    ], child: CommentInput._());
  }

  const CommentInput._();

  @override
  State<CommentInput> createState() => _CommentInputState();
}

class _CommentInputState extends State<CommentInput> {
  final TextEditingController _commentController = TextEditingController();
  late final postCubit = context.read<PostCubit>();

  final focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<YCommentCubit, YCommentState>(
        listener: (context, ystate) {
          if (ystate is YCommentSelectedState) {
            FocusScope.of(context).requestFocus(focusNode);
          }
        },
        builder: (context, ystate) => BlocConsumer<PostCubit, PostState>(
            listener: (context, state) {
              if (state is CommentPostSuccesState) {
                setState(() {
                  _commentController.clear();
                });
              }
            },
            builder: (context, state) => Container(
                  // padding: EdgeInsets.only(
                  //     bottom: MediaQuery.of(context).viewInsets.bottom),
                  color: Theme.of(context)
                      .bottomNavigationBarTheme
                      .backgroundColor,

                  child: Container(
                    margin: EdgeInsets.all(16),
                    color: Theme.of(context)
                        .bottomNavigationBarTheme
                        .backgroundColor,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                              readOnly:
                                  state is PostLoadingState ? true : false,
                              controller: _commentController,
                              decoration: InputDecoration(
                                hintText: (ystate is YCommentSelectedState &&
                                        ystate.selectedComment != null)
                                    ? 'Réponse à ${ystate.selectedComment!.user.username}'
                                    : "Ajouter un commentaire...",
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurfaceVariant,
                                        overflow: TextOverflow.ellipsis),
                              ),
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.done,
                              textCapitalization: TextCapitalization.sentences,
                              focusNode: focusNode,
                              validator: Validators.empty,
                              onTapOutside: (_) =>
                                  FocusScope.of(context).unfocus()),
                        ),
                        SizedBox(width: 8),
                        IconButton(
                          padding: EdgeInsets.zero,
                          icon: CircleAvatar(
                              backgroundColor: Theme.of(context).primaryColor,
                              radius: 24,
                              child: state is PostLoadingState
                                  ? const SizedBox(
                                      width: 10,
                                      height: 10,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: AppTheme.white,
                                      ),
                                    )
                                  : Icon(Icons.arrow_upward)),
                          onPressed: () {
                            if (Validators.empty(_commentController.text) ==
                                null) {
                              postCubit.commentPost(
                                  content: _commentController.text,
                                  targetCommentId:
                                      (ystate is YCommentSelectedState &&
                                              ystate.selectedComment != null)
                                          ? ystate.selectedComment!.id
                                          : null);
                            }

                            // Action du bouton
                          },
                        ),
                      ],
                    ),
                  ),
                )));
  }
}
