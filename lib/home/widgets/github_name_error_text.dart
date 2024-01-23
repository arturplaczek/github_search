import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_search/home/home.dart';
import 'package:github_search/l10n/l10n.dart';

class GithubNameErrorText extends StatelessWidget {
  const GithubNameErrorText({super.key});

  @override
  Widget build(BuildContext context) {
    final isFailure = context.select<GithubNameBloc, bool>(
      (bloc) => bloc.state.status == GithubNameStatus.failure,
    );
    if (isFailure) {
      return Text(
        context.l10n.githubNameErrorText,
        style: const TextStyle(color: Colors.red),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
