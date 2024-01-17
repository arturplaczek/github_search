import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'github_repository_data.g.dart';

/// {@template github_repository_data}
/// A model which represents the Github repository.
/// {@endtemplate}
@JsonSerializable()
class GithubRepositoryData extends Equatable {
  /// {@macro github_repository_data}
  const GithubRepositoryData({
    required this.id,
    this.nodeId,
    this.name,
    this.fullName,
    this.private,
    this.owner,
    this.htmlUrl,
    this.description,
    this.fork,
    this.url,
    this.forksUrl,
    this.keysUrl,
    this.collaboratorsUrl,
    this.teamsUrl,
    this.hooksUrl,
    this.issueEventsUrl,
    this.eventsUrl,
    this.assigneesUrl,
    this.branchesUrl,
    this.tagsUrl,
    this.blobsUrl,
    this.gitTagsUrl,
    this.gitRefsUrl,
    this.treesUrl,
    this.statusesUrl,
    this.languagesUrl,
    this.stargazersUrl,
    this.contributorsUrl,
    this.subscribersUrl,
    this.subscriptionUrl,
    this.commitsUrl,
    this.gitCommitsUrl,
    this.commentsUrl,
    this.issueCommentUrl,
    this.contentsUrl,
    this.compareUrl,
    this.mergesUrl,
    this.archiveUrl,
    this.downloadsUrl,
    this.issuesUrl,
    this.pullsUrl,
    this.milestonesUrl,
    this.notificationsUrl,
    this.labelsUrl,
    this.releasesUrl,
    this.deploymentsUrl,
    this.createdAt,
    this.updatedAt,
    this.pushedAt,
    this.gitUrl,
    this.sshUrl,
    this.cloneUrl,
    this.svnUrl,
    this.homepage,
    this.size,
    this.stargazersCount,
    this.watchersCount,
    this.language,
    this.hasIssues,
    this.hasProjects,
    this.hasDownloads,
    this.hasWiki,
    this.hasPages,
    this.hasDiscussions,
    this.forksCount,
    this.mirrorUrl,
    this.archived,
    this.disabled,
    this.openIssuesCount,
    this.license,
    this.allowForking,
    this.isTemplate,
    this.webCommitSignoffRequired,
    this.topics,
    this.visibility,
    this.forks,
    this.openIssues,
    this.watchers,
    this.defaultBranch,
    this.tempCloneToken,
    this.networkCount,
    this.subscribersCount,
  });

  /// Converts this [GithubRepositoryData] into a [Map].
  factory GithubRepositoryData.fromJson(Map<String, dynamic> json) {
    return _$GithubRepositoryDataFromJson(json);
  }

  /// Converts this [Map] into a [GithubRepositoryData].
  Map<String, dynamic> toJson() => _$GithubRepositoryDataToJson(this);

  /// Repository id.
  final int id;

  /// Repository node id.
  @JsonKey(name: 'node_id')
  final String? nodeId;

  /// Repository name.
  final String? name;

  /// Repository full name.
  @JsonKey(name: 'full_name')
  final String? fullName;

  /// Indicates if repository is private.
  final bool? private;

  /// Repository owner.
  final Map<String, dynamic>? owner;

  /// Repository html url.
  @JsonKey(name: 'html_url')
  final String? htmlUrl;

  /// Repository description.
  final String? description;

  /// Indicates if repository is fork.
  final bool? fork;

  /// Repository url.
  final String? url;

  /// Repository forks url.
  @JsonKey(name: 'forks_url')

  /// Repository keys url.
  final String? forksUrl;

  /// Repository keys url.
  @JsonKey(name: 'keys_url')
  final String? keysUrl;

  /// Repository collaborators url.
  @JsonKey(name: 'collaborators_url')
  final String? collaboratorsUrl;

  /// Repository teams url.
  @JsonKey(name: 'teams_url')
  final String? teamsUrl;

  /// Repository hooks url.
  @JsonKey(name: 'hooks_url')
  final String? hooksUrl;

  /// Repository issue events url.
  @JsonKey(name: 'issue_events_url')
  final String? issueEventsUrl;

  /// Repository events url.
  @JsonKey(name: 'events_url')
  final String? eventsUrl;

