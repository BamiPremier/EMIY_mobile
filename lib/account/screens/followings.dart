import 'package:flutter/material.dart';
import 'package:potatoes/auto_list/bloc/auto_list_cubit.dart';
import 'package:potatoes/auto_list/widgets/auto_list_view.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/auth/services/auth_service.dart';
import 'package:umai/common/bloc/user_cubit.dart';
import 'package:umai/common/models/user.dart';
import 'package:umai/common/services/user_service.dart';
import 'package:umai/common/widgets/buttons.dart';
import 'package:umai/common/widgets/item_user.dart';
import 'package:umai/common/screens/home.dart';

class FollowingsScreen extends StatefulWidget {
  const FollowingsScreen({super.key});

  @override
  State<FollowingsScreen> createState() => _FollowingsScreenState();
}

class _FollowingsScreenState extends State<FollowingsScreen> {
  late final userCubit = context.read<UserCubit>();
  late final followingCount = userCubit.user.followingCount;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text("Ajoutés ($followingCount)"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: AutoListView.get<User>(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          cubit: AutoListCubit(
              provider: context.read<UserService>().getUserFollowing),
          itemBuilder: (context, user) =>
              UserItem.get(context: context, user: user),
          errorBuilder: (context, retry) => Column(
            mainAxisSize: MainAxisSize.min,
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
    );
  }
}
