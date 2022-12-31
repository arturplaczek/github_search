// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_repository_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GithubRepositoryModel _$GithubRepositoryModelFromJson(
  Map<String, dynamic> json,
) =>
    GithubRepositoryModel(
      id: json['id'] as int,
      commits: (json['commits'] as List<dynamic>?)
              ?.map(
                (e) => GithubCommitModel.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
    );

Map<String, dynamic> _$GithubRepositoryModelToJson(
  GithubRepositoryModel instance,
) =>
    <String, dynamic>{
      'id': instance.id,
      'commits': instance.commits,
    };
