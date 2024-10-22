import 'package:flutter/material.dart'; 
import 'package:potatoes/auto_list/widgets/auto_list_view.dart';
import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';
import 'package:umai/account/bloc/post_user_cubit.dart'; 
import 'package:umai/social/model/post.dart';
import 'package:umai/social/widget/item_post.dart';

class PostTab extends StatefulWidget {
  const PostTab({super.key});

  @override
  State<PostTab> createState() => _PostTabState();
}

class _PostTabState extends State<PostTab> with CompletableMixin {
  late final postUserCubit = PostUserCubit(context.read(), context.read());

  @override
  Widget build(BuildContext context) {
    return AutoListView.get<Post>(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        cubit: postUserCubit,
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
            ));
  }
}
