import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/common/bloc/common_cubit.dart';
import 'package:umai/common/bloc/report_cubit.dart';
import 'package:umai/common/services/person_cubit_manager.dart';
import 'package:umai/social/bloc/post_feed_cubit.dart';
import 'package:umai/social/models/post.dart';
import 'package:umai/social/services/post_cubit_manager.dart';
import 'package:umai/common/widgets/action_post.dart';
import 'package:readmore/readmore.dart';
import 'package:umai/social/widgets/post_image.dart';

class HeadPost extends StatefulWidget {
  const HeadPost({super.key});

  @override
  State<HeadPost> createState() => _HeadPostState();
}

class _HeadPostState extends State<HeadPost> {
  late final postCubit = context.read<XCommonCubit<Post>>();
  final isCollapsed = ValueNotifier<bool>(true);
  final _trimMode = TrimMode.Line;

  void onReportEventReceived(BuildContext context, XReportState state) async {
    if (state is SuccessReportItemState) {
      if (state.item is Post) {
        print('delete post');
        context.read<PostFeedCubit>().deletePost(state.item as Post);

        Navigator.of(context).popUntil((route) => route.isFirst);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<XCommonCubit<Post>, XCommonState>(
        builder: (context, state) {
      final post = postCubit.x as Post;
      return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MultiBlocProvider(
              providers: [
                BlocProvider.value(
                    value: context.read<PostCubitManager>().get(post)),
                BlocProvider.value(
                    value: context.read<PersonCubitManager>().get(post.user)),
              ],
              child: PostAction(onReportEventReceived: onReportEventReceived),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: AnimatedSize(
                duration: const Duration(milliseconds: 300),
                alignment: Alignment.topCenter,
                curve: Curves.easeInOut,
                child: ReadMoreText(
                  post.itemContent,
                  trimMode: _trimMode,
                  trimLines: 3,
                  trimLength: 240,
                  isCollapsed: isCollapsed,
                  style: Theme.of(context).textTheme.bodyMedium,
                  colorClickableText: Theme.of(context).primaryColor,
                  trimCollapsedText: 'Lire plus',
                  trimExpandedText: ' moins',
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            if (post.itemImage?.isNotEmpty ?? false)
              PostImage(url: post.itemImage!),
          ]);
    });
  }
}
