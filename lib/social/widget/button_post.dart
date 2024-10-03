import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:potatoes/common/widgets/loaders.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/auth/bloc/auth_cubit.dart';
import 'package:umai/common/bloc/person_cubit.dart';
import 'package:umai/common/bloc/user_cubit.dart';
import 'package:umai/common/widgets/image_profil.dart';
import 'package:umai/social/cubit/post_cubit.dart';
import 'package:umai/social/model/post.dart';
import 'package:umai/social/screens/post_details.dart';
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/dialogs.dart';
import 'package:umai/utils/themes.dart';
import 'package:share_plus/share_plus.dart';

class ButtonPost extends StatefulWidget {
  final PostCubit postCubit;
  final VoidCallback? actionFocus;

  const ButtonPost({required this.postCubit, this.actionFocus});

  @override
  _ButtonPostState createState() => _ButtonPostState();
}

class _ButtonPostState extends State<ButtonPost> with CompletableMixin {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostCubit, PostState>(
        listener: onEventReceived,
        builder: (context, state) {
          final post = widget.postCubit.post;
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  post.hasLiked
                      ? IconButton(
                          padding: EdgeInsets.zero,
                          icon: const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            widget.postCubit.unLikePost();
                          },
                        )
                      : IconButton(
                          padding: EdgeInsets.zero,
                          icon: Icon(
                            Icons.favorite_border_outlined,
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                          onPressed: () {
                            widget.postCubit.likePost();
                          },
                        ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      Icons.chat_bubble_outline,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                    onPressed: widget.actionFocus,
                  ),
                ],
              ),
              IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(
                  Icons.share,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                onPressed: () => widget.postCubit.sharePost(),
              ),
            ],
          );
        });
  }

  bool isSharing = false;
  void onEventReceived(BuildContext context, PostState state) async {
    await waitForDialog();

    if (state is SharePostLoadingState) {
      loadingDialogCompleter = showLoadingBarrier(
        context: context,
      );
    } else if (state is SharePostSuccesState) {
      if (!isSharing) {
        isSharing = true;
        await Share.share('Suivre ce lien pour voir le post : ${state.link}');

        isSharing = false;
      }
    } else if (state is PostErrorState) {
      showErrorToast(state.error);
    }
  }
}
