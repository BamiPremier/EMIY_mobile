import 'package:potatoes/auto_list/bloc/auto_list_cubit.dart';
import 'package:potatoes/auto_list/models/paginated_list.dart';
import 'package:umai/auth/models/anime_response.dart';
import 'package:umai/auth/services/preference_user_service.dart';

class AnimeCubit extends AutoListCubit<AnimeResponse> {
  final PreferenceUserService service;

  AnimeCubit(
    this.service,
    List<String> listCategory,
  ) : super(
          provider: ({int page = 1}) {
            print(listCategory);
            print(page);
            return service
                .getAnimes(page: page, listCategory: listCategory)
                .then((p) => PaginatedList(
                    items: p.content
                        .map((e) => AnimeResponse.fromJson(e.toJson()))
                        .toList(),
                    page: p.page,
                    total: p.total));
          },
        );

  @override
  Future<PaginatedList<AnimeResponse>> Function(
      {required List<String> listCategory, int page}) get provider {
    return ({int page = 1, required List<String> listCategory}) {
      print(listCategory);
      print(page);
      return service.getAnimes(page: page, listCategory: listCategory).then(
          (p) => PaginatedList(
              items: p.content
                  .map((e) => AnimeResponse.fromJson(e.toJson()))
                  .toList(),
              page: p.page,
              total: p.total));
    };
  }

  @override
  Future<PaginatedList<Anime>> getAnimes(
      {required List<String> listCategory, int page = 1}) {
    {
      return service
          .getAnimes(page: page, listCategory: listCategory)
          .then((p) {
        print('==================p${p}');

        return PaginatedList(items: p.content, page: p.page, total: p.total);
      });
    }
  }
}
