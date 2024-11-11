import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/common/bloc/common_cubit.dart';
import 'package:umai/common/screens/common_details.dart';
import 'package:umai/social/bloc/action_comment_cubit.dart';
import 'package:umai/social/bloc/load_comment_cubit.dart';
import 'package:umai/social/bloc/post_cubit%20copy.dart';
import 'package:umai/social/bloc/post_cubit.dart';
import 'package:umai/social/model/post.dart';
import 'package:umai/social/screens/post_details.dart';
import 'package:umai/social/services/post_cubit_manager.dart';
import 'package:umai/social/widget/action_post.dart';
import 'package:umai/social/widget/button_post.dart';
import 'package:readmore/readmore.dart';
import 'package:umai/social/widget/head_post.dart';
import 'package:umai/social/widget/post_image.dart';

class PostItem<T extends XItem, C extends XCommonCubit<T>,
    A extends ActionCommentBaseCubit<C>> extends StatefulWidget {
  static Widget get<T extends XItem, C extends XCommonCubit<T>,
          A extends ActionCommentBaseCubit<C>>(
      {required BuildContext context, required Post post}) {
    return BlocProvider.value(
      value: context.read<PostCubitManager>().get(post),
      child: PostItem<T, C, A>(),
    );
  }

  @override
  State<PostItem<T, C, A>> createState() => _PostItemState<T, C, A>();
}

class _PostItemState<T extends XItem, C extends XCommonCubit<T>,
    A extends ActionCommentBaseCubit<C>> extends State<PostItem<T, C, A>> {
  late final postCubit = context.read<PostCubit>();
  final isCollapsed = ValueNotifier<bool>(true);
  final _trimMode = TrimMode.Line;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostCubit, XCommonState>(builder: (context, state) {
      final post = postCubit.x as Post;
      return GestureDetector(
        onTap: () {
          print([T, C, A]);
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) => CommonDetailsScreen.fromPost(
                    context: context,
                    post: post,
                    head: (context) => HeadPost())),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PostAction(),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: AnimatedSize(
                  duration: const Duration(milliseconds: 300),
                  alignment: Alignment.topCenter,
                  curve: Curves.easeInOut,
                  child: ReadMoreText(
                    post.content,
                    trimMode: _trimMode,
                    trimLines: 3,
                    isCollapsed: isCollapsed,
                    style: Theme.of(context).textTheme.bodyMedium,
                    colorClickableText: Theme.of(context).primaryColor,
                    trimCollapsedText: 'Lire plus',
                    trimExpandedText: ' moins',
                  ),
                )),
            const SizedBox(height: 8),
            if (post.image?.isNotEmpty ?? false) PostImage(url: post.image!),
            ButtonPost<T, C, A>()
          ],
        ),
      );
    });
  }
}
