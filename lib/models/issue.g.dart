// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'issue.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Issue _$IssueFromJson(Map<String, dynamic> json) => Issue(
      title: json['title'] as String? ?? '',
      number: json['number'] as int? ?? 0,
      id: json['id'] as int? ?? 0,
    );

Map<String, dynamic> _$IssueToJson(Issue instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'number': instance.number,
    };
