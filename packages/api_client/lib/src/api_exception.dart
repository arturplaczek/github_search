// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';

/// {@template api_exception}
/// All the exceptions that can be thrown by the API.
/// {@endtemplate}
class AppException with EquatableMixin implements Exception {
  /// {@macro app_exception}
  const AppException(this.error, this.stackTrace);

  final Object error;

  final StackTrace stackTrace;

  @override
  List<Object?> get props => [error, stackTrace];
}

/// {@template deserialization_exception}
/// [Exception] thrown when the response returned from API cannot be converted
/// to the response data object.
/// {@endtemplate}
class DeserializationException extends AppException {
  /// {@macro deserialization_exception}
  const DeserializationException(
    super.error,
    super.stackTrace,
  );
}
