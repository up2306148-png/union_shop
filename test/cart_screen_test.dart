import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:union_shop/screens/cart_screen.dart';
import 'package:union_shop/screens/cart_state.dart';

void main() {
  testWidgets('Cart screen loads and shows empty message', (WidgetTester tester) async {
    cartItems.clear(); // Ensure empty cart for test

    await tester.pumpWidget(
      const MaterialApp(
        home: CartScreen(),
      ),
    );

    // Check the empty cart message renders
    expect(find.text('No items in your cart.'), findsOneWidget);
  });
}
