// Start of Selection
import 'package:flutter/material.dart';
import 'package:potatoes/auto_list/widgets/auto_list_view.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/animes/bloc/episode_cubit.dart';
import 'package:umai/animes/services/episode_cubit_manager.dart';
import 'package:umai/common/bloc/common_cubit.dart';
import 'package:umai/common/models/user.dart';
import 'package:umai/common/bloc/comment_cubit.dart';
import 'package:umai/common/bloc/load_comment_cubit.dart';
import 'package:umai/social/bloc/post_cubit.dart'; // Removed incorrect import
import 'package:umai/common/bloc/action_comment_cubit.dart';
import 'package:umai/common/models/comment.dart';
import 'package:umai/social/models/post.dart';
import 'package:umai/social/services/post_cubit_manager.dart';
import 'package:umai/common/widgets/button_post.dart';
import 'package:umai/common/widgets/comment_input.dart';
import 'package:umai/common/widgets/item_comment.dart';
import 'package:umai/animes/bloc/load_episode_anime_cubit.dart';
import 'package:umai/animes/models/episode.dart';

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

class CommonDetailsScreen<T extends XItem> extends StatefulWidget {
  final WidgetBuilder head;

  const CommonDetailsScreen({
    super.key,
    required this.head,
  });

  static Widget fromPost({
    required BuildContext context,
    required Post post,
    required WidgetBuilder head,
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
      child: CommonDetailsScreen<Post>(head: head),
    );
  }

  static Widget fromEpisode({
    required LoadEpisodeAnimeCubit loadEpisodeAnimeCubit,
    required BuildContext context,
    required Episode episode,
    required WidgetBuilder head,
  }) {
    return MultiBlocProvider(providers: [
      BlocProvider.value(
          value: context.read<EpisodeCubitManager>().get(episode)
              as XCommonCubit<Episode>),
      BlocProvider(
          create: (context) => ActionCommentEpisodeCubit(
                  context.read<XCommonCubit<Episode>>() as EpisodeCubit,
                  loadEpisodeAnimeCubit)
              as ActionCommentBaseCubit<XCommonCubit<Episode>>),
      BlocProvider(
          create: (context) => LoadCommentEpisodeCubit(
                context.read(),
                episode.id,
                '',
                loadEpisodeAnimeCubit,
                context.read(),
              ) as BaseLoadCommentCubit<Episode>),
    ], child: CommonDetailsScreen<Episode>(head: head));
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
                        // if (T is Post)
                        SizedBox(
                            height: kToolbarHeight +
                                MediaQuery.of(context).viewPadding.top),
                        widget.head(context),
                        ButtonPost<T>(),

                        const Divider(),
                        AutoListView.get<Comment>(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            autoManage: false,
                            physics: const NeverScrollableScrollPhysics(),
                            cubit: loadCommentCubit,
                            itemBuilder: (context, comment) =>
                                MultiBlocProvider(
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
                                      value: context.read<
                                          ActionCommentBaseCubit<
                                              XCommonCubit<T>>>(),
                                    ),
                                  ],
                                  child: ItemComment<T>(
                                    comment: comment,
                                    idItem: itemCubit.x.itemId,
                                    actionCommentBaseCubit: actionCommentCubit,
                                  ),
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
                CommentInput<XCommonCubit<T>,
                    ActionCommentBaseCubit<XCommonCubit<T>>>()
              ],
            ));
      },
    );
  }
}
