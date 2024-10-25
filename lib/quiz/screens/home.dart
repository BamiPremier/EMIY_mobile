import 'package:flutter/material.dart';
import 'package:umai/quiz/screens/new/new_quiz.dart';
import 'package:umai/quiz/widgets/quiz_block.dart';

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
          QuizBlock.empty(title: "Les plus recents"),
        ],
        body: const QuizBlock.skinless(filter: QuizBlockFilter.recent),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NewQuizScreen()),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
