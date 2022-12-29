import 'package:api_client/api_client.dart';
import 'package:dio/dio.dart';

/// {@template api_client}
/// Api client for downloading github data.
/// {@endtemplate}
class ApiClient {
  /// {@macro api_client}
  ApiClient({
    Dio? httpClient,
  }) : _httpClient = httpClient ?? Dio();

  final Dio _httpClient;

  /// Base url for the repository api.
  static String getClientRepositoryLink(String repositoryName) =>
      'https://api.github.com/repos/$repositoryName';

  /// Base url for the commits client.
  static String getClientCommitsLink(String repositoryName) =>
      'https://api.github.com/repos/$repositoryName/commits';

  /// Returns [GithubCommitData] for the passed repository name.
  ///
  /// Repository name must be in the correct format `<owner>/<repository>`.
  ///
  /// Throws:
  /// - [AppException] when there is a problem with the api
  /// - [DeserializationException] when there is a problem with deserialization
  Future<GithubRepositoryData> getRepositoryData(String repositoryName) async {
    try {
      final response = await _httpClient.get<Map<String, dynamic>>(
        getClientRepositoryLink(repositoryName),
      );

      return GithubRepositoryData.fromJson(response.data!);
    } on DioError catch (error, stackTrace) {
      throw AppException(error, stackTrace);
    } catch (error, stackTrace) {
      throw DeserializationException(error, stackTrace);
    }
  }

  /// Returns list of [GithubCommitData] for the passed repository name.
  ///
  /// Repository name must be in the correct format `<owner>/<repository>`.
  ///
  /// Throws:
  /// - [AppException] when there is a problem with the api
  /// - [DeserializationException] when there is a problem with deserialization
  Future<List<GithubCommitData>> getCommitsData(String repositoryName) async {
    try {
      final response = await _httpClient.get<List<dynamic>>(
        getClientCommitsLink(repositoryName),
      );

      return response.data!
          .map(
            (json) => GithubCommitData.fromJson(json as Map<String, dynamic>),
          )
          .toList();
    } on DioError catch (error, stackTrace) {
      throw AppException(error, stackTrace);
    } catch (error, stackTrace) {
      throw DeserializationException(error, stackTrace);
    }
  }
}
