import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_search/home/home.dart';

typedef GithubNameTextfieldOnComplete = void Function(String);

class GithubNameTextfield extends StatelessWidget {
  const GithubNameTextfield({
    super.key,
    required this.onComplete,
  });

  final GithubNameTextfieldOnComplete onComplete;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GithubNameBloc(),
      child: GithubNameTextfieldView(onComplete: onComplete),
    );
  }
}

@visibleForTesting
class GithubNameTextfieldView extends StatelessWidget {
  const GithubNameTextfieldView({
    super.key,
    required this.onComplete,
  });

  final GithubNameTextfieldOnComplete onComplete;

  @override
  Widget build(BuildContext context) {
    return BlocListener<GithubNameBloc, GithubNameState>(
      listener: (context, state) {
        if (state.status == GithubNameStatus.success) {
          onComplete(state.githubName);
          context.read<GithubNameBloc>().add(const GithubNameReset());
        }
      },
      child: const Column(
        children: [
          Row(
            children: [
              Expanded(
                child: GithubNameEditText(),
              ),
              GithubNameSubmitIcon(),
            ],
          ),
          GithubNameErrorText(),
        ],
      ),
    );
  }
}
