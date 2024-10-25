import 'package:potatoes/auto_list/models/paginated_list.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/animes/models/anime.dart';
import 'package:umai/common/services/api_service.dart';
import 'package:umai/quiz/models/quiz.dart';

class QuizService extends ApiService {
  static const String _quizFeed = '/quizs/feed';
 

  const QuizService(super._dio);

  Future<PaginatedList<Quiz>> getQuizsFeed(
      {int page = 1, int? size, String? selectedFilter}) async {
    return compute(
        dio.get(_quizFeed,
            options: Options(headers: withAuth()),
            queryParameters: {
              'page': page,
              'size': size ?? 6,
              'selectedFilter': selectedFilter,
            }),
        mapper: (result) => toPaginatedList(result, Quiz.fromJson));
  }
 
}
