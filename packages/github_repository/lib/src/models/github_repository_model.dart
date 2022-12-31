import 'package:api_client/api_client.dart';
import 'package:equatable/equatable.dart';
import 'package:github_repository/github_repository.dart';
import 'package:json_annotation/json_annotation.dart';

part 'github_repository_model.g.dart';

/// {@template github_repository_model}
/// Model for the github repository.
/// {@endtemplate}
@JsonSerializable()
class GithubRepositoryModel extends Equatable {
  /// {@macro github_repository_model}
  const GithubRepositoryModel({
    required this.id,
    this.commits = const [],
  });

  /// Creates a [GithubRepositoryModel] from [GithubRepositoryData] and list of
  /// [GithubCommitData].
  factory GithubRepositoryModel.fromData({
    required GithubRepositoryData data,
    required List<GithubCommitData> commits,
  }) =>
      GithubRepositoryModel(
        id: data.id,
        commits: commits.map(GithubCommitModel.fromData).toList(),
      );

  /// Creates a [GithubRepositoryModel] from json.
  factory GithubRepositoryModel.fromJson(Map<String, dynamic> json) {
    return _$GithubRepositoryModelFromJson(json);
  }

  /// Converts a [GithubRepositoryModel] to json.
  Map<String, dynamic> toJson() => _$GithubRepositoryModelToJson(this);

  /// Id of the repository.
  final int id;

  /// List of commits for the repository.
  final List<GithubCommitModel> commits;

  @override
  List<Object?> get props => [
        id,
        commits,
      ];
}
