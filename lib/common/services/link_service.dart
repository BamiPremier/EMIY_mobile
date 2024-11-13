 
import 'package:potatoes/libs.dart';
import 'package:umai/animes/models/anime.dart';
import 'package:umai/animes/models/episode.dart'; 
import 'package:umai/common/services/api_service.dart';
import 'package:umai/quiz/models/quiz.dart';
import 'package:umai/common/models/user.dart';
import 'package:umai/social/models/post.dart';

class LinkService extends ApiService {
  static const String _getPost = '/posts/:idPost';
  static const String _getUser = '/users/:idUser';
  static const String _getAnime = '/animes/:idAnime';
  static const String _getEpisode = '/episodes/:idEpisode';
  static const String _getQuiz = '/quiz/:idQuiz';

  const LinkService(super._dio);

  Future<User> getUser({required String idUser}) {
    return compute(
        dio.get(
          _getUser.replaceAll(':idUser', idUser),
          options: Options(headers: withAuth()),
        ),
        mapper: User.fromJson);
  }

  Future<Post> getPost({required String idPost}) {
    return compute(
        dio.get(
          _getPost.replaceAll(':idPost', idPost),
          options: Options(headers: withAuth()),
        ),
        mapper: Post.fromJson);
  }
  Future<Anime> getAnime({required String idAnime}) {
    return compute(
        dio.get(
          _getAnime.replaceAll(':idAnime', idAnime.toString()),
          options: Options(headers: withAuth()),
        ),
        mapper: Anime.fromJson);
  }

  Future<Episode> getEpisode({required String idEpisode}) {
    return compute(
        dio.get(
          _getEpisode.replaceAll(':idEpisode', idEpisode.toString()),
          options: Options(headers: withAuth()),
        ),
        mapper: (data) => Episode.fromJson(data['episode']));
  }

  Future<Quiz> getQuiz({required String idQuiz}) {
    return compute(
        dio.get(
          _getQuiz.replaceAll(':idQuiz', idQuiz.toString()),
          options: Options(headers: withAuth()),
        ),
        mapper: Quiz.fromJson);
  }
}
