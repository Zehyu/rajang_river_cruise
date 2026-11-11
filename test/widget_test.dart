
import 'package:flutter_test/flutter_test.dart';
import 'package:rajang_river_cruise/main.dart';

void main() {
  testWidgets(
    'Rajang River Cruise App Test',
        (WidgetTester tester) async {

      // Launch the application
      await tester.pumpWidget(
        const RajangRiverCruiseApp(),
      );

      // Verify AppBar title
      expect(
        find.text('Rajang River Cruise & Heritage'),
        findsOneWidget,
      );

      // Verify Cruise title
      expect(
        find.text('Rajang River Express Cruise'),
        findsOneWidget,
      );
    },
  );
}
