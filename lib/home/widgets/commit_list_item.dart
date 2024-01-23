import 'package:flutter/material.dart';
import 'package:github_repository/github_repository.dart';
import 'package:github_search/home/home.dart';

class CommitListItem extends StatelessWidget {
  const CommitListItem({
    super.key,
    required this.githubCommit,
  });

  final GithubCommitModel githubCommit;

  @override
  Widget build(BuildContext context) {
    return CommitListItemCard(
      githubCommit: githubCommit,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommitListItemAuthor(githubCommit: githubCommit),
            const Divider(),
            const SizedBox(height: 8),
            CommitListItemMessage(githubCommit: githubCommit),
            const SizedBox(height: 16),
            CommitListItemSha(githubCommit: githubCommit),
          ],
        ),
      ),
    );
  }
}
