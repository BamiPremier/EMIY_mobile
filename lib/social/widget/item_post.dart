import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/social/bloc/post_cubit.dart';
import 'package:umai/social/model/post.dart';
import 'package:umai/social/screens/post_details.dart';
import 'package:umai/social/widget/action_post.dart';
import 'package:umai/social/widget/button_post.dart';
import 'package:readmore/readmore.dart';
import 'package:umai/social/widget/post_image.dart';

class PostItem extends StatefulWidget {
  static Widget get({required BuildContext context, required Post post}) {
    return BlocProvider(
      create: (context) => PostCubit(context.read(), post),
      child: const PostItem._(),
    );
  }

  const PostItem._();

  @override
  State<PostItem> createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  final isCollapsed = ValueNotifier<bool>(true);
  final _trimMode = TrimMode.Line;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostCubit, PostState>(builder: (context, state) {
      final postCubit = context.read<PostCubit>();
      final post = postCubit.post;

      return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PostDetailsScreen.from(cubit: postCubit)),
          );
        },
        child: ColoredBox(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PostAction.get(context: context),
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
                            isCollapsed: isCollapsed,
                            style: Theme.of(context).textTheme.bodyMedium,
                            colorClickableText: Theme.of(context).primaryColor,
                            trimCollapsedText: 'Lire plus',
                            trimExpandedText: ' moins',
                          ),
                        )),
                  ],
                ),
              ),
              if (post.image?.isNotEmpty ?? false)
                PostImage(url: post.image!),
              const ButtonPost()
            ],
          ),
        ),
      );
    });
  }
}
