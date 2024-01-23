import 'package:flutter/material.dart';

class CommitListViewLoading extends StatelessWidget {
  const CommitListViewLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
