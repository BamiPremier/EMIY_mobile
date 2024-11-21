import 'package:flutter/material.dart';

import 'package:potatoes/auto_list/widgets/auto_list_view.dart';
import 'package:umai/common/widgets/empty_builder.dart';
import 'package:umai/common/widgets/error_builder.dart'; 
import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';
import 'package:umai/account/bloc/post_user_cubit.dart';
import 'package:umai/common/bloc/person_cubit.dart';
import 'package:umai/social/models/post.dart';
import 'package:umai/social/widgets/item_post.dart';

class PostTab extends StatefulWidget {
  final bool currentUser;
  const PostTab({super.key, this.currentUser = true});

  @override
  State<PostTab> createState() => _PostTabState();
}

class _PostTabState extends State<PostTab> with CompletableMixin {
  late final postUserCubit;
  @override
  void initState() {
    super.initState();

    if (widget.currentUser) {
      postUserCubit = PostUserCubit(
        cubitManager: context.read(),
        userService: context.read(),
      );
    } else {
      late final personCubit = context.read<PersonCubit>();
      postUserCubit = PostUserCubit(
        cubitManager: context.read(),
        userService: context.read(),
        userId: personCubit.user.id,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AutoListView.get<Post>(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        cubit: postUserCubit,
        itemBuilder: (context, post) =>
            PostItem.get(context: context, post: post),
        emptyBuilder: (ctx) => const EmptyBuilder(),
        errorBuilder: (context, retry) => ErrorBuilder(retry: retry));
  }
}
