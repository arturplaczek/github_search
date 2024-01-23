import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_search/home/home.dart';
import 'package:github_search/l10n/l10n.dart';

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
