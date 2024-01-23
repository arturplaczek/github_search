import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_search/home/home.dart';

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
