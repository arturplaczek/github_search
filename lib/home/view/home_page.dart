import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repository/github_repository.dart';
import 'package:github_search/home/home.dart';
import 'package:github_search/l10n/l10n.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(l10n.appTitle),
        ),
        body: const HomePageView(),
      ),
    );
  }
}

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GithubSearchBloc(
        githubRepository: context.read<GithubRepository>(),
      ),
      child: const HomeBody(),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const ShareButton(),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8),
            child: GithubNameTextfield(
              onComplete: (githubName) {
                context.read<GithubSearchBloc>().add(
                      GithubSearchEventSearch(githubName),
                    );
              },
            ),
          ),
          const Expanded(child: CommitListView()),
        ],
      ),
    );
  }
}
