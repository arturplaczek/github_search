// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_repository_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GithubRepositoryModel _$GithubRepositoryModelFromJson(
        Map<String, dynamic> json) =>
    GithubRepositoryModel(
      id: json['id'] as int,
      commits: json['commits'] == null
          ? const []
          : const _ListConverter()
              .fromJson(json['commits'] as List<Map<String, dynamic>>),
    );

Map<String, dynamic> _$GithubRepositoryModelToJson(
        GithubRepositoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'commits': const _ListConverter().toJson(instance.commits),
    };
