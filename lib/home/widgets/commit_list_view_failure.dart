import 'package:flutter/material.dart';
import 'package:github_search/l10n/l10n.dart';

class CommitListViewFailure extends StatelessWidget {
  const CommitListViewFailure({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Center(
      child: Text(l10n.errorText),
    );
  }
}
