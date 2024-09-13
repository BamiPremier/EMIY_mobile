import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:potatoes/auto_list/models/paginated_list.dart';

part 'pagination.freezed.dart';
part 'pagination.g.dart';

@freezed
class Pagination with _$Pagination {
  const Pagination._();

  const factory Pagination({
    required List<Map<String, dynamic>> listEntity,
    required int nbElement,
    required int perPage,
    required int currentPage,
    required int next,
  }) = _Pagination;

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);

  List<T> map<T>(T Function(Map<String, dynamic>) mapper) {
    return listEntity.map(mapper).toList();
  }

  PaginatedList<T> paginate<T>(T Function(Map<String, dynamic>) mapper) {
    return PaginatedList(
        items: listEntity.map(mapper), page: currentPage, total: nbElement);
  }
}
