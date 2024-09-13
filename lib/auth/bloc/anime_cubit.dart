import 'package:potatoes/auto_list/bloc/auto_list_cubit.dart';
import 'package:potatoes/auto_list/models/paginated_list.dart';
import 'package:umai/auth/models/anime_response.dart';
import 'package:umai/auth/services/preference_user_service.dart';

class AnimeCubit extends AutoListCubit<AnimeResponse> {
  final PreferenceUserService service;

  AnimeCubit(
    this.service,
    List<int> listCategory,
  ) : super(
            provider: ({int page = 1}) => service
                .getAnimes(page: page, listCategory: listCategory)
                .then((p) => p.paginate(AnimeResponse.fromJson)));

  @override
  Future<PaginatedList<AnimeResponse>> Function(
      {required List<int> listCategory, int page}) get provider {
    return ({int page = 1, required List<int> listCategory}) => service
        .getAnimes(page: page, listCategory: listCategory)
        .then((p) => p.paginate(AnimeResponse.fromJson));
  }
}
