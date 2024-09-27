import 'package:flutter/material.dart';
import 'package:potatoes/auto_list/bloc/auto_list_cubit.dart';
import 'package:potatoes/auto_list/widgets/auto_list_view.dart';
import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';
import 'package:umai/common/services/user_service.dart';
import 'package:umai/social/model/post.dart';

class PostTab extends StatefulWidget {
  const PostTab({super.key});

  @override
  State<PostTab> createState() => _PostTabState();
}

class _PostTabState extends State<PostTab> with CompletableMixin {
  @override
  Widget build(BuildContext context) {
    return AutoListView.get<Post>(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        cubit: AutoListCubit(provider: context.read<UserService>().getPosts),
        itemBuilder: (context, post) => const SizedBox(),
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
