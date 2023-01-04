import 'package:flutter/material.dart';
import 'package:github_repository/github_repository.dart';
import 'package:github_search/home/home.dart';

class CommitList extends StatelessWidget {
  const CommitList({super.key, required this.commits});

  final List<GithubCommitModel> commits;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: commits.length,
        itemBuilder: (context, index) {
          final commit = commits[index];
          return CommitWidget(
            sha: commit.sha,
          );
        },
      ),
    );
  }
}
