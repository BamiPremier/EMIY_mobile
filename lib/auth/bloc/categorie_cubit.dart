import 'dart:developer';

import 'package:potatoes/auto_content/bloc/auto_content_cubit.dart';
import 'package:umai/auth/services/auth_service.dart'; 
import 'package:umai/common/models/category_anime_response.dart';

class CategorieCubit extends AutoContentCubit<List<String>> {
  final AuthService service;
  CategorieCubit(
    this.service,
  ) : super(
          provider: () async {
            final response = await service.getCategoryAnimes();
            final categories = CategoryAnimeResponse.fromJson(response);
            return categories.genres;
          },
        );

  void selectCategory(String category) {
    if (state is CategoryReadyWithSelectionState) {
      var stateBefore = state as CategoryReadyWithSelectionState;
      List<String> updatedCategories;

      if (stateBefore.selectedCategories.contains(category)) {
        updatedCategories =
            stateBefore.selectedCategories.where((c) => c != category).toList();
      } else {
        updatedCategories = [...stateBefore.selectedCategories, category];
      }

      emit(CategoryReadyWithSelectionState(
          stateBefore.value, updatedCategories));
    } else {
      var stateBefore = state as CategoryReadyState;
      emit(CategoryReadyWithSelectionState(stateBefore.value, [category]));
    }
  }

  bool isCategorySelected(String category) {
    var currentState = state as CategoryReadyWithSelectionState;
    return currentState.selectedCategories.contains(category);
  }
}

typedef CategoryState = AutoContentState<List<String>>;
typedef CategoryReadyState = AutoContentReadyState<List<String>>;

class CategoryReadyWithSelectionState extends CategoryReadyState {
  final List<String> selectedCategories;
  const CategoryReadyWithSelectionState(super.value,
      [this.selectedCategories = const []]);
  @override
  List<Object?> get props => [...super.props, selectedCategories];
}
