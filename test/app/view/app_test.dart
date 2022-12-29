import 'package:api_client/api_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_search/app/app.dart';
import 'package:mocktail/mocktail.dart';

class _MockApiClient extends Mock implements ApiClient {}

void main() {
  group('App', () {
    testWidgets('renders AppView', (WidgetTester tester) async {
      await tester.pumpWidget(App(
        apiClient: _MockApiClient(),
      ));

      await tester.pump();

      expect(find.byType(AppView), findsOneWidget);
    });
  });
}
