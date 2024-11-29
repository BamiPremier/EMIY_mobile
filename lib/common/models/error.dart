import 'package:freezed_annotation/freezed_annotation.dart';

part 'error.freezed.dart';
part 'error.g.dart';

@freezed
class Error with _$Error {
  const Error._();

  factory Error({
    required String code,  
    required String message,  
    @JsonKey(name: 'display_messages') List<IDisplayText>? displayMessages,  
    Map<String, dynamic>? details,  
    @JsonKey(name: 'status_code') required int statusCode,  
    required String url, 
  }) = _Error;

  factory Error.fromJson(Map<String, dynamic> json) =>
      _$ErrorFromJson(json);
}

@freezed
class IDisplayText with _$IDisplayText {
  const IDisplayText._();

  factory IDisplayText({
    required String lang,  
    required String value, 
  }) = _IDisplayText;

  factory IDisplayText.fromJson(Map<String, dynamic> json) =>
      _$IDisplayTextFromJson(json);
}
