import 'package:flutter/material.dart';
import 'package:github_search/l10n/l10n.dart';

class CommitListViewInitial extends StatelessWidget {
  const CommitListViewInitial({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Center(
      child: Text(l10n.githubSearchText),
    );
  }
}
