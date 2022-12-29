// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:github_repository/github_repository.dart';

void main() {
  group('GithubRepository', () {
    test('can be instantiated', () {
      expect(GithubRepository(), isNotNull);
    });
  });
}
