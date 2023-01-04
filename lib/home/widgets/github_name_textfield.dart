import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_search/home/home.dart';
import 'package:github_search/l10n/l10n.dart';

typedef CompleteFunction = void Function(String);

class GithubNameTextfield extends StatelessWidget {
  const GithubNameTextfield({
    super.key,
    required this.onComplete,
  });

  final CompleteFunction onComplete;

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
  const GithubNameTextfieldView({super.key, required this.onComplete});

  final CompleteFunction onComplete;

  @override
  Widget build(BuildContext context) {
    return BlocListener<GithubNameBloc, GithubNameState>(
      listener: (context, state) {
        if (state.status == GithubNameStatus.success) {
          onComplete(state.githubName);
          context.read<GithubNameBloc>().add(const GithubNameReset());
        }
      },
      child: Column(
        children: [
          Row(
            children: const [
              Expanded(
                child: GithubNameEditText(),
              ),
              GithubNameSubmitIcon(),
            ],
          ),
          const GithubNameErrorText(),
        ],
      ),
    );
  }
}

class GithubNameEditText extends StatelessWidget {
  const GithubNameEditText({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<GithubNameBloc>().state;

    return Autocomplete(
      optionsBuilder: (textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<String>.empty();
        }
        return state.lastGithubNames.where((option) {
          return option
              .toLowerCase()
              .contains(textEditingValue.text.toLowerCase());
        });
      },
      initialValue: TextEditingValue(
        text: state.githubName,
      ),
      onSelected: (selection) {
        context.read<GithubNameBloc>()
          ..add(GithubNameChanged(selection))
          ..add(const GithubNameSubmitted());
      },
      fieldViewBuilder: (
        BuildContext context,
        TextEditingController textEditingController,
        FocusNode focusNode,
        VoidCallback onFieldSubmitted,
      ) {
        return TextFormField(
          decoration: InputDecoration(
            hintText: context.l10n.githubNameTextHint,
            labelText: context.l10n.githubNameText,
          ),
          controller: textEditingController,
          focusNode: focusNode,
          onChanged: (value) {
            context.read<GithubNameBloc>().add(GithubNameChanged(value));
          },
          onFieldSubmitted: (value) {
            context.read<GithubNameBloc>().add(GithubNameChanged(value));
            onFieldSubmitted();
          },
        );
      },
    );
  }
}

@visibleForTesting
class GithubNameSubmitIcon extends StatelessWidget {
  const GithubNameSubmitIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.read<GithubNameBloc>().add(const GithubNameSubmitted());
      },
      icon: const Icon(Icons.search),
    );
  }
}

@visibleForTesting
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
