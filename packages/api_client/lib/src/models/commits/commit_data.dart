// ignore_for_file: public_member_api_docs

import 'package:api_client/api_client.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'commit_data.g.dart';

@JsonSerializable()
class CommitData extends Equatable {
  const CommitData({
    this.author,
    this.committer,
    this.message,
    this.tree,
    this.url,
    this.commentCount,
    this.verification,
  });
  factory CommitData.fromJson(Map<String, dynamic> json) {
    return _$CommitDataFromJson(json);
  }
  final AuthorData? author;
  final Map<String, dynamic>? committer;
  final String? message;
  final Map<String, dynamic>? tree;
  final String? url;
  @JsonKey(name: 'comment_count')
  final int? commentCount;
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
