import 'package:flutter/material.dart';
import 'package:github_repository/github_repository.dart';
import 'package:github_search/home/home.dart';

class CommitList extends StatelessWidget {
  const CommitList({super.key, required this.commits});

  final List<GithubCommitModel> commits;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return const Divider();
      },
      shrinkWrap: true,
      itemCount: commits.length,
      itemBuilder: (context, index) {
        return CommitWidget(
          commit: commits[index],
        );
      },
    );
  }
}
