import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';
import 'package:umai/common/models/anime_response.dart';
import 'package:umai/common/models/category_anime_response.dart';
import 'package:umai/common/models/follower_response.dart';
import 'package:umai/auth/services/preference_user_service.dart';
import 'package:umai/common/bloc/user_cubit.dart';

part 'preference_user_state.dart';

class PreferenceUserCubit extends Cubit<PreferenceUserState> {
  final UserCubit userCubit;
  final PreferenceUserService preferenceUserService;
  PreferenceUserCubit(this.userCubit, this.preferenceUserService)
      : super(const PreferenceUserIdleState());

  Future<CategoryAnimeResponse> getCategories() async {
    final stateBefore = state;

    emit(const CategoryLoadingState());

    try {
      final response = await preferenceUserService.getCategoryAnimes();

      final categories = CategoryAnimeResponse.fromJson(response);
      emit(CategorySuccessLoadedState(categories));
      return categories;
    } catch (error, trace) {
      emit(CategoryErrorState(error, trace));
      emit(stateBefore);
      rethrow;
    }
  }

  void selectCategory(String category) {
    final currentState = state;
    if (currentState is SelectedPrefenceUserState) {
      final updatedCategories = List<String>.from(currentState.category);
      if (updatedCategories.contains(category)) {
        updatedCategories.remove(category);
      } else {
        updatedCategories.add(category);
      }
      emit(SelectedPrefenceUserState(
          updatedCategories, currentState.anime, currentState.follow));
    } else {
      emit(SelectedPrefenceUserState([category], const [], const []));
    }
  }

  // void selectAnimeWatchList(String anime) {
  //   final currentState = state;
  //   if (currentState is WatchListSelectAnimeState) {
  //     final updatedAnimes = List<String>.from(currentState.anime)..add(anime);
  //     emit(WatchListSelectAnimeState(updatedAnimes));
  //   } else {
  //     emit(WatchListSelectAnimeState([anime]));
  //   }
  // }

  // void selectAnimeViewed(String anime) {
  //   final currentState = state;
  //   if (currentState is AnimeViewedSelectAnimeState) {
  //     final updatedAnimes = List<String>.from(currentState.anime)..add(anime);
  //     emit(AnimeViewedSelectAnimeState(updatedAnimes));
  //   } else {
  //     emit(AnimeViewedSelectAnimeState([anime]));
  //   }
  // }

  // void selectFollow(String follower) {
  //   final currentState = state;
  //   if (currentState is SelectFollowerState) {
  //     final updatedFollowers = List<String>.from(currentState.followers)
  //       ..add(follower);
  //     emit(SelectFollowerState(updatedFollowers));
  //   } else {
  //     emit(SelectFollowerState([follower]));
  //   }
  // }

  void addToWatchList(anime) {
    final stateBefore = state;

    emit(const WatchListAddLoadingState());

    preferenceUserService.addToWatchList(anime: anime).then((response) {
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
    preferenceUserService.addToViewerList(anime: anime).then((response) {
      emit(AnimeViewedAddSuccesState());

      emit(stateBefore);
    }, onError: (error, trace) {
      emit(AnimeViewedAddErrorState(error, trace));
      emit(stateBefore);
    });
  }

  void addToFollowerList(follower) {
    final stateBefore = state;

    emit(const FollowerAddLoadingState());
    preferenceUserService.addToFollowerList(follower: follower).then(
        (response) {
      emit(FollowerAddSuccessState());

      emit(stateBefore);
    }, onError: (error, trace) {
      emit(FollowerAddErrorState(error, trace));
      emit(stateBefore);
    });
  }
}
