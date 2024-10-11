import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:potatoes/auto_list/widgets/auto_list_view.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/common/bloc/user_cubit.dart';
import 'package:umai/common/widgets/profile_picture.dart';
import 'package:umai/social/cubit/load_comment_cubit.dart';
import 'package:umai/social/cubit/post_cubit.dart';
import 'package:umai/social/cubit/y_comment_cubit.dart';
import 'package:umai/social/model/comment.dart';
import 'package:umai/social/model/post.dart';
import 'package:umai/social/widget/button_post.dart';
import 'package:umai/social/widget/comment_input.dart';
import 'package:umai/social/widget/item_comment.dart';
import 'package:umai/utils/themes.dart';
import 'package:readmore/readmore.dart';
import 'package:umai/utils/time_elapsed.dart';

class PostDetailsScreen extends StatefulWidget {
  static Widget from({required PostCubit cubit}) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: cubit),
        BlocProvider(create: (context) => YCommentCubit()),
        BlocProvider(
            create: (context) =>
                LoadCommentCubit(context.read(), cubit.post.id, '')),
      ],
      child: const PostDetailsScreen._(),
    );
  }

  static Widget fromNew({required BuildContext context, required Post post}) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => YCommentCubit()),
        BlocProvider(create: (context) => PostCubit(context.read(), post)),
        BlocProvider(
            create: (context) => LoadCommentCubit(context.read(), post.id, '')),
      ],
      child: const PostDetailsScreen._(),
    );
  }

  static Widget get({required BuildContext context, required Post post}) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PostCubit(context.read(), post)),
        BlocProvider(
            create: (context) => LoadCommentCubit(context.read(), post.id, '')),
      ],
      child: const PostDetailsScreen._(),
    );
  }

  const PostDetailsScreen._();

  @override
  State<PostDetailsScreen> createState() => _PostDetailsScreenState();
}

class _PostDetailsScreenState extends State<PostDetailsScreen> {
  late final post = context.read<PostCubit>().post!;

  late final loadCommentCubit = context.read<LoadCommentCubit>();
  final _trimMode = TrimMode.Line;
  final isCollapsed = ValueNotifier<bool>(true);
  late final postCubit = context.read<PostCubit>();

  @override
  void dispose() {
    loadCommentCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostCubit, PostState>(listener: (context, state) {
      if (state is CommentPostSuccesState) {
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
                      SizedBox(
                          height: kToolbarHeight +
                              MediaQuery.of(context).viewPadding.top),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 0.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: ProfilePicture(
                                image: post.user.image,
                                height: 48.0,
                                width: 48.0,
                              ),
                              title: Text(
                                post.user.username,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              subtitle: Text(
                                post.createdAt.elapsed(),
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(color: AppTheme.grey),
                              ),
                              trailing: PopupMenuButton<String>(
                                onSelected: (value) {
                                  if (value == 'Signaler') {
                                    postCubit.report();
                                  } else if (value == 'Supprimer') {
                                    postCubit.delete();
                                  }
                                },
                                padding: EdgeInsets.zero,
                                itemBuilder: (BuildContext context) {
                                  List<String> options = ['Signaler'];
                                  if (post.user.id ==
                                      context.read<UserCubit>().user.id) {
                                    options.add('Supprimer');
                                  }
                                  return options.map((String choice) {
                                    return PopupMenuItem<String>(
                                      padding: const EdgeInsets.only(
                                          right: 48.0, left: 16.0),
                                      value: choice,
                                      child: Text(choice),
                                    );
                                  }).toList();
                                },
                              ),
                            ),
                            const SizedBox(height: 8),
                            Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: AnimatedSize(
                                duration: const Duration(milliseconds: 300),
                                alignment: Alignment.topCenter,
                                curve: Curves.easeInOut,
                                child: ReadMoreText(
                                  post.content,
                                  trimMode: _trimMode,
                                  trimLines: 3,
                                  trimLength: 240,
                                  isCollapsed: isCollapsed,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                  colorClickableText:
                                      Theme.of(context).primaryColor,
                                  trimCollapsedText: 'Lire plus',
                                  trimExpandedText: ' moins',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      post.image == null ||
                              post.image == '' ||
                              post.image!.isEmpty
                          ? const SizedBox()
                          : Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Image.network(
                                post.image ?? '',
                                height: 368,
                                width: double.infinity,
                                fit: BoxFit.cover,
                                frameBuilder: (BuildContext context,
                                    Widget child,
                                    int? frame,
                                    bool wasSynchronouslyLoaded) {
                                  if (wasSynchronouslyLoaded) {
                                    return child;
                                  }
                                  return AnimatedOpacity(
                                    opacity: frame == null ? 0 : 1,
                                    duration: const Duration(seconds: 1),
                                    curve: Curves.easeOut,
                                    child: child,
                                  );
                                },
                                loadingBuilder: (BuildContext context,
                                    Widget child,
                                    ImageChunkEvent? loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child;
                                  }
                                  return Container(
                                    height: 368,
                                    width: double.infinity,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .tertiaryContainer,
                                    child: Center(
                                      child: CircularProgressIndicator(
                                        value: loadingProgress
                                                    .expectedTotalBytes !=
                                                null
                                            ? loadingProgress
                                                    .cumulativeBytesLoaded /
                                                (loadingProgress
                                                        .expectedTotalBytes ??
                                                    1)
                                            : null,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .tertiary,
                                      ),
                                    ),
                                  );
                                },
                                errorBuilder: (BuildContext context,
                                    Object error, StackTrace? stackTrace) {
                                  return Container(
                                    height: 368,
                                    width: double.infinity,
                                    color: Colors.grey[300],
                                    child: const Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.error,
                                              color: Colors.red, size: 48),
                                          SizedBox(height: 16),
                                          Text(
                                            "Erreur de chargement de l'image",
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                      ButtonPost(
                          postCubit: context.read<PostCubit>(),
                          actionFocus: () {
                            context.read<YCommentCubit>().unselectComment();
                          }),
                      BlocBuilder<LoadCommentCubit, LoadCommentState>(
                          builder: (ctx, state) => AutoListView.get<Comment>(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              autoManage: false,
                              physics: const NeverScrollableScrollPhysics(),
                              cubit: loadCommentCubit,
                              itemBuilder: (context, comment) =>
                                  ItemComment.get(
                                    idPost: postCubit.post.id,
                                    context: context,
                                    comment: comment,
                                  ),
                              emptyBuilder: (context) => const Center(
                                    child: Text("Aucun commentaire"),
                                  ),
                              errorBuilder: (context, retry) => Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Text("Une erreur est survenue"),
                                      TextButton(
                                        onPressed: retry,
                                        child: const Text("Réessayer"),
                                      )
                                    ],
                                  )))
                    ],
                  ),
                ),
              ),
              CommentInput.from(
                cubit: postCubit,
              )
            ],
          ));
    });
  }
}

 
 