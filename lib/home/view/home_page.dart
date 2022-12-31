import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repository/github_repository.dart';
import 'package:github_search/home/home.dart';
import 'package:github_search/l10n/l10n.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GithubSearchBloc(
        githubRepository: context.read<GithubRepository>(),
      ),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String repositoryName = '';

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.appTitle),
      ),
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
          const Expanded(child: HomeViewBody())
        ],
      ),
    );
  }
}

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocBuilder<GithubSearchBloc, GithubSearchState>(
      builder: (context, state) {
        if (state.status == GithubSearchStatus.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.status == GithubSearchStatus.failure) {
          return Center(
            child: Text(l10n.errorText),
          );
        } else if (state.status == GithubSearchStatus.success) {
          return Column(
            children: [
              Text('Repository ID: ${state.repository?.id}'),
              const SizedBox(height: 20),
              Expanded(
                child: CommitList(commits: state.repository!.commits),
              ),
              const SizedBox(height: 10),
            ],
          );
        } else {
          return Center(
            child: Text(l10n.githubSearchText),
          );
        }
      },
    );
  }
}
