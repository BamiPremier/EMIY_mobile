import 'package:potatoes/auto_content/bloc/auto_content_cubit.dart';
import 'package:potatoes/auto_list.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/animes/models/anime.dart';
import 'package:umai/animes/services/anime_cubit_manager.dart';
import 'package:umai/auth/services/auth_service.dart';

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
