import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:path_provider/path_provider.dart';
import 'package:potatoes/auto_list/models/paginated_list.dart';
import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart' as potatoes;

class ApiLinks extends potatoes.Links {
  const ApiLinks();

  @override
  String get devUrl => "https://umai.caelis-tech.studio/api";

  @override
  // TODO: implement productionUrl
  String get productionUrl => "https://umai.caelis-tech.studio/api";

  @override
  String get stagingUrl => "https://umai.caelis-tech.studio/api";
}

class ApiService extends potatoes.ApiService {
  final CacheOptions? cacheOptions;

  const ApiService(super._dio, [this.cacheOptions]);

  @override
  Future<T> compute<T>(Future<Response<dynamic>> request,
      {String? mapperKey,
      T Function(Map<String, dynamic> p1)? mapper,
      T Function(String p1)? messageMapper}) async {
    assert(mapper == null || messageMapper == null);
    try {
      Response response = await request;

      if (response.data != null) {
        return defaultExtractResult(
            response.data, mapperKey, mapper, messageMapper);
      } else {
        if (response.data['error'] != null) {
          throw response.data['error'];
        }
        throw response.data['detail'];
      }
    } on DioException catch (e) {
      throw potatoes.ApiError.fromDio(e);
    } on Map<String, dynamic> catch (errors, s) {
      // API error as Map
      throw ApiError.fromApi(errors, s);
    } on String catch (e) {
      // API error as single string. Is either 'error' or 'detail'
      throw ApiError.unknown(e);
    } catch (e, s) {
      throw potatoes.ApiError.unknown(e.toString(), s);
    }
  }

  PaginatedList<T> toPaginatedList<T>(
      Map<String, dynamic> data, T Function(Map<String, dynamic> item) mapper) {
    return PaginatedList(
        items: (data['content'] as List<dynamic>)
            .map((e) => mapper(e as Map<String, dynamic>))
            .toList(),
        page: data['page'],
        total: data['total']);
  }
}

class ApiError extends potatoes.ApiError {
  final Map<String, String>? errors;

  ApiError.fromDio(super.dio)
      : errors = null,
        super.fromDio();

  const ApiError.unknown(super.message, [super.trace])
      : errors = null,
        super.unknown();

  ApiError.fromApi(Map<String, dynamic> errors, [StackTrace? trace])
      : errors = errors.map((key, value) => MapEntry(key, value.toString())),
        super.unknown(null, trace);

  @override
  bool get isUnauthenticatedError =>
      super.statusCode == 400 || super.isUnauthenticatedError;

  @override
  List<Object?> get props => [...super.props, errors];
}

Future<CacheOptions> cacheStoreOptions() {
  return getTemporaryDirectory().then((directory) {
    return CacheOptions(
      store: HiveCacheStore(directory.path),
      maxStale: const Duration(days: 1),
      policy: CachePolicy.noCache,
    );
  });
}
