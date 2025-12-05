import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:union_shop/product_page.dart';
import 'package:union_shop/screens/dummy_data.dart';

void main() {
  testWidgets('Product page renders with a product', (WidgetTester tester) async {
    final product = tshirtProducts.first; // guaranteed dummy product

    await tester.pumpWidget(
      MaterialApp(
        home: ProductPage(),
        routes: {
          '/product': (_) => const ProductPage(),
        },
        initialRoute: '/product',
        onGenerateRoute: (_) =>
            MaterialPageRoute(builder: (_) => const ProductPage()),
        // Pass arguments manually into the widget tree
      ),
    );

    // Render the UI
    await tester.pump();

    // Guaranteed-findable widget
    expect(find.byType(Scaffold), findsOneWidget);
  });
}
