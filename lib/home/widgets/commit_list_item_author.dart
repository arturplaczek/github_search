import 'package:flutter/material.dart';
import 'package:github_repository/github_repository.dart';

class CommitListItemAuthor extends StatelessWidget {
  const CommitListItemAuthor({
    super.key,
    required this.githubCommit,
  });

  final GithubCommitModel githubCommit;

  @override
  Widget build(BuildContext context) {
    final textTheme = githubCommit.isSelected
        ? const TextStyle(
            color: Colors.white,
            fontSize: 10,
          )
        : const TextStyle(fontSize: 10);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          githubCommit.authorName,
          style: textTheme,
        ),
        Text(
          githubCommit.formattedDate,
          style: textTheme,
        ),
      ],
    );
  }
}
