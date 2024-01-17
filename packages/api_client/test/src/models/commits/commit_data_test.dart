import 'package:api_client/api_client.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CommitData', () {
    test('can be initialized', () {
      expect(() => const CommitData(), returnsNormally);
    });

    test('supports value equality', () {
      final commitData = CommitData.fromJson(json);
      final anotherCommitData = CommitData.fromJson(json);

      expect(commitData, equals(anotherCommitData));
      expect(commitData, isNot(same(anotherCommitData)));
    });
  });
}

final json = <String, dynamic>{
  'author': {
    'name': 'arturplaczek',
    'email': 'arturp1989@gmail.com',
    'date': '2022-12-28T10:49:58Z',
  },
  'committer': {
    'name': 'arturplaczek',
    'email': 'arturp1989@gmail.com',
    'date': '2022-12-28T10:49:58Z',
  },
  'message': 'chore: initial commit',
  'tree': {
    'sha': 'e18be75630dc0ec734ded5ede1f6ca866d173443',
    'url':
        'https://api.github.com/repos/arturplaczek/github_search/git/trees/e18be75630dc0ec734ded5ede1f6ca866d173443',
  },
  'url':
      'https://api.github.com/repos/arturplaczek/github_search/git/commits/cf7984465ae97a1dcf292f80025c2674f48a79b3',
  'comment_count': 0,
  'verification': {
    'verified': false,
    'reason': 'unsigned',
    'signature': null,
    'payload': null,
  },
};
