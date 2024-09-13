import 'package:potatoes/auto_list/bloc/auto_list_cubit.dart';
import 'package:umai/auth/models/category_anime_response.dart';
import 'package:umai/auth/services/preference_user_service.dart';

class CategoryAnimeCubit extends AutoListCubit<CategoryAnimeResponse> {
  final PreferenceUserService service;

  CategoryAnimeCubit(
    this.service,
  ) : super(
            provider: ({int page = 1}) => service
                .getCategoryAnimes(
                  page: page,
                )
                .then((p) => p.paginate(CategoryAnimeResponse.fromJson)));

  @override
  DataProvider<CategoryAnimeResponse> get provider {
    return ({int page = 1}) => service
        .getCategoryAnimes(
          page: page,
        )
        .then((p) => p.paginate(CategoryAnimeResponse.fromJson));
  }
}
