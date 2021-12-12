// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'owner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Owner _$OwnerFromJson(Map<String, dynamic> json) => Owner(
      id: json['id'] as int? ?? 0,
      avatarUrl: json['avatar_url'] as String? ?? '',
      login: json['login'] as String? ?? '',
    );

Map<String, dynamic> _$OwnerToJson(Owner instance) => <String, dynamic>{
      'id': instance.id,
      'avatar_url': instance.avatarUrl,
      'login': instance.login,
    };
