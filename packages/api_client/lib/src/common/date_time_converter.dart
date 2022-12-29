import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

/// {@template date_time_converter}
/// A [JsonConverter] that converts a [DateTime] to and from a UTC [String].
/// {@endtemplate}
class DateTimeConverter extends JsonConverter<DateTime, String> {
  /// {@macro date_time_converter}
  const DateTimeConverter({this.format = 'yyyy-MM-dd HH:mm:ss'});

  /// DateTime format.
  ///
  /// Default value is `yyyy-MM-dd HH:mm:ss`.
  final String format;

  @override
  DateTime fromJson(String json) {
    return DateTime.parse(json).toUtc();
  }

  @override
  String toJson(DateTime object) {
    return DateFormat(format).format(object);
  }
}
