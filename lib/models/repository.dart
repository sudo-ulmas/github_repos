import 'package:github_repos/models/owner.dart';
import 'package:json_annotation/json_annotation.dart';

part 'repository.g.dart';

@JsonSerializable()
class Repository {
  @JsonKey(defaultValue: 0)
  final int id;
  @JsonKey(defaultValue: '')
  final String name;
  @JsonKey(defaultValue: true)
  final bool private;
  final Owner owner;
  @JsonKey(defaultValue: '')
  final String description;
  @JsonKey(defaultValue: '')
  final String language;
  @JsonKey(defaultValue: 0, name: 'stargazers_count')
  final int starCount;
  @JsonKey(defaultValue: '', name: 'issues_url')
  final String issuesUrl;

  const Repository({
    required this.id,
    required this.name,
    required this.private,
    required this.owner,
    required this.description,
    required this.language,
    required this.starCount,
    required this.issuesUrl,
  });

  factory Repository.fromJson(Map<String, dynamic>? json) =>
      _$RepositoryFromJson(json ?? {});
}
