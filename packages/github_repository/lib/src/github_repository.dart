import 'package:api_client/api_client.dart';
import 'package:github_repository/github_repository.dart';

/// {@template github_repository}
/// Repository for downloading github data.
/// {@endtemplate}
class GithubRepository {
  /// {@macro github_repository}
  const GithubRepository({
    required ApiClient apiClient,
  }) : _apiClient = apiClient;

  final ApiClient _apiClient;

  /// Returns [GithubRepositoryModel] for the passed repository name.
  ///
  /// Repository name must be in the correct format `<owner>/<repository>`.
  ///
  /// Throws [GithubRepositoryException] when there is a problem with the api.
  Future<GithubRepositoryModel> getGithubRepository(
    String repositoryName,
  ) async {
    try {
      final repositoryData = await _apiClient.getRepositoryData(repositoryName);
      final commitsData = await _apiClient.getCommitsData(repositoryName);

      return GithubRepositoryModel.fromData(
        data: repositoryData,
        commits: commitsData,
      );
    } catch (error, stackTrace) {
      throw GithubRepositoryException(error, stackTrace);
    }
  }
}

/// {@template github_repository_exception}
/// Throws when an error occurs in github repository.
/// {@endtemplate}
class GithubRepositoryException extends AppException {
  /// {@macro github_repository_exception}
  const GithubRepositoryException(
    super.error,
    super.stackTrace,
  );
}
