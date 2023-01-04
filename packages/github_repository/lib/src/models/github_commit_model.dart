import 'package:api_client/api_client.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'github_commit_model.g.dart';

/// {@template github_commit_model}
/// Model for the github commit.
/// {@endtemplate}
///

@JsonSerializable()
class GithubCommitModel extends Equatable
    implements Comparable<GithubCommitModel> {
  /// {@macro github_commit_model}
  const GithubCommitModel({
    required this.message,
    required this.sha,
    required this.authorName,
    required this.date,
    this.isSelected = false,
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

  /// Creates a [GithubCommitModel] from json.
  factory GithubCommitModel.fromJson(Map<String, dynamic> json) =>
      _$GithubCommitModelFromJson(json);

  /// Converts [GithubCommitModel] to json.
  Map<String, dynamic> toJson() => _$GithubCommitModelToJson(this);

  /// Message of the commit.
  final String message;

  /// Sha of the commit.
  final String sha;

  /// Author name of the commit.
  final String authorName;

  /// Date of the commit.
  final DateTime date;

  /// Indicates whether the commit is selected.
  final bool isSelected;

  /// Returns formatted date in the format 'dd/MM/yyyy hh:mm:ss'.
  String get formattedDate => DateFormat('dd/MM/yyyy hh:mm:ss').format(date);

  /// Returns a copy of the [GithubCommitModel].
  GithubCommitModel copyWith({
    bool? isSelected,
  }) {
    return GithubCommitModel(
      message: message,
      sha: sha,
      authorName: authorName,
      date: date,
      isSelected: isSelected ?? this.isSelected,
    );
  }

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
        isSelected,
      ];
}
