import 'package:flutter/material.dart';
import 'package:potatoes/auto_list/bloc/auto_list_cubit.dart';
import 'package:potatoes/auto_list/widgets/auto_list_view.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/common/widgets/empty_builder.dart';
import 'package:umai/common/widgets/error_builder.dart';
import 'package:umai/social/bloc/post_feed_cubit.dart';
import 'package:umai/social/models/post.dart';
import 'package:umai/social/screens/new_post_screen.dart';
import 'package:umai/social/widgets/item_post.dart';
import 'package:umai/social/widgets/new_post_banner.dart';
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/svg_utils.dart';

class SocialHomeScreen extends StatefulWidget {
  const SocialHomeScreen({super.key});

  @override
  State<SocialHomeScreen> createState() => _SocialHomeScreenState();
}

class _SocialHomeScreenState extends State<SocialHomeScreen> {
  late final postFeedCubit = context.read<PostFeedCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        primary: false,
        body: RefreshIndicator(
          onRefresh: () async {
            postFeedCubit.reset();
          },
          child: Column(
            children: [
              const NewPostBanner(),
              Expanded(
                  child: BlocBuilder<PostFeedCubit, AutoListState<Post>>(
                      buildWhen: (previous, current) =>
                          current is AutoListReadyState<Post>,
                      builder: (context, state) => AutoListView.get<Post>(
                          autoManage: false,
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          cubit: postFeedCubit,
                          itemBuilder: (context, post) =>
                              PostItem.get(context: context, post: post),
                          separatorBuilder: (_, __) => const Divider(height: 8),
                          emptyBuilder: (ctx) => const EmptyBuilder(),
                          errorBuilder: (context, retry) =>
                              ErrorBuilder(retry: retry)))),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () => NewPostScreen.show(context: context),
            child: toSvgIcon(
              icon: Assets.iconsMore,
            )));
  }
}
