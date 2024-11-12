import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/common/bloc/common_cubit.dart';
import 'package:umai/common/screens/common_details.dart';
import 'package:umai/common/services/person_cubit_manager.dart';
import 'package:umai/common/bloc/action_comment_cubit.dart';
import 'package:umai/social/bloc/post_cubit.dart';
import 'package:umai/social/models/post.dart';
import 'package:umai/social/services/post_cubit_manager.dart';
import 'package:umai/common/widgets/action_post.dart';
import 'package:umai/common/widgets/button_post.dart';
import 'package:readmore/readmore.dart';
import 'package:umai/social/widgets/head_post.dart';
import 'package:umai/social/widgets/post_image.dart';

class PostItem extends StatefulWidget {
  static Widget get({required BuildContext context, required Post post}) {
    return BlocProvider.value(
      value: context.read<PostCubitManager>().get(post),
      child: PostItem(),
    );
  }

  @override
  State<PostItem> createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  late final postCubit = context.read<PostCubit>();
  final isCollapsed = ValueNotifier<bool>(true);
  final _trimMode = TrimMode.Line;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostCubit, XCommonState>(builder: (context, state) {
      final post = postCubit.x as Post;
      return GestureDetector(
        onTap: () {
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
            MultiBlocProvider(providers: [
              BlocProvider.value(
                  value: context.read<PostCubitManager>().get(post)),
              BlocProvider.value(
                  value: context.read<PersonCubitManager>().get(post.user)),
            ], child: const PostAction()),
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
            BlocProvider.value(
              value: context.read<PostCubitManager>().get(post)
                  as XCommonCubit<Post>,
              child: ButtonPost<Post>(),
            ),
          ],
        ),
      );
    });
  }
}
