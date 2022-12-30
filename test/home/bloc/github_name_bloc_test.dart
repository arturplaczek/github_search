// ignore_for_file: avoid_redundant_argument_values

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_search/home/home.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockStorage extends Mock implements Storage {}

void main() {
  late Storage storage;

  setUp(() {
    storage = MockStorage();
    when(
      () => storage.write(any(), any<dynamic>()),
    ).thenAnswer((_) async {});
    HydratedBloc.storage = storage;
  });

  group('GithubNameBloc', () {
    test('can be restored', () {
      when(
        () => storage.read(any()),
      ).thenReturn(
        {
          'githubName': 'owner/repository',
          'lastGithubNames': 'owner/repository',
          'status': 'success',
        },
      );
      final bloc = GithubNameBloc();
      expect(
        bloc.state,
        const GithubNameState(
          githubName: 'owner/repository',
          lastGithubNames: {'owner/repository'},
          status: GithubNameStatus.success,
        ),
      );
    });

    blocTest<GithubNameBloc, GithubNameState>(
      'GithubNameChanged changes githubName and status to initial',
      build: GithubNameBloc.new,
      act: (bloc) => bloc.add(const GithubNameChanged('owner/repository')),
      expect: () => [
        const GithubNameState(
          githubName: 'owner/repository',
          status: GithubNameStatus.initial,
        ),
      ],
    );

    group('GithubNameSubmitted', () {
      blocTest<GithubNameBloc, GithubNameState>(
        'adds githubName to cache and changes status to success when '
        'githubName is valid',
        build: GithubNameBloc.new,
        seed: () => const GithubNameState(
          githubName: 'owner/repository',
        ),
        act: (bloc) => bloc.add(const GithubNameSubmitted()),
        expect: () => [
          const GithubNameState(
            githubName: 'owner/repository',
            lastGithubNames: {'owner/repository'},
            status: GithubNameStatus.success,
          ),
        ],
      );

      blocTest<GithubNameBloc, GithubNameState>(
        'changes status to failure, is not adding githubName to cache when '
        'githubName is invalid',
        build: GithubNameBloc.new,
        seed: () => const GithubNameState(
          githubName: 'invalid-name',
        ),
        act: (bloc) => bloc.add(const GithubNameSubmitted()),
        expect: () => [
          const GithubNameState(
            githubName: 'invalid-name',
            lastGithubNames: {},
            status: GithubNameStatus.failure,
          ),
        ],
      );
    });

    blocTest<GithubNameBloc, GithubNameState>(
      'GithubNameReset changes githubName to empty string and status to '
      'GithubNameStatus.initial',
      build: GithubNameBloc.new,
      seed: () => const GithubNameState(
        githubName: 'owner/repository',
      ),
      act: (bloc) => bloc.add(const GithubNameReset()),
      expect: () => [
        const GithubNameState(
          githubName: '',
          status: GithubNameStatus.initial,
        ),
      ],
    );
  });
}
