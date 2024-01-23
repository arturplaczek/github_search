import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_search/home/home.dart';
import 'package:github_search/l10n/l10n.dart';
import 'package:share_plus/share_plus.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<GithubSearchBloc, GithubSearchState, bool>(
      selector: (state) {
        return (state.githubRepository?.commits ?? [])
            .where((commit) => commit.isSelected)
            .isNotEmpty;
      },
      builder: (context, hasSelection) {
        if (!hasSelection) {
          return const SizedBox.shrink();
        }
        return FloatingActionButton(
          child: Text(context.l10n.send),
          onPressed: () {
            final selectedCommits = context
                .read<GithubSearchBloc>()
                .state
                .getSelectedCommitsMessage();

            Share.share(selectedCommits);
          },
        );
      },
    );
  }
}
