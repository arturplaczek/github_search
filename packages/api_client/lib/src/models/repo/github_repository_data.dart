// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'github_repository_data.g.dart';

@JsonSerializable()
class GithubRepositoryData extends Equatable {
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
  factory GithubRepositoryData.fromJson(Map<String, dynamic> json) {
    return _$GithubRepositoryDataFromJson(json);
  }
  final int id;
  @JsonKey(name: 'node_id')
  final String? nodeId;
  final String? name;
  @JsonKey(name: 'full_name')
  final String? fullName;
  final bool? private;
  final Map<String, dynamic>? owner;
  @JsonKey(name: 'html_url')
  final String? htmlUrl;
  final String? description;
  final bool? fork;
  final String? url;
  @JsonKey(name: 'forks_url')
  final String? forksUrl;
  @JsonKey(name: 'keys_url')
  final String? keysUrl;
  @JsonKey(name: 'collaborators_url')
  final String? collaboratorsUrl;
  @JsonKey(name: 'teams_url')
  final String? teamsUrl;
  @JsonKey(name: 'hooks_url')
  final String? hooksUrl;
  @JsonKey(name: 'issue_events_url')
  final String? issueEventsUrl;
  @JsonKey(name: 'events_url')
  final String? eventsUrl;
  @JsonKey(name: 'assignees_url')
  final String? assigneesUrl;
  @JsonKey(name: 'branches_url')
  final String? branchesUrl;
  @JsonKey(name: 'tags_url')
  final String? tagsUrl;
  @JsonKey(name: 'blobs_url')
  final String? blobsUrl;
  @JsonKey(name: 'git_tags_url')
  final String? gitTagsUrl;
  @JsonKey(name: 'git_refs_url')
  final String? gitRefsUrl;
  @JsonKey(name: 'trees_url')
  final String? treesUrl;
  @JsonKey(name: 'statuses_url')
  final String? statusesUrl;
  @JsonKey(name: 'languages_url')
  final String? languagesUrl;
  @JsonKey(name: 'stargazers_url')
  final String? stargazersUrl;
  @JsonKey(name: 'contributors_url')
  final String? contributorsUrl;
  @JsonKey(name: 'subscribers_url')
  final String? subscribersUrl;
  @JsonKey(name: 'subscription_url')
  final String? subscriptionUrl;
  @JsonKey(name: 'commits_url')
  final String? commitsUrl;
  @JsonKey(name: 'git_commits_url')
  final String? gitCommitsUrl;
  @JsonKey(name: 'comments_url')
  final String? commentsUrl;
  @JsonKey(name: 'issue_comment_url')
  final String? issueCommentUrl;
  @JsonKey(name: 'contents_url')
  final String? contentsUrl;
  @JsonKey(name: 'compare_url')
  final String? compareUrl;
  @JsonKey(name: 'merges_url')
  final String? mergesUrl;
  @JsonKey(name: 'archive_url')
  final String? archiveUrl;
  @JsonKey(name: 'downloads_url')
  final String? downloadsUrl;
  @JsonKey(name: 'issues_url')
  final String? issuesUrl;
  @JsonKey(name: 'pulls_url')
  final String? pullsUrl;
  @JsonKey(name: 'milestones_url')
  final String? milestonesUrl;
  @JsonKey(name: 'notifications_url')
  final String? notificationsUrl;
  @JsonKey(name: 'labels_url')
  final String? labelsUrl;
  @JsonKey(name: 'releases_url')
  final String? releasesUrl;
  @JsonKey(name: 'deployments_url')
  final String? deploymentsUrl;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @JsonKey(name: 'pushed_at')
  final String? pushedAt;
  @JsonKey(name: 'git_url')
  final String? gitUrl;
  @JsonKey(name: 'ssh_url')
  final String? sshUrl;
  @JsonKey(name: 'clone_url')
  final String? cloneUrl;
  @JsonKey(name: 'svn_url')
  final String? svnUrl;
  final dynamic homepage;
  final int? size;
  @JsonKey(name: 'stargazers_count')
  final int? stargazersCount;
  @JsonKey(name: 'watchers_count')
  final int? watchersCount;
  final String? language;
  @JsonKey(name: 'has_issues')
  final bool? hasIssues;
  @JsonKey(name: 'has_projects')
  final bool? hasProjects;
  @JsonKey(name: 'has_downloads')
  final bool? hasDownloads;
  @JsonKey(name: 'has_wiki')
  final bool? hasWiki;
  @JsonKey(name: 'has_pages')
  final bool? hasPages;
  @JsonKey(name: 'has_discussions')
  final bool? hasDiscussions;
  @JsonKey(name: 'forks_count')
  final int? forksCount;
  @JsonKey(name: 'mirror_url')
  final dynamic mirrorUrl;
  final bool? archived;
  final bool? disabled;
  @JsonKey(name: 'open_issues_count')
  final int? openIssuesCount;
  final dynamic license;
  @JsonKey(name: 'allow_forking')
  final bool? allowForking;
  @JsonKey(name: 'is_template')
  final bool? isTemplate;
  @JsonKey(name: 'web_commit_signoff_required')
  final bool? webCommitSignoffRequired;
  final List<dynamic>? topics;
  final String? visibility;
  final int? forks;
  @JsonKey(name: 'open_issues')
  final int? openIssues;
  final int? watchers;
  @JsonKey(name: 'default_branch')
  final String? defaultBranch;
  @JsonKey(name: 'temp_clone_token')
  final dynamic tempCloneToken;
  @JsonKey(name: 'network_count')
  final int? networkCount;
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
