import 'package:json_annotation/json_annotation.dart';

part 'owner.g.dart';

@JsonSerializable()
class Owner {
  @JsonKey(defaultValue: 0)
  final int id;
  @JsonKey(defaultValue: '', name: 'avatar_url')
  final String avatarUrl;
  @JsonKey(defaultValue: '')
  final String login;

  const Owner({
    required this.id,
    required this.avatarUrl,
    required this.login,
  });

  factory Owner.fromJson(Map<String, dynamic>? json) =>
      _$OwnerFromJson(json ?? {});
}
