import 'package:potatoes/common/bloc/cubit_manager.dart';
import 'package:umai/animes/models/anime.dart';
import 'package:umai/animes/services/anime_service.dart';
import 'package:umai/common/bloc/anime_manip_cubit.dart'; 

class AnimeCubitManager extends CubitManager<AnimeManipCubit, Anime, String> {
  final AnimeService animeService;

  AnimeCubitManager(
    this.animeService,
  );

  @override
  String buildId(Anime object) {
    return object.id.toString();
  }

  @override
  AnimeManipCubit create(Anime object) {
    return AnimeManipCubit(animeService, object);
  }

  @override
  void updateCubit(AnimeManipCubit cubit, Anime object) {
    cubit.update(object);
  }
}
