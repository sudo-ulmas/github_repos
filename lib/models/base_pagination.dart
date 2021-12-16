import 'package:github_repos/models/repository.dart';
import 'package:json_annotation/json_annotation.dart';

part 'base_pagination.g.dart';

@JsonSerializable()
class BasePagination {
  @JsonKey(defaultValue: 0, name: 'total_count')
  final int toalCount;
  @JsonKey(name: 'items')
  final List<Repository> repositories;

  const BasePagination({
    required this.toalCount,
    required this.repositories,
  });
  factory BasePagination.fromJson(Map<String, dynamic>? json) =>
      _$BasePaginationFromJson(json ?? {});
}
