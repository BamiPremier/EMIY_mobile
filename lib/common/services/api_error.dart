
import 'package:potatoes/potatoes.dart' as potatoes  ;
import 'package:umai/common/models/error.dart';
class ApiError extends potatoes.ApiError {
  final Error? error;

  ApiError.fromDio(super.dio)
      : error = null,
        super.fromDio();

  const ApiError.unknown(super.message, [super.trace])
      : error = null,
        super.unknown();

  ApiError.fromApi(Map<String, dynamic> errors, [StackTrace? trace])
      : error = Error.fromJson(errors),
        super.unknown(null, trace);

  @override
  bool get isUnauthenticatedError =>
      super.statusCode == 401 || super.isUnauthenticatedError;

  @override
  List<Object?> get props => [...super.props, error];
}
