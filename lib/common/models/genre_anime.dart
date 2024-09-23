

import 'package:freezed_annotation/freezed_annotation.dart';
part 'genre_anime.freezed.dart';
part 'genre_anime.g.dart';

@freezed
class GenreAnime with _$GenreAnime {
  const factory GenreAnime({
    required List<String> response,
  }) = _GenreAnime;

  factory GenreAnime.fromJson(Map<String, dynamic> json) =>
      _$GenreAnimeFromJson(json);
}
