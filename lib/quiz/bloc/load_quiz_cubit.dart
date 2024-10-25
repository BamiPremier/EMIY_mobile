import 'package:potatoes/auto_list.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/animes/models/anime.dart';
import 'package:umai/animes/services/anime_cubit_manager.dart';
import 'package:umai/animes/services/anime_service.dart';
import 'package:umai/quiz/models/quiz.dart';
import 'package:umai/quiz/services/QUIZ_service.dart';

class LoadQuizCubit extends AutoListCubit<Quiz> {
  final QuizService quizService;
  final String selectedFilter;
  LoadQuizCubit(this.quizService, this.selectedFilter, [int? size])
      : super(
            provider: ({page = 1}) => quizService.getQuizsFeed(
                page: page, size: size, selectedFilter: selectedFilter));

   
}
