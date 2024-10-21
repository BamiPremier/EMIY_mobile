import 'package:flutter/material.dart';
import 'package:potatoes/auto_list/bloc/auto_list_cubit.dart';
import 'package:potatoes/auto_list/widgets/auto_list_view.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/common/bloc/blocked_user_cubit.dart';
import 'package:umai/common/bloc/user_cubit.dart';
import 'package:umai/common/models/user.dart';
import 'package:umai/common/widgets/item_user.dart';

class BlockedUserScreen extends StatefulWidget {
  final String? title;

  const BlockedUserScreen({super.key, this.title});
  @override
  State<BlockedUserScreen> createState() => _BlockedUserScreenState();
}

class _BlockedUserScreenState extends State<BlockedUserScreen> {
  late final userCubit = context.read<UserCubit>();

  late final blockedUserCubit =
      new BlockedUserCubit(context.read(), context.read());

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(builder: (context, state) {
      late final user = userCubit.user;
      return Scaffold(
        appBar: AppBar(
          title: blockedUserCubit.state is AutoListReadyState
              ? Text(
                  "Bloqués(${(blockedUserCubit.state as AutoListReadyState).items.items.length})")
              : const Text("Bloqués"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: AutoListView.get<User>(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            cubit: blockedUserCubit,
            itemBuilder: (context, user) =>
                UserItem.get(context: context, user: user),
            errorBuilder: (context, retry) => Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("An error occured"),
                  TextButton(
                    onPressed: retry,
                    child: const Text("Retry"),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
