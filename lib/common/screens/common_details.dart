import 'package:flutter/material.dart';
import 'package:potatoes/auto_list/bloc/auto_list_cubit.dart';
import 'package:potatoes/auto_list/widgets/auto_list_view.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/animes/bloc/episode_cubit.dart';
import 'package:umai/animes/models/episode.dart';
import 'package:umai/animes/services/episode_cubit_manager.dart';
import 'package:umai/animes/widgets/episode_head.dart';
import 'package:umai/common/bloc/action_comment_cubit.dart';
import 'package:umai/common/bloc/comment_cubit.dart';
import 'package:umai/common/bloc/common_cubit.dart';
import 'package:umai/common/bloc/load_comment_cubit.dart';
import 'package:umai/common/bloc/report_cubit.dart';
import 'package:umai/common/models/comment.dart';
import 'package:umai/common/models/user.dart';
import 'package:umai/common/widgets/button_common.dart';
import 'package:umai/common/widgets/comment_input.dart';
import 'package:umai/common/widgets/empty_builder.dart';
import 'package:umai/common/widgets/error_builder.dart';
import 'package:umai/common/widgets/item_comment.dart';
import 'package:umai/social/bloc/post_cubit.dart';
import 'package:umai/social/models/post.dart';
import 'package:umai/social/services/post_cubit_manager.dart';
import 'package:umai/social/widgets/head_post.dart';

mixin XItem implements XReportedItem {
  @override
  String get itemId;
  bool get itemHasLiked;

  String get itemContent;
  String? get itemImage;
  int get itemCommentsCount;
  User? get itemUser;
  bool? get itemReported;

  DateTime get itemCreatedAt;
  copyWithLike({bool? hasLiked});
  copyWithCommentsCount({bool increment = true});
}

class CommonDetailsScreen<T extends XItem> extends StatefulWidget {
  final WidgetBuilder head;

  const CommonDetailsScreen({
    super.key,
    required this.head,
  });

  static Widget fromPost({
    required BuildContext context,
    required Post post,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
            value: context.read<PostCubitManager>().get(post)
                as XCommonCubit<Post>),
        BlocProvider(
            create: (context) => ActionCommentCubit(
                    context.read<XCommonCubit<Post>>() as PostCubit)
                as ActionCommentBaseCubit<XCommonCubit<Post>>),
        BlocProvider(
            create: (context) => LoadCommentCubit(
                    context.read(), post.itemId, '', context.read())
                as BaseLoadCommentCubit<Post>),
      ],
      child: CommonDetailsScreen<Post>(head: (_) => const HeadPost()),
    );
  }

  static Widget fromEpisode({
    required BuildContext context,
    required Episode episode,
  }) {
    return MultiBlocProvider(
        providers: [
          BlocProvider.value(
              value: context.read<EpisodeCubitManager>().get(episode)
                  as XCommonCubit<Episode>),
          BlocProvider(
              create: (context) => ActionCommentEpisodeCubit(
                    context.read<XCommonCubit<Episode>>() as EpisodeCubit,
                  ) as ActionCommentBaseCubit<XCommonCubit<Episode>>),
          BlocProvider(
              create: (context) => LoadCommentEpisodeCubit(
                    context.read(),
                    episode.id,
                    '',
                    context.read(),
                  ) as BaseLoadCommentCubit<Episode>),
        ],
        child: CommonDetailsScreen<Episode>(
          head: (context) => EpisodeHead.get(
            context: context,
            episode: episode,
          ),
        ));
  }

  @override
  State<CommonDetailsScreen<T>> createState() => _CommonDetailsScreenState<T>();
}

class _CommonDetailsScreenState<T extends XItem>
    extends State<CommonDetailsScreen<T>> {
  late final BaseLoadCommentCubit<T> loadCommentCubit =
      context.read<BaseLoadCommentCubit<T>>();
  final ValueNotifier<bool> isCollapsed = ValueNotifier<bool>(true);
  late final XCommonCubit<T> itemCubit = context.read<XCommonCubit<T>>();
  late final ActionCommentBaseCubit<XCommonCubit<T>> actionCommentCubit =
      context.read<ActionCommentBaseCubit<XCommonCubit<T>>>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    loadCommentCubit.close();
    super.dispose();
  }

  void onReportEventReceived(BuildContext context, XReportState state) async {
    if (state is SuccessReportItemState) {
      if (state.item is Comment) {
        loadCommentCubit.deleteComment(state.item as Comment);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<XCommonCubit<T>, XCommonState>(
      listener: (context, state) {
        if (state is CommentItemSuccessState) {
          loadCommentCubit.putFirst(state.comment);
        }
      },
      builder: (context, state) {
        return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Colors.white.withOpacity(0.6),
            ),
            body: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            height: kToolbarHeight +
                                MediaQuery.of(context).viewPadding.top),
                        widget.head(context),
                        ButtonCommon<T>(canComment: true),
                        const Divider(),
                        BlocProvider.value(
                            value: loadCommentCubit,
                            child: BlocBuilder<BaseLoadCommentCubit<T>,
                                    AutoListState<Comment>>(
                                builder: (context, state) =>
                                    AutoListView.get<Comment>(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      autoManage: false,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      cubit: loadCommentCubit,
                                      itemBuilder: (context, comment) =>
                                          MultiBlocProvider(
                                        providers: [
                                          BlocProvider(
                                            create: (context) =>
                                                CommentCubit<T>(
                                              context.read<XService<T>>(),
                                              comment,
                                            ),
                                          ),
                                          BlocProvider.value(
                                            value:
                                                context.read<XCommonCubit<T>>(),
                                          ),
                                          BlocProvider.value(
                                            value: context.read<
                                                ActionCommentBaseCubit<
                                                    XCommonCubit<T>>>(),
                                          ),
                                        ],
                                        child: ItemComment.get<T>(
                                          onReportEventReceived:
                                              onReportEventReceived,
                                        ),
                                      ),
                                      loadingBuilder: (context) => Container(
                                          alignment: Alignment.center,
                                          padding: const EdgeInsets.all(16),
                                          child: LinearProgressIndicator(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onTertiaryContainer,
                                            backgroundColor: Theme.of(context)
                                                .colorScheme
                                                .tertiaryContainer,
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          )),
                                      loadingMoreBuilder: (context) =>
                                          Container(
                                              alignment: Alignment.center,
                                              padding: const EdgeInsets.all(16),
                                              child: LinearProgressIndicator(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onTertiaryContainer,
                                                backgroundColor:
                                                    Theme.of(context)
                                                        .colorScheme
                                                        .tertiaryContainer,
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              )),
                                      emptyBuilder: (ctx) =>
                                          const EmptyBuilder(),
                                      errorBuilder: (context, retry) =>
                                          ErrorBuilder(retry: retry),
                                    )))
                      ],
                    ),
                  ),
                ),
                CommentInput<XCommonCubit<T>,
                    ActionCommentBaseCubit<XCommonCubit<T>>>()
              ],
            ));
      },
    );
  }
}
