import 'package:flutter/material.dart';
import 'package:potatoes/auto_list/widgets/auto_list_view.dart';
import 'package:umai/activitie/bloc/activitie_feed_cubit.dart';
import 'package:umai/activitie/models/activitie.dart';
import 'package:umai/activitie/widgets/activitie_widget.dart';
import 'package:umai/common/widgets/empty_builder.dart';
import 'package:umai/common/widgets/error_builder.dart';
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/svg_utils.dart';
import 'package:potatoes/libs.dart';

class ActuHomeScreen extends StatefulWidget {
  const ActuHomeScreen({super.key});

  @override
  State<ActuHomeScreen> createState() => _ActuHomeScreenState();
}

class _ActuHomeScreenState extends State<ActuHomeScreen> {
  late final activitieFeedCubit = context.read<ActivitieFeedCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: false,
      body: RefreshIndicator(
          onRefresh: () async {
            activitieFeedCubit.reset();
          },
          child: AutoListView.get<Activitie>(
              autoManage: false,
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              cubit: activitieFeedCubit,
              itemBuilder: (context, activitie) => activitie.isPrivate == true
                  ? const SizedBox.shrink()
                  : ActivitieWidget(activitie: activitie),
              separatorBuilder: (_, __) => const Divider(height: 8),
              emptyBuilder: (ctx) => const EmptyBuilder(),
              errorBuilder: (context, retry) => ErrorBuilder(retry: retry))),
    );
  }
}
