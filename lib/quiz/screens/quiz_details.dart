import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:readmore/readmore.dart';
import 'package:umai/common/widgets/action_widget.dart';
import 'package:umai/common/widgets/bottom_sheet.dart';
import 'package:umai/common/widgets/buttons.dart';
import 'package:umai/quiz/models/quiz.dart';
import 'package:umai/quiz/screens/quiz_participation.dart';
import 'package:umai/quiz/services/quiz_participation_cubit_manager.dart';
import 'package:umai/quiz/widgets/head_quiz.dart';
import 'package:umai/quiz/widgets/item_user_quiz.dart';
import 'package:umai/quiz/widgets/quiz_info.dart';
import 'package:umai/utils/themes.dart';

class QuizDetailScreen extends StatefulWidget {
  final Quiz quiz;
  static Widget get({
    required BuildContext context,
    required Quiz quiz,
  }) {
    return BlocProvider.value(
      value: context.read<QuizParticipationCubitManager>().get(quiz),
      child: QuizDetailScreen._(quiz: quiz),
    );
  }

  const QuizDetailScreen._({required this.quiz});
  @override
  State<QuizDetailScreen> createState() => _QuizDetailScreenState();
}

class _QuizDetailScreenState extends State<QuizDetailScreen>
    with SingleTickerProviderStateMixin {
  final _trimMode = TrimMode.Line;
  final isCollapsed = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          HeadQuiz.get(context: context, quiz: widget.quiz),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  QuizInfo.get(context: context, quiz: widget.quiz),
                  Padding(
                    padding: const EdgeInsets.only(top: 32.0, bottom: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Classement",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.titleSmall),
                        Divider(
                          color: Theme.of(context).colorScheme.outlineVariant,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (context, index) => UserItemQuiz(),
            childCount: 15,
          )),
        ],
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            UmaiButton.primary(
              onPressed: participer,
              text: "Participer",
            ),
          ],
        ),
      ),
    );
  }

  void participer() => showAppBottomSheet(
      context: context,
      builder: (_) => Padding(
          padding: const EdgeInsets.only(top: 24.0, bottom: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Participer au quiz',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16.0),
              Text(
                'Tu auras 30s pour répondre à chacune des 8 questions, ton score te sera dévoilé à la fin. ',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 32.0),
              UmaiButton.primary(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => QuizParticipationScreen.get(
                          context: context, quiz: widget.quiz)));
                },
                text: "Continuer",
              ),
            ],
          )));
  void actionsOptions() => showAppBottomSheet(
      context: context,
      horizontalPadding: 16.0,
      builder: (_) => Padding(
          padding: const EdgeInsets.only(top: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ActionWidget(
                title: 'Partager...',
                icon: Icons.share_outlined,
                onTap: () => print(''),
              ),
              const SizedBox(
                height: 16,
              ),
              ActionWidget(
                title: 'Editer',
                icon: Icons.edit_outlined,
                onTap: () => print(''),
              ),
              const SizedBox(
                height: 16,
              ),
              ActionWidget(
                title: 'Signaler',
                icon: Icons.report_gmailerrorred_rounded,
                onTap: () => print(''),
              ),
            ],
          )));
}
