import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';
import 'package:umai/auth/models/anime_response.dart';
import 'package:umai/auth/models/category_anime_response.dart';
import 'package:umai/auth/models/follower_response.dart';
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
      final response = await preferenceUserService.getCategoryAnimes(page: 1);
      emit(CategorySuccessLoadedState(response));
      return response;
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

  void selectAnime(AnimeResponse anime) {
    final currentState = state;
    if (currentState is SelectedPrefenceUserState) {
      final updatedAnimes = List<AnimeResponse>.from(currentState.anime)
        ..add(anime);
      emit(SelectedPrefenceUserState(
          currentState.category, updatedAnimes, currentState.follow));
    } else {
      emit(SelectedPrefenceUserState(const [], [anime], const []));
    }
  }

  void selectFollow(FollowerResponse follower) {
    final currentState = state;
    if (currentState is SelectedPrefenceUserState) {
      final updatedFollowers = List<FollowerResponse>.from(currentState.follow)
        ..add(follower);
      emit(SelectedPrefenceUserState(
          currentState.category, currentState.anime, updatedFollowers));
    } else {
      emit(SelectedPrefenceUserState(const [], const [], [follower]));
    }
  }

  void completePreferenceUser() {
    final stateBefore = state;

    emit(const PreferenceUserLoadingState());

    // preferenceUserService
    //     .completePreferenceUser(/* username: username, userTag: userTag */)
    //     .then((response) {
    //   // userCubit.preferencesService.saveUser(response.user);
    //   emit(const PreferenceUserSuccessState());

    //   emit(stateBefore);
    // }, onError: (error, trace) {
    //   emit(PreferenceUserErrorState(error, trace));
    //   emit(stateBefore);
    // });
  }
}
