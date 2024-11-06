import 'package:flutter/material.dart'; 
import 'package:potatoes/auto_list/widgets/auto_list_view.dart';
import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';
import 'package:umai/account/bloc/post_user_cubit.dart';
import 'package:umai/common/bloc/person_cubit.dart'; 
import 'package:umai/social/model/post.dart';
import 'package:umai/social/widget/item_post.dart';

class EPostTab extends StatefulWidget {
  const EPostTab({super.key});

  @override
  State<EPostTab> createState() => _EPostTabState();
}

class _EPostTabState extends State<EPostTab> with CompletableMixin {
  late final personCubit = context.read<PersonCubit>();
  late final postUserCubit = PostUserCubit(
    cubitManager: context.read(),
    userService: context.read(),
    userId: personCubit.user.id,
  );

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
