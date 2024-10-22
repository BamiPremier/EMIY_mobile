import 'package:flutter/material.dart';
import 'package:potatoes/auto_list/widgets/auto_list_view.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/social/bloc/post_feed_cubit.dart';
import 'package:umai/social/model/post.dart';
import 'package:umai/social/screens/new_post_screen.dart';
import 'package:umai/social/widget/item_post.dart';
import 'package:umai/social/widget/new_post_banner.dart';

class SocialHomeScreen extends StatefulWidget {
  const SocialHomeScreen({super.key});

  @override
  State<SocialHomeScreen> createState() => _SocialHomeScreenState();
}

class _SocialHomeScreenState extends State<SocialHomeScreen> {
  late final postFeedCubit = PostFeedCubit(context.read(), context.read());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: false,
      body: Column(
        children: [
          const NewPostBanner(),
          Expanded(
              child: AutoListView.get<Post>(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  cubit: postFeedCubit,
                  itemBuilder: (context, post) =>
                      PostItem.get(context: context, post: post),
                  errorBuilder: (context, retry) => Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text("An error occured"),
                          TextButton(
                            onPressed: retry,
                            child: const Text("Retry"),
                          )
                        ],
                      ))),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => NewPostScreen.show(context: context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
