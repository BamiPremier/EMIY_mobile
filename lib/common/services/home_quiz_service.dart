import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/common/models/user.dart';
import 'package:umai/quiz/bloc/load_quiz_cubit.dart';
import 'package:umai/quiz/models/quiz.dart';
import 'package:umai/quiz/widgets/item_quiz.dart';
import 'package:umai/quiz/widgets/quiz_block.dart';

class HomeQuizService {
  late final LoadQuizCubit trendingCubit;
  late final LoadQuizCubit favoritesCubit;
  late final LoadQuizCubit recentCubit;

  HomeQuizService(BuildContext context) {
    trendingCubit = LoadQuizCubit(
        context.read(), context.read(), QuizBlockFilter.trending.name, null);

    favoritesCubit = LoadQuizCubit(
        context.read(), context.read(), QuizBlockFilter.favorites.name, null);

    recentCubit = LoadQuizCubit(
        context.read(), context.read(), QuizBlockFilter.recent.name, 10);
  }

  void deleteUserQuiz(User user) {
    trendingCubit.deleteUserQuiz(user);
    favoritesCubit.deleteUserQuiz(user);
    recentCubit.deleteUserQuiz(user);
  }

  void deleteQuiz(Quiz quiz) {
    trendingCubit.deleteQuiz(quiz);
    favoritesCubit.deleteQuiz(quiz);
    recentCubit.deleteQuiz(quiz);
  }

  void refresh() {
    trendingCubit.reset();
    favoritesCubit.reset();
    recentCubit.reset();
  }

  void dispose() {
    trendingCubit.close();
    favoritesCubit.close();
    recentCubit.close();
  }
}
