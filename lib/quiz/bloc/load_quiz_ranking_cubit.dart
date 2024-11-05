import 'package:potatoes/auto_list.dart'; 
import 'package:umai/quiz/models/quiz.dart'; 
import 'package:umai/quiz/services/quiz_service.dart'; 

class LoadQuizRankingCubit extends AutoListCubit<QuizParticipation> {
  final QuizService quizService;
  final String idQuiz;
  LoadQuizRankingCubit(this.quizService, this.idQuiz, [int? size])
      : super(
            provider: ({page = 1}) => quizService.getQuizRanking(
                page: page, size: size, idQuiz: idQuiz));
}
