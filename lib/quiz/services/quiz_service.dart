import 'package:potatoes/auto_list/models/paginated_list.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/common/services/api_service.dart';
import 'package:umai/quiz/models/quiz.dart';
import 'package:umai/quiz/models/quiz_response.dart';

class QuizService extends ApiService {
  static const String _quiz = '/quiz';
  static const String _quizUpdate = '/quiz/:id';
  static const String _quizFeed = '/quiz/feed';
  static const String _quizQuestion = '/quiz/:id/question';
  static const String _quizQuestions = '/quiz/:id/questions';
  static const String _quizQuestionsUpdate = '/quiz/:id/questions/{questionId}';
  static const String _quizPublished = '/quiz/:id/publish';
  static const String _quizFeedByUser = '/quiz/user';
  static const String _quizRanking = '/quiz/:id/ranking';
  static const String _quizAnimes = '/quiz/animes/:id';
  QuizService(super._dio);
  Future<Quiz> newQuiz({required Map<String, dynamic> data}) async {
    return compute(
        dio.post(_quiz, options: Options(headers: withAuth()), data: data),
        mapper: Quiz.fromJson);
  }

  Future participationQuiz(
      {required Map<String, dynamic> data, required String idQuiz}) async {
    return compute(
      dio.put(_quizUpdate.replaceFirst(':id', idQuiz),
          options: Options(headers: withAuth()), data: data),
    );
  }

  Future<Quiz> quizPublished({required String idQuiz}) async {
    return compute(
        dio.post(_quizPublished.replaceFirst(':id', idQuiz),
            options: Options(headers: withAuth())),
        mapper: Quiz.fromJson);
  }

  Future<Quiz> updateQuiz(
      {required Map<String, dynamic> data, required String idQuiz}) async {
    return compute(
        dio.patch(_quizUpdate.replaceFirst(':id', idQuiz),
            options: Options(headers: withAuth()), data: data),
        mapper: Quiz.fromJson);
  }

  Future<QuizQuestionResponse> addQuestion(
      {required FormData data, required String idQuiz}) async {
    return compute(
        dio.post(_quizQuestion.replaceFirst(':id', idQuiz),
            options: Options(headers: {
              ...withAuth(),
            }),
            data: data),
        mapper: QuizQuestionResponse.fromJson);
  }

  Future<PaginatedList<Quiz>> getQuizsAnime(
      {int page = 1, int? size, required String animeId}) async {
    return compute(
        dio.get(_quizAnimes.replaceFirst(':id', animeId),
            options: Options(headers: withAuth()),
            queryParameters: {
              'page': page,
              'size': size ?? 610,
            }),
        mapper: (result) => toPaginatedList(result, Quiz.fromJson));
  }

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

  Future<PaginatedList<QuizParticipation>> getQuizRanking(
      {int page = 1, int? size, required String idQuiz}) async {
    return compute(
        dio.get(_quizRanking.replaceFirst(':id', idQuiz),
            options: Options(headers: withAuth()),
            queryParameters: {
              'page': page,
              'size': size ?? 6,
            }),
        mapper: (result) =>
            toPaginatedList(result, QuizParticipation.fromJson));
  }

  Future<List<QuizQuestionResponse>> getQuizQuestions(
      {required String idQuiz}) async {
    return compute(
        dio.get(
          _quizQuestions.replaceFirst(':id', idQuiz),
          options: Options(headers: withAuth()),
        ),
        mapper: (result) => (result['questions'] as List<dynamic>)
            .map((question) =>
                QuizQuestionResponse.fromJson(question as Map<String, dynamic>))
            .toList());
  }
}
