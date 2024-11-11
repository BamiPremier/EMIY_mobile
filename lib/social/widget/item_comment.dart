import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:potatoes/auto_list/widgets/auto_list_view.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/account/screens/person_account.dart';
import 'package:umai/common/bloc/common_cubit.dart';
import 'package:umai/common/bloc/user_cubit.dart';
import 'package:umai/common/screens/common_details.dart';
import 'package:umai/common/widgets/bottom_sheet.dart';
import 'package:umai/common/widgets/buttons.dart';
import 'package:umai/common/widgets/profile_picture.dart';
import 'package:umai/social/bloc/action_comment_cubit.dart';
import 'package:umai/social/bloc/comment_cubit.dart';
import 'package:umai/social/bloc/load_comment_cubit.dart';
import 'package:umai/social/bloc/post_cubit.dart';
import 'package:umai/social/model/comment.dart';
import 'package:umai/social/widget/action_comment.dart';
import 'package:umai/social/widget/item_comment_response.dart';
import 'package:umai/utils/dialogs.dart';
import 'package:umai/utils/themes.dart';
import 'package:umai/utils/time_elapsed.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:potatoes/auto_list/widgets/auto_list_view.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/account/screens/person_account.dart';
import 'package:umai/common/bloc/common_cubit.dart';
import 'package:umai/common/screens/common_details.dart';
import 'package:umai/common/widgets/profile_picture.dart';
import 'package:umai/social/bloc/action_comment_cubit.dart';
import 'package:umai/social/bloc/comment_cubit.dart';
import 'package:umai/social/bloc/load_comment_cubit.dart';
import 'package:umai/social/model/comment.dart';
import 'package:umai/utils/themes.dart';

class ItemComment<
    T extends XItem,
    C extends XCommonCubit<T>,
    A extends ActionCommentBaseCubit<C>,
    L extends BaseLoadCommentCubit<T>> extends StatefulWidget {
  const ItemComment._();

  static Widget get<T extends XItem, C extends XCommonCubit<T>,
      A extends ActionCommentBaseCubit<C>, L extends BaseLoadCommentCubit<T>>({
    required BuildContext context,
    required Comment comment,
    required String idItem,
  }) {
    return MultiBlocProvider(providers: [
      BlocProvider(
          create: (context) =>
              CommentCubit<XItem>(context.read<XService<T>>(), comment)),
      BlocProvider.value(
        value: context.read<C>(),
      )
    ], child: ItemComment._());
  }

  @override
  State<ItemComment<T, C, A, L>> createState() =>
      _ItemCommentState<T, C, A, L>();
}

class _ItemCommentState<
    T extends XItem,
    C extends XCommonCubit<T>,
    A extends ActionCommentBaseCubit<C>,
    L extends BaseLoadCommentCubit<T>> extends State<ItemComment<T, C, A, L>> {
  late final CommentCubit commentCubit = context.read<CommentCubit<T>>();
  late final C postCubit = context.read<C>();
  late final LoadCommentCubit loadCommentCubit = LoadCommentCubit(
    context.read(),
    postCubit.x.itemId,
    commentCubit.comment.id,
    context.read(),
  );

  @override
  void dispose() {
    loadCommentCubit.close();
    super.dispose();
  }

  late final comment = commentCubit.comment;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommentCubit<T>, CommentState>(
        builder: (context, state) {
      print(state);
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: const EdgeInsets.only(top: 8.0, left: 16.0),
              leading: GestureDetector(
                child: ProfilePicture(
                  image: comment.user.image,
                  height: 40,
                  width: 40,
                ),
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PersonAccountScreen.get(
                        context: context, user: comment.user))),
              ),
              title: GestureDetector(
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
                          color: AppTheme.disabledText,
                        ),
                  ),
                  const SizedBox(width: 8),
                  PopupMenuButton<String>(
                    onSelected: (value) {
                      if (value == 'Signaler') {
                        reportComment(context: context);
                      } else if (value == 'Supprimer') {
                        loadCommentCubit.deleteComment(comment);
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
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            ActionComment<T, C, A>(),
          ],
        ),
        if (state is SeeCommentResponseState) const Divider(),
        if (state is SeeCommentResponseState)
          AutoListView.get<Comment>(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            cubit: loadCommentCubit,
            itemBuilder: (context, comment) =>
                ItemCommentResponse.get<T, C, A, L>(
                    context: context,
                    comment: comment,
                    idItem: postCubit.x.itemId),
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
        if (state is SeeCommentResponseState) const Divider(),
      ]);
    });
  }
}

