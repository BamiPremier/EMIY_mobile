import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:potatoes/auto_list/bloc/auto_list_cubit.dart';
import 'package:potatoes/auto_list/widgets/auto_list_view.dart';
import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';
import 'package:umai/common/bloc/user_cubit.dart';
import 'package:umai/common/widgets/image_profil.dart';
import 'package:umai/social/cubit/comment_cubit.dart';
import 'package:umai/social/cubit/load_comment_cubit.dart';
import 'package:umai/social/cubit/post_cubit.dart';
import 'package:umai/social/model/comment.dart';
import 'package:umai/social/model/post.dart';
import 'package:umai/social/services/social_service.dart';
import 'package:umai/social/widget/button_post.dart';
import 'package:umai/social/widget/item_comment.dart';
import 'package:umai/social/widget/post_social_card_second.dart';
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/text_utils.dart';
import 'package:umai/utils/themes.dart';

class PostDetailsScreen extends StatefulWidget {
  static Widget from({required PostCubit cubit}) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: cubit),
        BlocProvider(
            create: (context) =>
                LoadCommentCubit(context.read(), cubit.post.id)),
      ],
      child: const PostDetailsScreen._(),
    );
  }

  static Widget get({required BuildContext context, required Post post}) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PostCubit(context.read(), post)),
        BlocProvider(
            create: (context) => LoadCommentCubit(context.read(), post.id)),
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
  final focusNode = FocusNode();
  final TextEditingController _commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostCubit, PostState>(listener: (context, state) {
      if (state is CommentPostSuccesState) {
        loadCommentCubit.putFirst(state.comment);
      }
    }, builder: (context, state) {
      final postCubit = context.read<PostCubit>();
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white.withOpacity(.3),
            foregroundColor: Colors.white.withOpacity(.3),
            elevation: 0,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back,
                color: AppTheme.black,
              ),
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 16.0, right: 0.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: ImageProfil(
                                image: post.user.image ?? '',
                                height: 48.0,
                                width: 48.0,
                              ),
                              title: Text(
                                TextUtils.capitalizeEachWord(
                                    post.user.username),
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              subtitle: Text(
                                'Il y a 10h',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(color: AppTheme.grey),
                              ),
                              trailing: PopupMenuButton<String>(
                                onSelected: (value) {
                                  if (value == 'Signaler') {
                                    postCubit.signalerPost();
                                  } else if (value == 'Supprimer') {
                                    postCubit.deletePost();
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
                            ),
                            const SizedBox(height: 8),
                            Container(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: Text(
                                post.content,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                          ],
                        ),
                      ),
                      post.image == null ||
                              post.image == '' ||
                              post.image!.isEmpty
                          ? SizedBox()
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
                                  return SizedBox(
                                    height: 368,
                                    width: double.infinity,
                                    child: Center(
                                      child: CircularProgressIndicator(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .tertiary,
                                        value: loadingProgress
                                                    .expectedTotalBytes !=
                                                null
                                            ? loadingProgress
                                                    .cumulativeBytesLoaded /
                                                (loadingProgress
                                                        .expectedTotalBytes ??
                                                    1)
                                            : null,
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
                            context.read<LoadCommentCubit>().unselectComment();
                            if (!focusNode.hasFocus) {
                              FocusScope.of(context).requestFocus(focusNode);
                            }
                          }),
                      BlocListener<LoadCommentCubit, LoadCommentState>(
                          listener: (context, state) {},
                          child: AutoListView.get<Comment>(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom),
                              cubit: loadCommentCubit,
                              itemBuilder: (context, comment) =>
                                  ItemComment.get(
                                      context: context,
                                      comment: comment,
                                      actionFocus: () {
                                      
                                        if (!focusNode.hasFocus) {
                                          FocusScope.of(context)
                                              .requestFocus(focusNode);
                                        }
                                      }),
                              errorBuilder: (context, retry) => Column(
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
              Container(
                // padding: EdgeInsets.only(
                //     bottom: MediaQuery.of(context).viewInsets.bottom),
                color:
                    Theme.of(context).bottomNavigationBarTheme.backgroundColor,

                child: Container(
                  margin: EdgeInsets.all(16),
                  color: Theme.of(context)
                      .bottomNavigationBarTheme
                      .backgroundColor,
                  child: Row(
                    children: [
                      BlocBuilder<LoadCommentCubit, LoadCommentState>(
                        builder: (context, state) {
                          return Expanded(
                            child: TextFormField(
                                controller: _commentController,
                                decoration: InputDecoration(
                                  hintText: (state is LoadCommentListState &&
                                          state.selectedComment != null)
                                      ? 'Réponse à ${TextUtils.capitalizeEachWord(state.selectedComment!.user.username)}'
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
                                textCapitalization:
                                    TextCapitalization.sentences,
                                focusNode: focusNode,
                                onTapOutside: (_) =>
                                    FocusScope.of(context).unfocus()),
                          );
                        },
                      ),
                      SizedBox(width: 8),
                      IconButton(
                        icon: Container(
                            height: 48,
                            width: 48,
                            decoration: BoxDecoration(
                              color: AppTheme.primaryYellow,
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(color: AppTheme.primaryYellow),
                            ),
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
                          postCubit.commentPost(
                            content: _commentController.text,
                          );
                          // Action du bouton
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ));
    });
  }
}
