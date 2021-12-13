import 'package:json_annotation/json_annotation.dart';

part 'issue.g.dart';

@JsonSerializable()
class Issue {
  @JsonKey(defaultValue: 0)
  final int id;
  @JsonKey(defaultValue: '')
  final String title;
  @JsonKey(defaultValue: 0)
  final int number;

  const Issue({
    required this.title,
    required this.number,
    required this.id,
  });
  factory Issue.fromJson(Map<String, dynamic>? json) =>
      _$IssueFromJson(json ?? {});
}
