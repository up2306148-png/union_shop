import 'package:flutter/material.dart';
import 'package:union_shop/screens/cart_state.dart';
import 'package:union_shop/screens/dummy_data.dart'; // for Product type (optional)

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
        backgroundColor: const Color(0xFF4d2963),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: cartItems.isEmpty
            ? const Center(
                child: Text(
                  'No items in your cart.',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              )
            : ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final Product item = cartItems[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    child: ListTile(
                      title: Text(item.title),
                      subtitle: Text('£${item.price.toStringAsFixed(2)}'),
                      trailing: TextButton(
                        onPressed: () {
                          setState(() {
                            cartItems.removeAt(index);
                          });
                        },
                        child: const Text(
                          'Remove',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
