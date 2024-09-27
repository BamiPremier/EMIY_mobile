import 'package:potatoes/auto_list/widgets/auto_list_view.dart';
import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';
import 'package:umai/account/cubit/user_post_cubit.dart';
import 'package:umai/account/widgets/post_widget.dart';
import 'package:flutter/material.dart';
import 'package:umai/social/model/post_response.dart';

class Sociale extends StatefulWidget {
  const Sociale({super.key});

  @override
  State<Sociale> createState() => _SocialeState();
}

class _SocialeState extends State<Sociale> with CompletableMixin {
  late final userPostCubit = context.read<UserPostCubit>();

  @override
  Widget build(BuildContext context) {
    return AutoListView.get<Post>(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        cubit: userPostCubit,
        itemBuilder: (context, post) => PostUserWidget(
              post: post,
            ),
        emptyBuilder: (context) => const Center(
              child: Text("Empty list"),
            ),
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
