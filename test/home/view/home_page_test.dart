import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_search/home/view/home_page.dart';

void main() {
  group('HomePage', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: HomePage(),
        ),
      );

      expect(find.text('title'), findsOneWidget);
      expect(find.text('Text'), findsOneWidget);
      expect(find.text('1'), findsOneWidget);
    });
  });
}
