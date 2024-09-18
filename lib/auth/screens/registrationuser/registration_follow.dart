import 'package:potatoes/auto_list/bloc/auto_list_cubit.dart';
import 'package:potatoes/auto_list/widgets/auto_list_view.dart';
import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';
import 'package:umai/auth/bloc/follow_user_cubit.dart';
import 'package:umai/auth/bloc/preference_user_cubit.dart';
import 'package:umai/auth/bloc/auth_cubit.dart';
import 'package:umai/auth/models/follower_response.dart';
import 'package:umai/auth/widgets/user_profil_item.dart';
import 'package:umai/common/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:umai/home_screen.dart';

import 'package:umai/utils/assets.dart';
import 'dart:math';

import 'package:umai/utils/dialogs.dart';

class RegistrationFollowScreen extends StatefulWidget {
  const RegistrationFollowScreen({super.key});

  @override
  State<RegistrationFollowScreen> createState() =>
      _RegistrationFollowScreenState();
}

class _RegistrationFollowScreenState extends State<RegistrationFollowScreen>
    with CompletableMixin {
  late final authCubit = context.read<AuthCubit>();
  late final followCubit = context.read<FollowUserCubit>();
  late final preferenceUserCubit = context.read<PreferenceUserCubit>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PreferenceUserCubit, PreferenceUserState>(
      listener: onEventReceived,
      child: Scaffold(
        appBar: AppBar(
            title: const Text(
          "Rejoins la communauté!",
        )),
        body: SafeArea(
          minimum: const EdgeInsets.only(bottom: 48),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                      margin: const EdgeInsets.symmetric(vertical: 16),
                      alignment: Alignment.centerLeft,
                      child: Text(
                          'Fais-toi des amis et reste informé(e) de leur activité dans l’application',
                          style: Theme.of(context).textTheme.bodySmall)),
                  Expanded(
                      // margin: const EdgeInsets.symmetric(vertical: 16),
                      // height: MediaQuery.of(context).size.height * .73,
                      // padding: const EdgeInsets.all(8.0),
                      child: AutoListView.get<User>(
                          cubit: AutoListCubit(
                              provider: ({int page = 1}) => context
                                  .read<FollowUserCubit>()
                                  .getFollowers(page: 1)),
                          itemBuilder: (context, user) => UserProfileItem(
                                user: user,
                                // ignore: avoid_print
                                onFollowPressed: () => print(''),
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
                              )))
                ]),
          ),
        ),
        bottomNavigationBar: Container(
          color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
          child: SafeArea(
            minimum:
                const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                UmaiButton.primary(
                  onPressed: () {
                    preferenceUserCubit.completePreferenceUser();

                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //       builder: (context) => const LoginWelcomeBackScreen()),
                    // );
                  },
                  text: "Continuer",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onEventReceived(BuildContext context, PreferenceUserState state) async {
    await waitForDialog();

    if (state is PreferenceUserLoadingState) {
      loadingDialogCompleter = showLoadingBarrier(context: context);
    } else if (state is PreferenceUserSuccessState) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else if (state is PreferenceUserErrorState) {
      showError(context, state.error);
    }
  }
}

class RandomUser {
  final String imageUrl;
  final String name;
  final String description;
  final VoidCallback onFollow;

  RandomUser({
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.onFollow,
  });
}

List<RandomUser> generateRandomUsers() {
  final random = Random();
  final List<String> firstNames = [
    'Emma',
    'Liam',
    'Olivia',
    'Noah',
    'Ava',
    'Ethan',
    'Sophia',
    'Mason',
    'Isabella',
    'William',
    'Mia',
    'James',
    'Charlotte',
    'Benjamin',
    'Amelia',
  ];
  final List<String> lastNames = [
    'Smith',
    'Johnson',
    'Brown',
    'Taylor',
    'Miller',
    'Wilson',
    'Moore',
    'Anderson',
    'Thomas',
    'Jackson',
    'White',
    'Harris',
    'Martin',
    'Thompson',
  ];
  final List<String> jobs = [
    '1234 animes • 56 suivent',
    '1234 animes • 56 suivent',
    '1234 animes • 56 suivent',
    '1234 animes • 56 suivent',
    '1234 animes • 56 suivent',
    '1234 animes • 56 suivent',
    '1234 animes • 56 suivent',
    '1234 animes • 56 suivent',
    '1234 animes • 56 suivent',
    '1234 animes • 56 suivent',
  ];

  return List.generate(30, (index) {
    final firstName = firstNames[random.nextInt(firstNames.length)];
    final lastName = lastNames[random.nextInt(lastNames.length)];
    final job = jobs[random.nextInt(jobs.length)];

    return RandomUser(
      imageUrl: Assets.avatar /* 'https://picsum.photos/seed/$id/200' */,
      name: '$firstName $lastName',
      description: job,
      onFollow: () {},
    );
  });
}
