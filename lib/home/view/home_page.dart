import 'package:flutter/material.dart';
import 'package:github_search/home/home.dart';
import 'package:github_search/l10n/l10n.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeView();
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
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8),
              child: GithubNameTextfield(
                onComplete: (githubName) {
                  setState(() {
                    repositoryName = githubName;
                  });
                },
              ),
            ),
            Text(repositoryName),
          ],
        ),
      ),
    );
  }
}
