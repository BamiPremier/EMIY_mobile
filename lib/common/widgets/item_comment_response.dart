import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:potatoes/auto_list/widgets/auto_list_view.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/account/screens/person_account.dart';
import 'package:umai/common/bloc/action_comment_cubit.dart';
import 'package:umai/common/bloc/comment_cubit.dart';
import 'package:umai/common/bloc/common_cubit.dart';
import 'package:umai/common/bloc/load_comment_cubit.dart';
import 'package:umai/common/bloc/report_cubit.dart';
import 'package:umai/common/bloc/user_cubit.dart';
import 'package:umai/common/models/comment.dart';
import 'package:umai/common/screens/common_details.dart';
import 'package:umai/common/services/report_util_service.dart';
import 'package:umai/common/widgets/action_comment_response.dart';
import 'package:umai/common/widgets/empty_builder.dart';
import 'package:umai/common/widgets/error_builder.dart';
import 'package:umai/common/widgets/profile_picture.dart';
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/dialogs.dart';
import 'package:umai/utils/svg_utils.dart';
import 'package:umai/utils/themes.dart';
import 'package:umai/utils/time_elapsed.dart';
// Start of Selection

class ItemCommentResponse<T extends XItem> extends StatefulWidget {
  final void Function(BuildContext context, XReportState state)
      onReportEventReceived;

  static Widget get<T extends XItem>(
      {required void Function(BuildContext context, XReportState state)
          onReportEventReceived}) {
    return BlocProvider(
      create: (context) => BaseLoadCommentCubit<T>(
        context.read<XService<T>>(),
        context.read<XCommonCubit<T>>().x.itemId,
        context.read<CommentCubit<T>>().comment.id,
        context.read(),
      ),
      child:
          ItemCommentResponse<T>(onReportEventReceived: onReportEventReceived),
    );
  }

  const ItemCommentResponse({
    super.key,
    required this.onReportEventReceived,
  });
  @override
  State<ItemCommentResponse<T>> createState() => _ItemCommentResponseState<T>();
}

class _ItemCommentResponseState<T extends XItem>
    extends State<ItemCommentResponse<T>> {
  late final CommentCubit<T> commentCubit = context.read<CommentCubit<T>>();
  late final XCommonCubit<T> objectDataCubit = context.read<XCommonCubit<T>>();
  late final BaseLoadCommentCubit<T> loadCommentCubit =
      context.read<BaseLoadCommentCubit<T>>();
  late final ActionCommentBaseCubit<XCommonCubit<T>> actionCommentBaseCubit =
      context.read<ActionCommentBaseCubit<XCommonCubit<T>>>();
  late final comment = commentCubit.comment;

  void onReportEventReceived(BuildContext context, XReportState state) async {
    if (state is SuccessReportItemState) {
      if (state.item is Comment) {
        loadCommentCubit.deleteComment(state.item as Comment);
      }
    }
  }

  @override
  void dispose() {
    loadCommentCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommentCubit<T>, CommentState>(
        builder: (context, state) {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: const EdgeInsets.only(top: 8.0, left: 8.0),
              leading: SizedBox(
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  toSvgIcon(
                      icon: Assets.iconsDirectionRight,
                      color: AppTheme.surfaceGrey,
                      size: 16),
                  const SizedBox(width: 8.0),
                  GestureDetector(
                      child: ProfilePicture(
                        image: comment.user.image,
                        size: 24,
                      ),
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PersonAccountScreen.get(
                              context: context, user: comment.user))))
                ]),
              ),
              title: Text(
                comment.user.username,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontWeight: FontWeight.bold),
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
                        reportUtilService<T>(
                            onReportEventReceived: widget.onReportEventReceived,
                            item: comment,
                            isComment: true,
                            reportService: context.read<XService<T>>(),
                            context: context);
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
            ActionCommentResponse<T, XCommonCubit<T>,
                    ActionCommentBaseCubit<XCommonCubit<T>>>(
                actionCommentBaseCubit: actionCommentBaseCubit)
          ],
        ),
        if (state is SeeCommentResponseState)
          AutoListView.get<Comment>(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
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
                    value:
                        context.read<ActionCommentBaseCubit<XCommonCubit<T>>>(),
                  ),
                ],
                child: ItemCommentResponse.get<T>(
                    onReportEventReceived: onReportEventReceived)),
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
            emptyBuilder: (ctx) => const EmptyBuilder(),
            errorBuilder: (context, retry) => ErrorBuilder(retry: retry),
          ),
      ]);
    });
  }
}
