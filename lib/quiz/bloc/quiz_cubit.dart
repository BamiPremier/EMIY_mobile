import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/animes/models/anime.dart';
import 'package:umai/quiz/models/question_quiz.dart';
import 'package:umai/quiz/models/quiz.dart';
import 'package:umai/quiz/services/quiz_cubit_manager.dart';
import 'package:umai/quiz/services/quiz_service.dart';
import 'dart:io';

import 'package:path/path.dart';
import 'package:potatoes/potatoes.dart';
part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  final QuizManageCubitManager quizManageCubitManager;
  final QuizService quizService;

  QuizCubit(this.quizService, this.quizManageCubitManager)
      : super(const QuizIdleState());

  void createQuiz({required String title, required String description}) async {
    final stateBefore = state;

    try {
      emit(const QuizLoadingState());
      final data = {
        "title": title,
        "description": description,
        if (stateBefore is QuizSelectAnimeState)
          "anime_id": stateBefore.anime.id,
      };
      await quizService.newQuiz(data: data).then((response) async {
        print("==========${response.id}=====add quiz");
        quizManageCubitManager.add(response);
        emit(QuizCreatedState(quiz: response, questions: []));
      });
    } catch (error, trace) {
      emit(QuizErrorState(error, trace));
      emit(stateBefore);
    }
  }

  void updateQuiz({required String title, required String description}) async {
    final stateBefore = state;

    try {
      emit(const QuizLoadingState());
      final data = {
        "title": title,
        "description": description,
        if (stateBefore is QuizSelectAnimeState)
          "anime_id": stateBefore.anime.id,
      };
      await quizService
          .updateQuiz(
              data: data, idQuiz: (stateBefore as QuizCreatedState).quiz.id)
          .then((response) async {
        quizManageCubitManager.updateCubit(
            quizManageCubitManager.get(response), response);
        emit(QuizCreatedState(
            quiz: response,
            questions: (stateBefore as QuizCreatedState).questions));
      });
    } catch (error, trace) {
      emit(QuizErrorState(error, trace));
      emit(stateBefore);
    }
  }

  void publishQuiz() async {
    if (state is! QuizCreatedState) return;
    final stateBefore = state;

    try {
      emit(const QuizLoadingState());
      await quizService
          .quizPublished(idQuiz: (stateBefore as QuizCreatedState).quiz.id)
          .then((response) async {
        emit(const QuizPublishedState());
      });
    } catch (error, trace) {
      emit(QuizErrorState(error, trace));
      emit(stateBefore);
    }
  }

  void selectAnime(Anime anime) {
    emit(QuizSelectAnimeState(anime));
  }

  void addQuestion(QuestionQuiz question) async {
    if (state is! QuizCreatedState) return;
    final stateBefore = state;

    try {
      emit(const QuizLoadingState());

      var data = FormData.fromMap({
        ...question.toFormData(),
        if (question.image != null && question.image!.isNotEmpty)
          "image": await MultipartFile.fromFile(question.image!,
              filename: basename(question.image!))
      });
      await quizService
          .addQuestion(
              data: data, idQuiz: (stateBefore as QuizCreatedState).quiz.id)
          .then((response) {
        emit(QuizCreatedState(
            quiz: response, questions: [...(stateBefore).questions, question]));
      });
    } catch (error, trace) {
      emit(QuizErrorState(error, trace));
      emit(stateBefore);
    }
  }
}