  /// Repository assignees url.
  @JsonKey(name: 'assignees_url')
  final String? assigneesUrl;

  /// Repository branches url.
  @JsonKey(name: 'branches_url')
  final String? branchesUrl;

  /// Repository tags url.
  @JsonKey(name: 'tags_url')
  final String? tagsUrl;

  /// Repository blobs url.
  @JsonKey(name: 'blobs_url')
  final String? blobsUrl;

  /// Repository git tags url.
  @JsonKey(name: 'git_tags_url')
  final String? gitTagsUrl;

  /// Repository git refs url.
  @JsonKey(name: 'git_refs_url')
  final String? gitRefsUrl;

  /// Repository trees url.
  @JsonKey(name: 'trees_url')
  final String? treesUrl;

  /// Repository statuses url.
  @JsonKey(name: 'statuses_url')
  final String? statusesUrl;

  /// Repository languages url.
  @JsonKey(name: 'languages_url')
  final String? languagesUrl;

  /// Repository stargazers url.
  @JsonKey(name: 'stargazers_url')
  final String? stargazersUrl;

  /// Repository contributors url.
  @JsonKey(name: 'contributors_url')
  final String? contributorsUrl;

  /// Repository subscribers url.
  @JsonKey(name: 'subscribers_url')
  final String? subscribersUrl;

  /// Repository subscription url.
  @JsonKey(name: 'subscription_url')
  final String? subscriptionUrl;

  /// Repository commits url.
  @JsonKey(name: 'commits_url')
  final String? commitsUrl;

  /// Repository git commits url.
  @JsonKey(name: 'git_commits_url')
  final String? gitCommitsUrl;

  /// Repository comments url.
  @JsonKey(name: 'comments_url')
  final String? commentsUrl;

  /// Repository issue comment url.
  @JsonKey(name: 'issue_comment_url')
  final String? issueCommentUrl;

  /// Repository contents url.
  @JsonKey(name: 'contents_url')
  final String? contentsUrl;

  /// Repository compare url.
  @JsonKey(name: 'compare_url')
  final String? compareUrl;

  /// Repository merges url.
  @JsonKey(name: 'merges_url')
  final String? mergesUrl;

  /// Repository archive url.
  @JsonKey(name: 'archive_url')
  final String? archiveUrl;

  /// Repository downloads url.
  @JsonKey(name: 'downloads_url')
  final String? downloadsUrl;

  /// Repository issues url.
  @JsonKey(name: 'issues_url')
  final String? issuesUrl;

  /// Repository pulls url.
  @JsonKey(name: 'pulls_url')
  final String? pullsUrl;

  /// Repository milestones url.
  @JsonKey(name: 'milestones_url')
  final String? milestonesUrl;
  @JsonKey(name: 'notifications_url')

  /// Repository notifications url.
  final String? notificationsUrl;

  @JsonKey(name: 'labels_url')

  /// Repository labels url.
  final String? labelsUrl;

  @JsonKey(name: 'releases_url')

  /// Repository releases url.
  final String? releasesUrl;

  @JsonKey(name: 'deployments_url')

  /// Repository deployments url.
  final String? deploymentsUrl;

  @JsonKey(name: 'created_at')

  /// Repository creation date.
  final String? createdAt;

  @JsonKey(name: 'updated_at')

  /// Repository last update date.
  final String? updatedAt;

  @JsonKey(name: 'pushed_at')

  /// Repository last push date.
  final String? pushedAt;

  @JsonKey(name: 'git_url')

  /// Repository git url.
  final String? gitUrl;

  @JsonKey(name: 'ssh_url')

  /// Repository ssh url.
  final String? sshUrl;

  @JsonKey(name: 'clone_url')

  /// Repository clone url.
  final String? cloneUrl;

  @JsonKey(name: 'svn_url')

  /// Repository svn url.
  final String? svnUrl;

  /// Repository homepage.
  final dynamic homepage;

  /// Repository size.
  final int? size;
  @JsonKey(name: 'stargazers_count')

  /// Number of users who have starred this repository.
  final int? stargazersCount;

  @JsonKey(name: 'watchers_count')

  /// Number of users who are watching this repository.
  final int? watchersCount;

  /// The primary language of the repository.
  final String? language;

  @JsonKey(name: 'has_issues')

