import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_search/home/view/home_page.dart';
import 'package:github_search/l10n/l10n.dart';

void main() {
  group('HomePage', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          home: HomePage(),
        ),
      );

      final l10n = tester.element(find.byType(HomePage)).l10n;

      expect(find.text(l10n.appTitle), findsOneWidget);
      expect(find.text('Text'), findsOneWidget);
      expect(find.text('1'), findsOneWidget);
    });
  });
}
