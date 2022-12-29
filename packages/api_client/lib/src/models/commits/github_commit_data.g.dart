// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_commit_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GithubCommitData _$GithubCommitDataFromJson(Map<String, dynamic> json) =>
    GithubCommitData(
      sha: json['sha'] as String,
      commit: CommitData.fromJson(json['commit'] as Map<String, dynamic>),
      nodeId: json['node_id'] as String?,
      url: json['url'] as String?,
      htmlUrl: json['html_url'] as String?,
      commentsUrl: json['comments_url'] as String?,
      author: json['author'] == null
          ? null
          : AuthorData.fromJson(json['author'] as Map<String, dynamic>),
      committer: json['committer'] as Map<String, dynamic>?,
      parents: (json['parents'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$GithubCommitDataToJson(GithubCommitData instance) =>
    <String, dynamic>{
      'sha': instance.sha,
      'node_id': instance.nodeId,
      'commit': instance.commit,
      'url': instance.url,
      'html_url': instance.htmlUrl,
      'comments_url': instance.commentsUrl,
      'author': instance.author,
      'committer': instance.committer,
      'parents': instance.parents,
    };
