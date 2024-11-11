import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:potatoes/auto_list/widgets/auto_list_view.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/common/bloc/common_cubit.dart';
import 'package:umai/common/bloc/user_cubit.dart';
import 'package:umai/common/screens/common_details.dart';
import 'package:umai/common/widgets/profile_picture.dart';
import 'package:umai/account/screens/person_account.dart';
import 'package:umai/social/bloc/action_comment_cubit.dart';
import 'package:umai/social/bloc/comment_cubit.dart';
import 'package:umai/social/bloc/load_comment_cubit.dart';
import 'package:umai/social/model/comment.dart';
import 'package:umai/social/widget/action_comment.dart';
import 'package:umai/social/widget/action_comment_response.dart';
import 'package:umai/social/widget/item_comment.dart';
import 'package:umai/utils/dialogs.dart';
import 'package:umai/utils/themes.dart';
import 'package:umai/utils/time_elapsed.dart';

class ItemCommentResponse<
    T extends XItem,
    C extends XCommonCubit<T>,
    A extends ActionCommentBaseCubit<C>,
    L extends BaseLoadCommentCubit<T>> extends StatefulWidget {
  final String idItem;
  static Widget get<T extends XItem, C extends XCommonCubit,
      A extends ActionCommentBaseCubit<C>, L extends BaseLoadCommentCubit<T>>({
    required BuildContext context,
    required String idItem,
    required Comment comment,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                CommentCubit<XItem>(context.read<XService<T>>(), comment)),
        BlocProvider.value(
          value: context.read<C>(),
        )
      ],
      child: ItemCommentResponse._(idItem: idItem),
    );
  }

  const ItemCommentResponse._({
    required this.idItem,
  });
  @override
  State<ItemCommentResponse<T, C, A, L>> createState() =>
      _ItemCommentResponseState<T, C, A, L>();
}

class _ItemCommentResponseState<T extends XItem, C extends XCommonCubit<T>,
        A extends ActionCommentBaseCubit<C>, L extends BaseLoadCommentCubit<T>>
    extends State<ItemCommentResponse<T, C, A, L>> {
  late final CommentCubit commentCubit = context.read<CommentCubit<T>>();
  late final loadCommentCubit = LoadCommentCubit(
    context.read(),
    widget.idItem,
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
                  GestureDetector(
                      child: ProfilePicture(
                        image: comment.user.image,
                        height: 32,
                        width: 32,
                      ),
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PersonAccountScreen.get(
                              context: context, user: comment.user))))
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
                          color: AppTheme.disabledText,
                        ),
                  ),
                  const SizedBox(width: 8),
                  PopupMenuButton<String>(
                    onSelected: (value) {
                      if (value == 'Signaler') {
                        reportComment(context: context);
                      } else if (value == 'Supprimer') {
                        context.read<LoadCommentCubit>().deleteComment(comment);
                      } else if (value == 'Copier') {
                        Clipboard.setData(ClipboardData(text: comment.content))
                            .then((_) {
                          showSuccessToast(
                              context: context,
                              content:
                                  'Commentaire copié dans le presse-papiers');
                        });
                      }
                    },
                    padding: EdgeInsets.zero,
                    itemBuilder: (BuildContext context) {
                      List<String> options = ['Copier'];

                      if (comment.user.id ==
                          context.read<UserCubit>().user.id) {
                        options.add('Supprimer');
                      } else {
                        options.add('Signaler');
                      }
                      return options.map((String choice) {
                        return PopupMenuItem<String>(
                          padding:
                              const EdgeInsets.only(right: 48.0, left: 16.0),
                          textStyle: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onSurface),
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
            const ActionCommentResponse()
          ],
        ),
        if (state is SeeCommentResponseState)
          AutoListView.get<Comment>(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            cubit: loadCommentCubit,
            itemBuilder: (context, comment) => ItemCommentResponse.get(
                context: context, comment: comment, idItem: widget.idItem),
            loadingBuilder: (context) => Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(16),
                child: LinearProgressIndicator(
                  color: Theme.of(context).colorScheme.onTertiaryContainer,
                  backgroundColor:
                      Theme.of(context).colorScheme.tertiaryContainer,
                  borderRadius: BorderRadius.circular(30),
                )),
            loadingMoreBuilder: (context) => Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(16),
                child: LinearProgressIndicator(
                  color: Theme.of(context).colorScheme.onTertiaryContainer,
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
      ]);
    });
  }
}
