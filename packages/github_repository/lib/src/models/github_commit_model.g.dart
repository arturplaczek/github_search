// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_commit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GithubCommitModel _$GithubCommitModelFromJson(Map<String, dynamic> json) =>
    GithubCommitModel(
      message: json['message'] as String,
      sha: json['sha'] as String,
      authorName: json['authorName'] as String,
      date: DateTime.parse(json['date'] as String),
      isSelected: json['isSelected'] as bool? ?? false,
    );

Map<String, dynamic> _$GithubCommitModelToJson(GithubCommitModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'sha': instance.sha,
      'authorName': instance.authorName,
      'date': instance.date.toIso8601String(),
      'isSelected': instance.isSelected,
    };
