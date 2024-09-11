import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';
import 'package:umai/auth/bloc/signin_cubit.dart';
import 'package:umai/auth/screens/login_welcome_back.dart';
import 'package:umai/auth/widgets/user_profil_item.dart';
import 'package:umai/common/widgets/buttons.dart';
import 'package:flutter/material.dart';
 
import 'package:umai/utils/app_dimension.dart';
import 'package:umai/utils/assets.dart';
import 'dart:math';

class RegistrationFollowScreen extends StatefulWidget {
  const RegistrationFollowScreen({super.key});

  @override
  State<RegistrationFollowScreen> createState() =>
      _RegistrationFollowScreenState();
}

class _RegistrationFollowScreenState extends State<RegistrationFollowScreen>
    with CompletableMixin {
  late final signInCubit = context.read<SignInCubit>();
  final List<RandomUser> users = generateRandomUsers();

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
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "Rejoins la communauté!",
      )),
      body: SafeArea(
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
                  child: SingleChildScrollView(
                      child: ListView.builder(
                itemCount: users.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final user = users[index];
                  return UserProfileItem(
                    imageUrl: user.imageUrl,
                    name: user.name,
                    description: user.description,
                    onFollowPressed: user.onFollow,
                  );
                },
              ))),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        child: SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: 31.0, vertical: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              UmaiButton.primary(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const LoginWelcomeBackScreen()),
                  );
                },
                text: "Continuer",
              ),
            ],
          ),
        ),
      ),
    );
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
    final id = random.nextInt(1000);

    return RandomUser(
      imageUrl: Assets.avatar /* 'https://picsum.photos/seed/$id/200' */,
      name: '$firstName $lastName',
      description: '$job',
      onFollow: () {
        print('Suivre $firstName $lastName');
      },
    );
  });
}
