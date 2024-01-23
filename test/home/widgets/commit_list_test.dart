import 'package:flutter_test/flutter_test.dart';
import 'package:github_search/home/home.dart';

import '../../helpers.dart';

void main() {
  group('CommitList', () {
    testWidgets('renders correctly', (tester) async {
      await tester.pumpSubject(
        const CommitList(),
      );
      expect(find.byType(CommitListItem), findsNWidgets(1));
    });
  });
}
