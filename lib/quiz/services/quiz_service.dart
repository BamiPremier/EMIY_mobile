import 'package:potatoes/auto_list/models/paginated_list.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/common/bloc/repport_cubit.dart';
import 'package:umai/common/services/api_service.dart';
import 'package:umai/quiz/models/quiz.dart';
import 'package:umai/quiz/models/quiz_response.dart';

class QuizService extends ApiService with ReportService<Quiz> {
  static const String _quiz = '/quiz';
  static const String _quizUpdate = '/quiz/:id';
  static const String _quizFeed = '/quiz/feed';
  static const String _quizQuestion = '/quiz/:id/question';
  static const String _quizQuestions = '/quiz/:id/questions';
  static const String _quizQuestionsUpdate = '/quiz/:id/question/:questionId';
  static const String _quizPublished = '/quiz/:id/publish';
  static const String _quizRanking = '/quiz/:id/ranking';
  static const String _quizAnimes = '/quiz/animes/:id';
  static const String _shareQuiz = '/quiz/:id/share';
  static const String _reportQuiz = '/quiz/:id/report';

  QuizService(super._dio);

  Future shareQuiz({required String idQuiz}) {
    return compute(
      dio.get(
        _shareQuiz.replaceAll(':id', idQuiz),
        options: Options(headers: withAuth()),
      ),
    );
  }

  @override
  Future reportItem({required String idItem, required String reason}) {
    return compute(
      dio.post(
        _reportQuiz.replaceAll(':id', idItem),
        options: Options(headers: withAuth()),
        data: {
          'reason': reason,
        },
      ),
    );
  }

  Future<Quiz> newQuiz({required Map<String, dynamic> data}) async {
    return compute(
        dio.post(_quiz, options: Options(headers: withAuth()), data: data),
        mapper: Quiz.fromJson);
  }

  Future<Quiz> participationQuiz(
      {required int score, required String idQuiz}) async {
    return compute(
      dio.put(_quizUpdate.replaceFirst(':id', idQuiz),
          options: Options(headers: withAuth()),
          data: {
            "score": score,
          }),
      mapper: Quiz.fromJson,
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

  Future<QuizQuestionResponse> updateQuestion(
      {required FormData data,
      required String idQuiz,
      required String idQuestion}) async {
    return compute(
        dio.patch(
            _quizQuestionsUpdate
                .replaceFirst(':id', idQuiz)
                .replaceFirst(':questionId', idQuestion),
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
              'size': size ?? 10,
            }),
        mapper: (result) => toPaginatedList(result, Quiz.fromJson));
  }

  Future<PaginatedList<Quiz>> getQuizFeed(
      {int page = 1, int? size, String? selectedFilter}) async {
    return compute(
        dio.get(_quizFeed,
            options: Options(headers: withAuth()),
            queryParameters: {
              'page': page,
              'size': size ?? 3,
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
            .map((e) => QuizQuestionResponse.fromJson(e))
            .toList());
  }

  @override
  Future<void> reportComment({
    required String idItem,
    required String reason,
  }) async {}
}
