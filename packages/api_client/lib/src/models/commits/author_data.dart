// ignore_for_file: public_member_api_docs

import 'package:api_client/api_client.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'author_data.g.dart';

@JsonSerializable()
class AuthorData extends Equatable {
  const AuthorData({this.name, this.email, this.date});
  factory AuthorData.fromJson(Map<String, dynamic> json) {
    return _$AuthorDataFromJson(json);
  }
  final String? name;
  final String? email;
  @DateTimeConverter()
  final DateTime? date;

  @override
  List<Object?> get props => [name, email, date];
}
