import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repository/github_repository.dart';
import 'package:github_search/home/home.dart';

class CommitWidget extends StatelessWidget {
  const CommitWidget({
    super.key,
    required this.sha,
  });

  final String sha;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<GithubSearchBloc, GithubSearchState, GithubCommitModel>(
      selector: (state) {
        return state.repository!.commits.firstWhere(
          (commit) => commit.sha == sha,
        );
      },
      builder: (context, commit) {
        final textTheme = commit.isSelected
            ? const TextStyle(
                color: Colors.white,
                fontSize: 12,
              )
            : const TextStyle(fontSize: 12);

        return GestureDetector(
          key: ValueKey('${commit.sha}${commit.isSelected}'),
          onTap: () {
            context
                .read<GithubSearchBloc>()
                .add(GithubSearchToggleCommit(sha: commit.sha));
          },
          child: Card(
            clipBehavior: Clip.hardEdge,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ColoredBox(
              color: commit.isSelected ? Colors.blue : Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'SHA: ${commit.sha}',
                      style: textTheme,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          commit.authorName,
                          style: textTheme,
                        ),
                        Text(
                          commit.formattedDate,
                          style: textTheme,
                        )
                      ],
                    ),
                    const Divider(),
                    Text(
                      commit.message,
                      style: textTheme,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
