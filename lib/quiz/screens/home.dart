import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/common/services/home_quiz_service.dart';
import 'package:umai/quiz/screens/new/new_quiz.dart';
import 'package:umai/quiz/widgets/quiz_block.dart';
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/svg_utils.dart';

const quizRouteHomeName = 'quiz_home';

class QuizHomeScreen extends StatefulWidget {
  const QuizHomeScreen({
    super.key,
  });

  @override
  State<QuizHomeScreen> createState() => _QuizHomeScreenState();
}

class _QuizHomeScreenState extends State<QuizHomeScreen> {
  late final homeQuizService = context.read<HomeQuizService>();
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        homeQuizService.refresh();
      },
      child: Scaffold(
        primary: false,
        body: NestedScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          headerSliverBuilder: (context, _) => [
            QuizBlock(
              title: "Tendance",
              filter: QuizBlockFilter.trending,
              cubit: homeQuizService.trendingCubit,
            ),
            QuizBlock(
              title: "Animes Favoris",
              filter: QuizBlockFilter.favorites,
              cubit: homeQuizService.favoritesCubit,
            ),
            QuizBlock.empty(
                title: "Les plus récents", cubit: homeQuizService.recentCubit),
          ],
          body: QuizBlock.skinless(
            filter: QuizBlockFilter.recent,
            cubit: homeQuizService.recentCubit,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const NewQuizScreen(),
              settings: const RouteSettings(name: quizRouteHomeName),
            ),
          ),
          child: toSvgIcon(
            icon: Assets.iconsMore,
          ),
        ),
      ),
    );
  }
}
