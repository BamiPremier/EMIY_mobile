import 'package:flutter/material.dart';
import 'package:umai/quiz/screens/new/new_quiz.dart';
import 'package:umai/quiz/widgets/quiz_block.dart';
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/svg_utils.dart';

class QuizHomeScreen extends StatefulWidget {
  const QuizHomeScreen({super.key});

  @override
  State<QuizHomeScreen> createState() => _QuizHomeScreenState();
}

class _QuizHomeScreenState extends State<QuizHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: false,
      body: NestedScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        headerSliverBuilder: (context, _) => const [
          QuizBlock(
            title: "Tendance",
            filter: QuizBlockFilter.trending,
          ),
          QuizBlock(
            title: "Animes Favoris",
            filter: QuizBlockFilter.favorites,
          ),
          QuizBlock.empty(title: "Les plus récents"),
        ],
        body: const QuizBlock.skinless(filter: QuizBlockFilter.recent),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NewQuizScreen()),
        ),
        child: toSvgIcon(
          icon: Assets.iconsMore,
        ),
      ),
    );
  }
}
