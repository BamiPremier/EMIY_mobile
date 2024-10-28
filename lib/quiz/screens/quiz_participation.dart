import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:umai/common/widgets/buttons.dart';
import 'package:umai/quiz/models/quiz.dart';
import 'package:umai/quiz/widgets/head_quiz.dart';
import 'package:umai/utils/themes.dart';

class QuizParticipationScreen extends StatefulWidget {
  @override
  State<QuizParticipationScreen> createState() =>
      _QuizParticipationScreenState();
}

class _QuizParticipationScreenState extends State<QuizParticipationScreen> {
  List<int> selectedOptions = [];
  List<String> listOptions = [
    'La proposition A',
    'La proposition B',
    'La proposition C',
    'La proposition D',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        HeadQuiz(),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Question 1 - 10',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  'Lorem ipsum dolor sit amet consectetur. Mattis cras egestas tristique convallis.',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppTheme.disabledText,
                      ),
                ),
                const SizedBox(height: 16.0),
                const Divider(),
                LinearProgressIndicator(
                  color: Theme.of(context).colorScheme.onTertiaryContainer,
                  backgroundColor:
                      Theme.of(context).colorScheme.tertiaryContainer,
                  borderRadius: BorderRadius.circular(30),
                ),
                const SizedBox(height: 32.0),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: listOptions.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 12.0),
                  itemBuilder: (context, index) {
                    return listOptions.contains(listOptions[index])
                        ? selectedOption(listOptions[index])
                        : unSelectedOption(listOptions[index]);
                  },
                ),
              ],
            ),
          ),
        ),
      ]),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
        child: UmaiButton.primary(
          onPressed: () {},
          text: "Valider",
        ),
      ),
    );
  }

  Widget selectedOption(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
      ),
    );
  }

  Widget unSelectedOption(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceBright,
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
      ),
    );
  }

  Widget correctOption(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
      decoration: BoxDecoration(
        color: AppTheme.green,
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: AppTheme.onHighGreen,
            ),
      ),
    );
  }

  Widget inCorrectOption(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
      decoration: BoxDecoration(
        color: AppTheme.errorRed,
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
