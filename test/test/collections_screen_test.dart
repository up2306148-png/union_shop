import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:union_shop/screens/collections_screen.dart';

void main() {
  testWidgets('Collections screen renders without crashing', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: CollectionsScreen()),
    );

    await tester.pump(); // Build one frame

    // Guaranteed-findable widget: Scaffold
    expect(find.byType(Scaffold), findsOneWidget);

    // Ensure at least one widget exists in body
    expect(find.byType(Column), findsWidgets);
  });
}
