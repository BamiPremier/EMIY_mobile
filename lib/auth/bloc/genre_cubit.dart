import 'dart:developer';

import 'package:potatoes/auto_content/bloc/auto_content_cubit.dart';
import 'package:umai/auth/services/auth_service.dart';
import 'package:umai/common/models/genre_anime.dart';

class GenreCubit extends AutoContentCubit<List<String>> {
  final AuthService service;
  GenreCubit(
    this.service,
  ) : super(
          provider: () async {
            final response = await service.getGenreAnimes();
            return response.response;
          },
        );

  void selectGenre(String genre) {
    if (state is GenreReadyWithSelectionState) {
      var stateBefore = state as GenreReadyWithSelectionState;
      List<String> updatedCategories;

      if (stateBefore.selectedCategories.contains(genre)) {
        updatedCategories =
            stateBefore.selectedCategories.where((c) => c != genre).toList();
      } else {
        updatedCategories = [...stateBefore.selectedCategories, genre];
      }

      emit(GenreReadyWithSelectionState(stateBefore.value, updatedCategories));
    } else {
      var stateBefore = state as GenreReadyState;
      emit(GenreReadyWithSelectionState(stateBefore.value, [genre]));
    }
  }

  bool isGenreSelected(String genre) {
    var currentState = state as GenreReadyWithSelectionState;
    return currentState.selectedCategories.contains(genre);
  }
}

typedef GenreState = AutoContentState<List<String>>;
typedef GenreReadyState = AutoContentReadyState<List<String>>;

class GenreReadyWithSelectionState extends GenreReadyState {
  final List<String> selectedCategories;
  const GenreReadyWithSelectionState(super.value,
      [this.selectedCategories = const []]);
  @override
  List<Object?> get props => [...super.props, selectedCategories];
}
