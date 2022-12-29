// ignore_for_file: public_member_api_docs

import 'package:api_client/api_client.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'github_commit_data.g.dart';

@JsonSerializable()
class GithubCommitData extends Equatable {
  const GithubCommitData({
    required this.sha,
    required this.commit,
    this.nodeId,
    this.url,
    this.htmlUrl,
    this.commentsUrl,
    this.author,
    this.committer,
    this.parents,
  });
  factory GithubCommitData.fromJson(Map<String, dynamic> json) {
    return _$GithubCommitDataFromJson(json);
  }
  final String sha;
  @JsonKey(name: 'node_id')
  final String? nodeId;
  final CommitData commit;
  final String? url;
  @JsonKey(name: 'html_url')
  final String? htmlUrl;
  @JsonKey(name: 'comments_url')
  final String? commentsUrl;
  final AuthorData? author;
  final Map<String, dynamic>? committer;
  final List<Map<String, dynamic>>? parents;

  @override
  List<Object?> get props {
    return [
      sha,
      nodeId,
      commit,
      url,
      htmlUrl,
      commentsUrl,
      author,
      committer,
      parents,
    ];
  }
}
