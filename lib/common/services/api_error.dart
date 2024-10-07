

import 'package:potatoes/potatoes.dart' as potatoes; 

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
