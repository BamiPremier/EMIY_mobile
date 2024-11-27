import 'package:potatoes/auto_list/widgets/auto_list_view.dart';
import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';
import 'package:flutter/material.dart';
import 'package:umai/account/bloc/activitie_user_cubit.dart';
import 'package:umai/activitie/models/activitie.dart';
import 'package:umai/activitie/widgets/activitie_widget.dart';
import 'package:umai/common/bloc/person_cubit.dart';
import 'package:umai/common/widgets/empty_builder.dart';
import 'package:umai/common/widgets/error_builder.dart';

class ActivityTab extends StatefulWidget {
  final bool currentUser;

  const ActivityTab({super.key, this.currentUser = true});

  @override
  State<ActivityTab> createState() => _ActivityTabState();
}

class _ActivityTabState extends State<ActivityTab> with CompletableMixin {
  late final activitieUserCubit;
  @override
  void initState() {
    super.initState();

    if (widget.currentUser) {
      activitieUserCubit = ActivitieUserCubit(context.read(), context.read(),
          context.read(), context.read(), context.read(), context.read(), null);
    } else {
      late final personCubit = context.read<PersonCubit>();
      activitieUserCubit = ActivitieUserCubit(
        context.read(),
        context.read(),
        context.read(),
        context.read(),
        context.read(),
        context.read(),
        personCubit.user.id,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AutoListView.get<Activitie>(
      autoManage: false,
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      cubit: activitieUserCubit,
      itemBuilder: (context, activitie) =>
          ActivitieWidget(activitie: activitie),
      separatorBuilder: (_, __) => const Divider(height: 8),
      emptyBuilder: (ctx) => const EmptyBuilder(),
      errorBuilder: (context, retry) => ErrorBuilder(retry: retry),
    );
  }
}
