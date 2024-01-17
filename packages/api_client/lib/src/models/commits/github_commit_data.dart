import 'package:api_client/api_client.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'github_commit_data.g.dart';

/// {@template author_data}
/// A model which represents the Github commit.
/// {@endtemplate}
@JsonSerializable()
class GithubCommitData extends Equatable {
  /// {@macro author_data}
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

  /// Converts this [GithubCommitData] into a [Map].
  factory GithubCommitData.fromJson(Map<String, dynamic> json) {
    return _$GithubCommitDataFromJson(json);
  }

  /// Converts this [GithubCommitData] into a [Map].
  Map<String, dynamic> toJson() => _$GithubCommitDataToJson(this);

  /// Commit sha.
  final String sha;
  @JsonKey(name: 'node_id')

  /// Commit node id.
  final String? nodeId;

  /// Commit data.
  final CommitData commit;

  /// Commit url.
  final String? url;

  /// Commit html url.
  @JsonKey(name: 'html_url')
  final String? htmlUrl;

  /// Commit comments url.
  @JsonKey(name: 'comments_url')
  final String? commentsUrl;

  /// Commit author.
  final AuthorData? author;

  /// Commit committer.
  final Map<String, dynamic>? committer;

  /// Commit parents.
  final List<Map<String, dynamic>>? parents;

  @override
  List<Object?> get props => [
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
