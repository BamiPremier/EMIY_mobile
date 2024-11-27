import 'package:flutter/material.dart';
import 'package:potatoes/auto_list/widgets/auto_list_view.dart';
import 'package:umai/activity/bloc/activity_feed_cubit.dart';
import 'package:umai/activity/models/activity.dart';
import 'package:umai/activity/widgets/activity_widget.dart';
import 'package:umai/common/widgets/empty_builder.dart';
import 'package:umai/common/widgets/error_builder.dart'; 
import 'package:potatoes/libs.dart';

class ActuHomeScreen extends StatefulWidget {
  const ActuHomeScreen({super.key});

  @override
  State<ActuHomeScreen> createState() => _ActuHomeScreenState();
}

class _ActuHomeScreenState extends State<ActuHomeScreen> {
  late final activityFeedCubit = context.read<ActivityFeedCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: false,
      body: RefreshIndicator(
          onRefresh: () async {
            activityFeedCubit.reset();
          },
          child: AutoListView.get<Activity>(
              autoManage: false,
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              cubit: activityFeedCubit,
              itemBuilder: (context, activity) => activity.isPrivate == true
                  ? const SizedBox.shrink()
                  : ActivityWidget(activity: activity),
              emptyBuilder: (ctx) => const EmptyBuilder(),
              errorBuilder: (context, retry) => ErrorBuilder(retry: retry))),
    );
  }
}
