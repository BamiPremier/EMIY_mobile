import 'package:potatoes/libs.dart';
import 'package:umai/animes/models/anime.dart';

class SelectAnimeCubit extends Cubit<List<Anime>> {
  SelectAnimeCubit() : super([]);

  

  void addAnime(Anime anime) {
    if (!state.contains(anime)) {
      emit([...state, anime]);
    }
  }

  void removeAnime(Anime anime) {
    if (state.contains(anime)) {
      emit(state.where((a) => a != anime).toList());
    }
  }

  bool isSelected(Anime anime) {
    return state.contains(anime);
  }
}
