// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthorData _$AuthorDataFromJson(Map<String, dynamic> json) => AuthorData(
      name: json['name'] as String?,
      email: json['email'] as String?,
      date: _$JsonConverterFromJson<String, DateTime>(
          json['date'], const DateTimeConverter().fromJson),
    );

Map<String, dynamic> _$AuthorDataToJson(AuthorData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'date': _$JsonConverterToJson<String, DateTime>(
          instance.date, const DateTimeConverter().toJson),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
