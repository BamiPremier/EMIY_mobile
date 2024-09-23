import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:path_provider/path_provider.dart';

import 'package:potatoes/potatoes.dart' as potatoes;
import 'package:potatoes/libs.dart';

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
      statusCode == 400 || super.isUnauthenticatedError;

  @override
  List<Object?> get props => [
        ...super.props,
        errors,
      ];
}
