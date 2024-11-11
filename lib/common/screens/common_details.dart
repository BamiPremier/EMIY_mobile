// Start of Selection
import 'package:flutter/material.dart';
import 'package:potatoes/auto_list/widgets/auto_list_view.dart';
import 'package:potatoes/common/bloc/object_cubit.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/animes/bloc/action_comment_episode_cubit.dart';
import 'package:umai/animes/bloc/episode_cubit.dart';
import 'package:umai/animes/bloc/load_comment_episode_cubit.dart';
import 'package:umai/animes/services/episode_cubit_manager.dart';
import 'package:umai/common/bloc/common_cubit.dart';
import 'package:umai/common/models/user.dart';
import 'package:umai/common/widgets/button_common.dart';
import 'package:umai/social/bloc/comment_cubit.dart';
import 'package:umai/social/bloc/load_comment_cubit.dart';
import 'package:umai/social/bloc/post_cubit.dart'; // Removed incorrect import
import 'package:umai/social/bloc/action_comment_cubit.dart';
import 'package:umai/social/model/comment.dart';
import 'package:umai/social/model/post.dart';
import 'package:umai/social/services/post_cubit_manager.dart';
import 'package:umai/social/widget/action_post.dart';
import 'package:umai/social/widget/button_post.dart';
import 'package:umai/social/widget/comment_input.dart';
import 'package:umai/social/widget/item_comment.dart';
import 'package:readmore/readmore.dart';
import 'package:umai/social/widget/post_image.dart';
import 'package:flutter/material.dart';
import 'package:umai/animes/bloc/load_episode_anime_cubit.dart';
import 'package:umai/animes/models/episode.dart';
import 'package:umai/animes/screens/episode_details.dart';
import 'package:umai/animes/widgets/episode_head.dart';
import 'package:umai/common/screens/common_details.dart';
import 'package:umai/utils/themes.dart';
import 'package:umai/utils/time_elapsed.dart';

mixin XItem {
  String get itemId;
  bool get itemHasLiked;

  String get itemContent;
  String? get itemImage;
  int get itemCommentsCount;
  User? get itemUser;
  bool? get itemReported;

  DateTime get itemCreatedAt;
  copyWithLike({bool? hasLiked});
}

class CommonDetailsScreen<
    T extends XItem,
    C extends XCommonCubit<T>,
    L extends BaseLoadCommentCubit<T>,
    A extends ActionCommentBaseCubit<C>> extends StatefulWidget {
  final WidgetBuilder head;

  CommonDetailsScreen({
    required this.head,
  });

  static Widget fromPost({
    required BuildContext context,
    required Post post,
    required WidgetBuilder head,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: context.read<PostCubitManager>().get(post)),
        BlocProvider(
            create: (context) => ActionCommentCubit(context.read<PostCubit>())),
        BlocProvider(
            create: (context) => LoadCommentCubit(
                context.read(), post.itemId, '', context.read())),
      ],
      child: CommonDetailsScreen<Post, PostCubit, LoadCommentCubit,
          ActionCommentCubit>(head: head),
    );
  }

  static Widget fromEpisode({
    required LoadEpisodeAnimeCubit loadEpisodeAnimeCubit,
    required BuildContext context,
    required Episode episode,
    required WidgetBuilder head,
  }) {
    return MultiBlocProvider(
        providers: [
          BlocProvider.value(
              value: context.read<EpisodeCubitManager>().get(episode)),
          BlocProvider(
              create: (context) => ActionCommentEpisodeCubit(
                  context.read<EpisodeCubit>(), loadEpisodeAnimeCubit)),
          BlocProvider(
              create: (context) => LoadCommentEpisodeCubit(
                    context.read(),
                    episode.id,
                    '',
                    loadEpisodeAnimeCubit,
                    context.read(),
                  )),
        ],
        child: CommonDetailsScreen<Episode, EpisodeCubit,
            LoadCommentEpisodeCubit, ActionCommentEpisodeCubit>(head: head));
  }

  @override
  State<CommonDetailsScreen<T, C, L, A>> createState() =>
      _CommonDetailsScreenState<T, C, L, A>();
}

class _CommonDetailsScreenState<T extends XItem, C extends XCommonCubit<T>,
        L extends BaseLoadCommentCubit<T>, A extends ActionCommentBaseCubit<C>>
    extends State<CommonDetailsScreen<T, C, L, A>> {
  late final L loadCommentCubit = context.read<L>();
  final ValueNotifier<bool> isCollapsed = ValueNotifier<bool>(true);
  late final C itemCubit = context.read<C>();

  @override
  void dispose() {
    loadCommentCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<C, XCommonState>(listener: (context, state) {
      if (state is CommentItemSuccesState) {
        loadCommentCubit.putFirst(state.comment);
      }
    }, builder: (context, state) {
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
                      // if (T is Post)
                      SizedBox(
                          height: kToolbarHeight +
                              MediaQuery.of(context).viewPadding.top),
                      widget.head(context),
                      ButtonPost<T, C, A>(),
                      const Divider(),
                      AutoListView.get<Comment>(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          autoManage: false,
                          physics: const NeverScrollableScrollPhysics(),
                          cubit: loadCommentCubit,
                          itemBuilder: (context, comment) =>
                              ItemComment.get<T, C, A, L>(
                                context: context,
                                comment: comment,
                                idItem: itemCubit.x.itemId,
                              ),
                          emptyBuilder: (context) => const Center(
                                child: Text("Aucun commentaire"),
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
                                borderRadius: BorderRadius.circular(30),
                              )),
                          loadingMoreBuilder: (context) => Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(16),
                              child: LinearProgressIndicator(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onTertiaryContainer,
                                backgroundColor: Theme.of(context)
                                    .colorScheme
                                    .tertiaryContainer,
                                borderRadius: BorderRadius.circular(30),
                              )),
                          errorBuilder: (context, retry) => Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text("Une erreur est survenue"),
                                  TextButton(
                                    onPressed: retry,
                                    child: const Text("Réessayer"),
                                  )
                                ],
                              ))
                    ],
                  ),
                ),
              ),
              CommentInput<C, A>()
            ],
          ));
    });
  }
}
