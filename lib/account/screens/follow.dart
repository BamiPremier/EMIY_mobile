import 'package:flutter/material.dart';
import 'package:potatoes/auto_list/widgets/auto_list_view.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/common/bloc/follow_cubit.dart';
import 'package:umai/common/models/user.dart';
import 'package:umai/common/widgets/item_user.dart';
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/svg_utils.dart';

class FollowScreen extends StatefulWidget {
  final String? title;

  const FollowScreen({super.key, this.title});
  static Widget get({
    required BuildContext context,
    required String title,
    required FollowCubit followCubit,
  }) {
    return BlocProvider.value(
      value: followCubit,
      child: FollowScreen._(title),
    );
  }

  const FollowScreen._(this.title);
  @override
  State<FollowScreen> createState() => _FollowScreenState();
}

class _FollowScreenState extends State<FollowScreen> {
  late final followCubit = context.read<FollowCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: AutoListView.get<User>(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          cubit: followCubit,
          itemBuilder: (context, user) =>
              UserItem.get(context: context, user: user),
          emptyBuilder: (ctx) => Center(
            child: toSvgIcon(
              icon: Assets.iconsEmpty,
              size: 56,
            ),
          ),
         
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
  }
}
