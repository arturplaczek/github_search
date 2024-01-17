import 'package:api_client/api_client.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'commit_data.g.dart';

/// {@template commit_data}
/// A model which represents the commit data.
/// {@endtemplate}
@JsonSerializable()
class CommitData extends Equatable {
  /// {@macro commit_data}
  const CommitData({
    this.author,
    this.committer,
    this.message,
    this.tree,
    this.url,
    this.commentCount,
    this.verification,
  });

  /// Factory which converts a [Map] into a [CommitData].
  factory CommitData.fromJson(Map<String, dynamic> json) {
    return _$CommitDataFromJson(json);
  }

  /// Converts this [CommitData] into a [Map].
  Map<String, dynamic> toJson() => _$CommitDataToJson(this);

  /// Author of commit.
  final AuthorData? author;

  /// Committer of commit.
  final Map<String, dynamic>? committer;

  /// Commit message.
  final String? message;

  /// Commit tree.
  final Map<String, dynamic>? tree;

  /// Commit url.
  final String? url;

  /// Commit comment count.
  @JsonKey(name: 'comment_count')
  final int? commentCount;

  /// Commit verification.
  final Map<String, dynamic>? verification;

  @override
  List<Object?> get props {
    return [
      author,
      committer,
      message,
      tree,
      url,
      commentCount,
      verification,
    ];
  }
}
