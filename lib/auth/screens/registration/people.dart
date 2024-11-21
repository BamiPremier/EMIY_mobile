import 'package:flutter/material.dart';

import 'package:potatoes/auto_list/widgets/auto_list_view.dart';
import 'package:umai/common/widgets/empty_builder.dart';
import 'package:umai/common/widgets/error_builder.dart'; 
import 'package:potatoes/libs.dart';
import 'package:umai/auth/bloc/people_follows_cubit.dart';
import 'package:umai/common/bloc/user_cubit.dart';
import 'package:umai/common/models/user.dart';
import 'package:umai/common/widgets/buttons.dart';
import 'package:umai/common/widgets/item_user.dart';
import 'package:umai/common/screens/home.dart';

class PeopleToFollowScreen extends StatefulWidget {
  const PeopleToFollowScreen({super.key});

  @override
  State<PeopleToFollowScreen> createState() => _PeopleToFollowScreenState();
}

class _PeopleToFollowScreenState extends State<PeopleToFollowScreen> {
  late final peopleFollowsCubit =
      PeopleFollowsCubit(context.read(), context.read());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Rejoins la communauté!")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                  'Fais-toi des amis et reste informé(e) de leur activité dans l\'application',
                  style: Theme.of(context).textTheme.bodySmall)),
          Expanded(
              child: AutoListView.get<User>(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  cubit: peopleFollowsCubit,
                  itemBuilder: (context, user) => UserItem.get(
                      context: context, user: user, canNavigate: false),
                  emptyBuilder: (ctx) => const EmptyBuilder(),
                  errorBuilder: (context, retry) => ErrorBuilder(retry: retry),
          ))
        ]),
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            UmaiButton.primary(
              onPressed: () {
                context.read<UserCubit>().refreshData();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                    (route) => false);
              },
              text: "Continuer",
            ),
          ],
        ),
      ),
    );
  }
}
