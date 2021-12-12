// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Repository _$RepositoryFromJson(Map<String, dynamic> json) => Repository(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      private: json['private'] as bool? ?? true,
      owner: Owner.fromJson(json['owner'] as Map<String, dynamic>?),
      description: json['description'] as String? ?? '',
      language: json['language'] as String? ?? '',
      starCount: json['stargazers_count'] as int? ?? 0,
    );

Map<String, dynamic> _$RepositoryToJson(Repository instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'private': instance.private,
      'owner': instance.owner,
      'description': instance.description,
      'language': instance.language,
      'stargazers_count': instance.starCount,
    };
