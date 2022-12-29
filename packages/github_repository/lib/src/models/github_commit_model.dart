import 'package:api_client/api_client.dart';
import 'package:equatable/equatable.dart';

/// {@template github_commit_model}
/// Model for the github commit.
/// {@endtemplate}
class GithubCommitModel extends Equatable
    implements Comparable<GithubCommitModel> {
  /// {@macro github_commit_model}
  const GithubCommitModel({
    required this.message,
    required this.sha,
    required this.authorName,
    required this.date,
  });

  /// Creates a [GithubCommitModel] from [GithubCommitData].
  factory GithubCommitModel.fromData(GithubCommitData data) {
    return GithubCommitModel(
      message: data.commit.message!,
      sha: data.sha,
      authorName: data.commit.author!.name!,
      date: data.commit.author!.date!,
    );
  }

  /// Message of the commit.
  final String message;

  /// Sha of the commit.
  final String sha;

  /// Author name of the commit.
  final String authorName;

  /// Date of the commit.
  final DateTime date;

  @override
  int compareTo(GithubCommitModel other) {
    return date.compareTo(other.date);
  }

  @override
  List<Object> get props => [
        message,
        sha,
        authorName,
        date,
      ];
}
