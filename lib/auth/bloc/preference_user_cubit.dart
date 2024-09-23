import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';
import 'package:umai/auth/services/auth_service.dart';
import 'package:umai/common/models/anime_response.dart';
import 'package:umai/common/models/genre_anime.dart';
import 'package:umai/common/models/follower_response.dart';
import 'package:umai/common/bloc/user_cubit.dart';

part 'preference_user_state.dart';

class PreferenceUserCubit extends Cubit<PreferenceUserState> {
  final UserCubit userCubit;
  final AuthService authService;
  PreferenceUserCubit(this.userCubit, this.authService)
      : super(const PreferenceUserIdleState());

  Future<GenreAnime> getCategories() async {
    final stateBefore = state;

    emit(const GenreLoadingState());

    try {
      final response = await authService.getGenreAnimes();

      final categories = GenreAnime.fromJson(response);
      emit(GenreSuccessLoadedState(categories));
      return categories;
    } catch (error, trace) {
      emit(GenreErrorState(error, trace));
      emit(stateBefore);
      rethrow;
    }
  }

  void selectGenre(String Genre) {
    final currentState = state;
    if (currentState is SelectedPrefenceUserState) {
      final updatedCategories = List<String>.from(currentState.Genre);
      if (updatedCategories.contains(Genre)) {
        updatedCategories.remove(Genre);
      } else {
        updatedCategories.add(Genre);
      }
      emit(SelectedPrefenceUserState(
          updatedCategories, currentState.anime, currentState.follow));
    } else {
      emit(SelectedPrefenceUserState([Genre], const [], const []));
    }
  }

  void addToWatchList(anime) {
    final stateBefore = state;

    emit(const WatchListAddLoadingState());

    authService.addToWatchList(anime: anime).then((response) {
      emit(WatchListAddSuccesState());

      emit(stateBefore);
    }, onError: (error, trace) {
      emit(WatchListAddErrorState(error, trace));
      emit(stateBefore);
    });
  }

  void addToViewedList(anime) {
    final stateBefore = state;

    emit(const AnimeViewedAddLoadingState());
    authService.addToViewerList(anime: anime).then((response) {
      emit(AnimeViewedAddSuccesState());

      emit(stateBefore);
    }, onError: (error, trace) {
      emit(AnimeViewedAddErrorState(error, trace));
      emit(stateBefore);
    });
  }

  void followUser({required User follower}) {
    final stateBefore = state;

    emit(const FollowerAddLoadingState());
    authService.followUser(follower: follower.id).then((response) {
      emit(FollowerAddSuccessState(follower));

      emit(stateBefore);
    }, onError: (error, trace) {
      emit(FollowerAddErrorState(error, trace));
      emit(stateBefore);
    });
  }

  void unFollowUser({required User follower}) {
    final stateBefore = state;

    emit(const FollowerAddLoadingState());
    authService.unFollowUser(follower: follower.id).then((response) {
      emit(FollowerAddSuccessState(follower));

      emit(stateBefore);
    }, onError: (error, trace) {
      emit(FollowerAddErrorState(error, trace));
      emit(stateBefore);
    });
  }
}