  /// Indicates if the repository has issues enabled.
  final bool? hasIssues;

  @JsonKey(name: 'has_projects')

  /// Indicates if the repository has projects enabled.
  final bool? hasProjects;

  @JsonKey(name: 'has_downloads')

  /// Indicates if the repository has downloads enabled.
  final bool? hasDownloads;

  @JsonKey(name: 'has_wiki')

  /// Indicates if the repository has a wiki enabled.
  final bool? hasWiki;

  @JsonKey(name: 'has_pages')

  /// Indicates if the repository has GitHub Pages enabled.
  final bool? hasPages;

  @JsonKey(name: 'has_discussions')

  /// Indicates if the repository has discussions enabled.
  final bool? hasDiscussions;

  @JsonKey(name: 'forks_count')

  /// Number of forks of this repository.
  final int? forksCount;

  @JsonKey(name: 'mirror_url')

  /// URL of the repository's mirror.
  final dynamic mirrorUrl;

  /// Indicates if the repository is archived.
  final bool? archived;

  /// Indicates if the repository is disabled.
  final bool? disabled;

  @JsonKey(name: 'open_issues_count')

  /// Number of open issues in the repository.
  final int? openIssuesCount;

  /// License of the repository.
  final dynamic license;

  /// Indicates if forking is allowed for this repository.
  @JsonKey(name: 'allow_forking')
  final bool? allowForking;

  /// Indicates if this repository is a template.
  @JsonKey(name: 'is_template')
  final bool? isTemplate;

  /// Indicates if web commit signoff is required for this repository.
  @JsonKey(name: 'web_commit_signoff_required')
  final bool? webCommitSignoffRequired;

  /// List of topics associated with this repository.
  final List<dynamic>? topics;

  /// Visibility of the repository.
  final String? visibility;

  /// Number of forks of this repository.
  final int? forks;

  /// Number of open issues in the repository.
  @JsonKey(name: 'open_issues')
  final int? openIssues;

  /// Number of users who are watching this repository.
  final int? watchers;

  /// Default branch of the repository.
  @JsonKey(name: 'default_branch')
  final String? defaultBranch;

  /// Temporary clone token of the repository.
  @JsonKey(name: 'temp_clone_token')
  final dynamic tempCloneToken;

  /// Number of repositories in the network of this repository.
  @JsonKey(name: 'network_count')
  final int? networkCount;

  /// Number of subscribers of this repository.
  @JsonKey(name: 'subscribers_count')
  final int? subscribersCount;

  @override
  List<Object?> get props {
    return [
      id,
      nodeId,
      name,
      fullName,
      private,
      owner,
      htmlUrl,
      description,
      fork,
      url,
      forksUrl,
      keysUrl,
      collaboratorsUrl,
      teamsUrl,
      hooksUrl,
      issueEventsUrl,
      eventsUrl,
      assigneesUrl,
      branchesUrl,
      tagsUrl,
      blobsUrl,
      gitTagsUrl,
      gitRefsUrl,
      treesUrl,
      statusesUrl,
      languagesUrl,
      stargazersUrl,
      contributorsUrl,
      subscribersUrl,
      subscriptionUrl,
      commitsUrl,
      gitCommitsUrl,
      commentsUrl,
      issueCommentUrl,
      contentsUrl,
      compareUrl,
      mergesUrl,
      archiveUrl,
      downloadsUrl,
      issuesUrl,
      pullsUrl,
      milestonesUrl,
      notificationsUrl,
      labelsUrl,
      releasesUrl,
      deploymentsUrl,
      createdAt,
      updatedAt,
      pushedAt,
      gitUrl,
      sshUrl,
      cloneUrl,
      svnUrl,
      homepage,
      size,
      stargazersCount,
      watchersCount,
      language,
      hasIssues,
      hasProjects,
      hasDownloads,
      hasWiki,
      hasPages,
      hasDiscussions,
      forksCount,
      mirrorUrl,
      archived,
      disabled,
      openIssuesCount,
      license,
      allowForking,
      isTemplate,
      webCommitSignoffRequired,
      topics,
      visibility,
      forks,
      openIssues,
      watchers,
      defaultBranch,
      tempCloneToken,
      networkCount,
      subscribersCount,
    ];
  }
}
