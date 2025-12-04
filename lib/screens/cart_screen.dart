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
    // Group identical products by title+price and compute quantities
    final Map<String, int> counts = {};
    final Map<String, Product> representative = {};
    for (final item in cartItems) {
      final key = '${item.title}||${item.price}';
      counts[key] = (counts[key] ?? 0) + 1;
      representative.putIfAbsent(key, () => item);
    }

    // Convert to a list of MapEntry<Product, int> for rendering
    final List<MapEntry<Product, int>> groupedList = counts.entries
        .map((e) => MapEntry(representative[e.key]!, e.value))
        .toList();

    // compute total from grouped entries (price * quantity)
    final double total =
        groupedList.fold(0.0, (sum, e) => sum + e.key.price * e.value);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
        backgroundColor: const Color(0xFF4d2963),
        actions: [
          IconButton(
            tooltip: 'Clear Cart',
            icon: const Icon(Icons.delete_forever),
            onPressed: () {
              setState(() {
                cartItems.clear();
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            // list area (empty message or grouped list)
            Expanded(
              child: cartItems.isEmpty
                  ? const Center(
                      child: Text(
                        'No items in your cart.',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      itemCount: groupedList.length,
                      itemBuilder: (context, index) {
                        final product = groupedList[index].key;
                        final qty = groupedList[index].value;
                        final key = '${product.title}||${product.price}';
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          child: ListTile(
                            title: Text(product.title),
                            subtitle: Text(
                                '£${product.price.toStringAsFixed(2)}  × $qty'),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.remove, color: Colors.red),
                                  onPressed: () {
                                    setState(() {
                                      // remove a single matching item from cartItems
                                      final removeIndex = cartItems.indexWhere((it) =>
                                          '${it.title}||${it.price}' == key);
                                      if (removeIndex != -1) {
                                        cartItems.removeAt(removeIndex);
                                      }
                                    });
                                  },
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 6.0),
                                  child: Text('$qty',
                                      style: const TextStyle(fontSize: 16)),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.add, color: Colors.green),
                                  onPressed: () {
                                    setState(() {
                                      // add one more of this product (use representative instance)
                                      cartItems.add(product);
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),

            const SizedBox(height: 12),

            // total price section (uses grouped total)
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(top: BorderSide(color: Colors.grey.shade300)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '£${total.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
