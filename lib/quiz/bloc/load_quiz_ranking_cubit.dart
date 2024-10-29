import 'package:potatoes/auto_list.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/animes/models/anime.dart';
import 'package:umai/animes/services/anime_cubit_manager.dart';
import 'package:umai/animes/services/anime_service.dart';
import 'package:umai/quiz/models/quiz.dart';
import 'package:umai/quiz/services/quiz_participation_cubit_manager.dart';
import 'package:umai/quiz/services/quiz_service.dart';
import 'package:umai/common/services/person_cubit_manager.dart';

class LoadQuizRankingCubit extends AutoListCubit<QuizParticipation> {
  final QuizService quizService;
  final String idQuiz;
  LoadQuizRankingCubit(this.quizService, this.idQuiz, [int? size])
      : super(
            provider: ({page = 1}) => quizService.getQuizRanking(
                page: page, size: size, idQuiz: idQuiz));
}
