import 'package:flutter/material.dart';
import 'package:github_repository/github_repository.dart';
import 'package:intl/intl.dart';

class CommitWidget extends StatelessWidget {
  const CommitWidget({super.key, required this.commit});

  final GithubCommitModel commit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'SHA: ${commit.sha}',
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                commit.authorName,
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
              Text(
                DateFormat('dd/MM/yyyy hh:mm:ss').format(commit.date),
                style: const TextStyle(
                  fontSize: 12,
                ),
              )
            ],
          ),
          const Divider(),
          Text(commit.message),
        ],
      ),
    );
  }
}
