import 'dart:developer';

import 'package:potatoes/auto_content/bloc/auto_content_cubit.dart';
import 'package:umai/auth/services/preference_user_service.dart';
import 'package:umai/common/models/category_anime_response.dart';

class CategorieCubit extends AutoContentCubit<List<String>> {
  final PreferenceUserService service;
  CategorieCubit(
    this.service,
  ) : super(
          provider: () async {
            final response = await service.getCategoryAnimes();
            final categories = CategoryAnimeResponse.fromJson(response);
            return categories.genres;
          },
        );
}

class SelectedCategorieCubit extends AutoContentCubit<List<String>> {
  SelectedCategorieCubit()
      : super(
          provider: () async {
            return [];
          },
        );

  List<String> getSelectedCategories() {
    final currentState = state as AutoContentReadyState<List<String>>;
    return currentState.value;
  }
 
  void selectCategory(String category) {
    final currentState = state as AutoContentReadyState<List<String>>;
    final updatedCategories = List<String>.from(currentState.value);

    log(category);
    log(updatedCategories.toString());

    if (updatedCategories.contains(category)) {
      updatedCategories.remove(category);
    } else {
      updatedCategories.add(category);
    }
    log(updatedCategories.toString());
    emit(AutoContentReadyState(updatedCategories));
  }

  bool isCategorySelected(String category) {
    final currentState = state as AutoContentReadyState<List<String>>;
    return currentState.value.contains(category);
  }

  bool isEmpty() {
    final currentState = state as AutoContentReadyState<List<String>>;
    return currentState.value.isEmpty;
  }
}
