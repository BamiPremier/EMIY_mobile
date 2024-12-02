import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:readmore/readmore.dart';
import 'package:umai/common/bloc/common_cubit.dart';
import 'package:umai/common/bloc/report_cubit.dart';
import 'package:umai/common/screens/common_details.dart';
import 'package:umai/common/services/person_cubit_manager.dart';
import 'package:umai/common/widgets/action_post.dart';
import 'package:umai/common/widgets/button_common.dart';
import 'package:umai/social/bloc/post_cubit.dart';
import 'package:umai/social/bloc/post_feed_cubit.dart';
import 'package:umai/social/models/post.dart';
import 'package:umai/social/services/post_cubit_manager.dart';
import 'package:umai/social/widgets/post_image.dart';

class PostItem extends StatefulWidget {
  const PostItem({super.key});

  static Widget get({required BuildContext context, required Post post}) {
    final postCubit = context.read<PostCubitManager>().get(post);
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: postCubit),
        BlocProvider<XCommonCubit<Post>>.value(value: postCubit),
        BlocProvider.value(
            value: context.read<PersonCubitManager>().get(post.user)),
      ],
      child: const PostItem(),
    );
  }

  @override
  State<PostItem> createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  late final postCubit = context.read<PostCubit>();
  final isCollapsed = ValueNotifier<bool>(true);
  final _trimMode = TrimMode.Line;
  void onReportEventReceived(BuildContext context, XReportState state) async {
    if (state is SuccessReportItemState) {
      if (state.item is Post) {
        context.read<PostCubitManager>().deletePostCubit(state.item as Post);
        context.read<PostFeedCubit>().deletePost(state.item as Post);
        postCubit.close();
        Navigator.of(context).popUntil((route) => route.isFirst);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostCubit, XCommonState>(builder: (context, state) {
      late final postCubit = context.read<PostCubit>();
      final post = postCubit.x as Post;
      return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => CommonDetailsScreen.fromPost(
                        context: context,
                        post: post,
                      )),
            );
          },
          behavior: HitTestBehavior.translucent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PostAction(onReportEventReceived: onReportEventReceived),
              const SizedBox(height: 8.0),
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
              const ButtonCommon<Post>(canComment: false),
            ],
          ));
    });
  }
}
