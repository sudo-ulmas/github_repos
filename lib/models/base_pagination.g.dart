// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_pagination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasePagination _$BasePaginationFromJson(Map<String, dynamic> json) =>
    BasePagination(
      toalCount: json['total_count'] as int? ?? 0,
      repositories: (json['items'] as List<dynamic>)
          .map((e) => Repository.fromJson(e as Map<String, dynamic>?))
          .toList(),
    );

Map<String, dynamic> _$BasePaginationToJson(BasePagination instance) =>
    <String, dynamic>{
      'total_count': instance.toalCount,
      'items': instance.repositories,
    };
