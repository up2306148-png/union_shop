import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:union_shop/screens/collections_screen.dart';

void main() {
  testWidgets('Collections screen loads and shows title', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CollectionsScreen(),
      ),
    );

    // Check the title exists
    expect(find.text('COLLECTIONS'), findsOneWidget);

    // Ensure at least one card loads
    expect(find.byType(Card), findsWidgets);
  });
}
