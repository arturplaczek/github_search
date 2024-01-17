import 'package:api_client/api_client.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'author_data.g.dart';

/// {@template author_data}
/// A model which represents the author of a commit.
/// {@endtemplate}
@JsonSerializable()
class AuthorData extends Equatable {
  /// {@macro author_data}
  const AuthorData({
    this.name,
    this.email,
    this.date,
  });

  /// Factory which converts a [Map] into a [AuthorData].
  factory AuthorData.fromJson(Map<String, dynamic> json) {
    return _$AuthorDataFromJson(json);
  }

  /// Converts this [AuthorData] into a [Map].
  Map<String, dynamic> toJson() => _$AuthorDataToJson(this);

  /// Author name.
  final String? name;

  /// Author email.
  final String? email;

  /// Date of commit.
  @DateTimeConverter()
  final DateTime? date;

  @override
  List<Object?> get props => [
        name,
        email,
        date,
      ];
}
