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
import 'package:umai/common/bloc/action_comment_cubit.dart';
import 'package:umai/common/bloc/comment_cubit.dart';
import 'package:umai/common/bloc/load_comment_cubit.dart'; 
import 'package:umai/common/models/comment.dart';
import 'package:umai/common/widgets/action_comment.dart';
import 'package:umai/common/widgets/item_comment_response.dart';
import 'package:umai/utils/dialogs.dart';
import 'package:umai/utils/themes.dart';
import 'package:umai/utils/time_elapsed.dart'; 

class ItemComment<T extends XItem> extends StatefulWidget {
  final Comment comment;
  final String idItem;
  final ActionCommentBaseCubit<XCommonCubit<T>> actionCommentBaseCubit;

  // Utilisez un constructeur normal au lieu d'une méthode statique
  const ItemComment({
    required this.comment,
    required this.idItem,
    required this.actionCommentBaseCubit,
    Key? key,
  }) : super(key: key);

  @override
  State<ItemComment<T>> createState() => _ItemCommentState<T>();
}

class _ItemCommentState<T extends XItem> extends State<ItemComment<T>> {
  late final CommentCubit<T> commentCubit = context.read<CommentCubit<T>>();
  late final XCommonCubit<T> objectDataCubit = context.read<XCommonCubit<T>>();
  late final BaseLoadCommentCubit<T> loadCommentCubit;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    loadCommentCubit = BaseLoadCommentCubit<T>(
      context.read(),
      objectDataCubit.x.itemId,
      commentCubit.comment.id,
      context.read(),
    );

    context.dependOnInheritedWidgetOfExactType();
  }

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
                        reportComment(
                            context: context, commentCubit: commentCubit);
                      } else if (value == 'Supprimer') {
                        loadCommentCubit.deleteComment(comment);
                      } else if (value == 'Copier') {
                        Clipboard.setData(ClipboardData(text: comment.content))
                            .then((_) {
                          if (mounted) {
                            showSuccessToast(
                                context: context,
                                content:
                                    'Commentaire copié dans le presse-papiers');
                          }
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
            ActionComment<T, XCommonCubit<T>, ActionCommentBaseCubit<XCommonCubit<T>>>(
                actionCommentBaseCubit: widget.actionCommentBaseCubit)
          ],
        ),
        if (state is SeeCommentResponseState) const Divider(),
        if (state is SeeCommentResponseState)
          AutoListView.get<Comment>(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            cubit: loadCommentCubit,
            itemBuilder: (context, comment) => MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (context) => CommentCubit<T>(
                      context.read<XService<T>>(),
                      comment,
                    ),
                  ),
                  BlocProvider.value(
                    value: context.read<XCommonCubit<T>>(),
                  ),
                  BlocProvider.value(
                    value: context.read<ActionCommentBaseCubit<XCommonCubit<T>>>(),
                  ),
                ],
                child: ItemCommentResponse<T>(
                    comment: comment,
                    idItem: objectDataCubit.x.itemId,
                    actionCommentBaseCubit: widget.actionCommentBaseCubit)),
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

Future reportComment<T>(
    {required BuildContext context, required CommentCubit<T> commentCubit}) {
  String? selectedReason;

  return showAppBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return BlocProvider.value(
              value: commentCubit,
              child: BlocBuilder<CommentCubit<T>, CommentState>(
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