Future reportComment({required BuildContext context}) {
  late final commentCubit = context.read<CommentCubit>();
  String? selectedReason;

  return showAppBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return BlocProvider.value(
              value: commentCubit,
              child: BlocBuilder<CommentCubit, CommentState>(
                builder: (context, state) => Padding(
                  padding: const EdgeInsets.only(top: 24.0, bottom: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text('Signaler ce contenu ?',
                          style: Theme.of(context).textTheme.titleLarge!),
                      (state is SendCommentRepportLoadingState)
                          ? const Padding(
                              padding: EdgeInsets.only(top: 118.0, bottom: 130),
                              child: Center(
                                child: CircularProgressIndicator(),
                              ))
                          : (state is SuccessSendCommentRepportState)
                              ? Center(
                                  child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                              horizontal: 16.0)
                                          .copyWith(top: 80, bottom: 100),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            const Text(
                                              'Merci d’avoir signalé ce contenu. Nous allons prendre les mesures nécessaires en cas de contenu inapproprié avéré.',
                                              textAlign: TextAlign.center,
                                            ),
                                            const SizedBox(height: 40.0),
                                            Icon(
                                              Icons.check_box_outlined,
                                              size: 40.0,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onSurfaceVariant,
                                            ),
                                          ])))
                              : Padding(
                                  padding: const EdgeInsets.only(top: 24),
                                  child: Column(
                                    children: [
                                      RadioListTile<String>(
                                        title: const Text(
                                            'Haine / Discrimination'),
                                        value: 'Haine / Discrimination',
                                        groupValue: selectedReason,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedReason = value;
                                          });
                                        },
                                        controlAffinity:
                                            ListTileControlAffinity.trailing,
                                      ),
                                      RadioListTile<String>(
                                        title: const Text('Contenu sexuel'),
                                        value: 'Contenu sexuel',
                                        groupValue: selectedReason,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedReason = value;
                                          });
                                        },
                                        controlAffinity:
                                            ListTileControlAffinity.trailing,
                                      ),
                                      RadioListTile<String>(
                                        title: const Text('Harcèlement'),
                                        value: 'Harcèlement',
                                        groupValue: selectedReason,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedReason = value;
                                          });
                                        },
                                        controlAffinity:
                                            ListTileControlAffinity.trailing,
                                      ),
                                      RadioListTile<String>(
                                        title: const Text(
                                            'Divulgation d\'informations privées'),
                                        value:
                                            'Divulgation d\'informations privées',
                                        groupValue: selectedReason,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedReason = value;
                                          });
                                        },
                                        controlAffinity:
                                            ListTileControlAffinity.trailing,
                                      ),
                                      RadioListTile<String>(
                                        title: const Text('Autre'),
                                        value: 'Autre',
                                        groupValue: selectedReason,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedReason = value;
                                          });
                                        },
                                        controlAffinity:
                                            ListTileControlAffinity.trailing,
                                      ),
                                    ],
                                  ),
                                ),
                      const SizedBox(
                        height: 24,
                      ),
                      UmaiButton.primary(
                        onPressed: selectedReason != null &&
                                state is InitializingCommentState
                            ? () {
                                commentCubit.report(reason: selectedReason!);
                              }
                            : (state is SuccessSendCommentRepportState)
                                ? () {
                                    Navigator.of(context).pop();
                                    commentCubit.reset();
                                  }
                                : null,
                        text: state is SuccessSendCommentRepportState
                            ? "Fermer"
                            : "Signaler",
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      });
}
