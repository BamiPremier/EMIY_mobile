import 'package:freezed_annotation/freezed_annotation.dart';

part 'anime_response.freezed.dart';
part 'anime_response.g.dart';

@freezed
class AnimeResponse with _$AnimeResponse {
  const factory AnimeResponse({
    required Pagination pagination,
    required List<Anime> animes,
  }) = _AnimeResponse;

  factory AnimeResponse.fromJson(Map<String, dynamic> json) =>
      _$AnimeResponseFromJson(json);
}

@freezed
class Pagination with _$Pagination {
  const factory Pagination({
    required int page,
    required int take,
    @JsonKey(name: 'next_page') required int? nextPage,
    required int total,
  }) = _Pagination;

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);
}

@freezed
class Anime with _$Anime {
  const factory Anime({
    required int id,
    required Title title,
    required String description,
  }) = _Anime;

  factory Anime.fromJson(Map<String, dynamic> json) => _$AnimeFromJson(json);
}

@freezed
class Title with _$Title {
  const factory Title({
    required String romaji,
    String? english,
  }) = _Title;

  factory Title.fromJson(Map<String, dynamic> json) => _$TitleFromJson(json);
}
