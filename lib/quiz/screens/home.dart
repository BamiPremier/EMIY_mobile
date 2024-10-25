import 'package:flutter/material.dart';
import 'package:umai/quiz/widgets/quiz_block.dart';

class QuizHomeScreen extends StatefulWidget {
  const QuizHomeScreen({super.key});

  @override
  State<QuizHomeScreen> createState() => _QuizHomeScreenState();
}

class _QuizHomeScreenState extends State<QuizHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
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
        QuizBlock.empty(title: "Les plus recents"),
      ],
      body: const QuizBlock.skinless(filter: QuizBlockFilter.recent),
    );
  }
}
