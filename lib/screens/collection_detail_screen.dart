import 'package:flutter/material.dart';

class CollectionDetailScreen extends StatefulWidget {
  final String title;

  const CollectionDetailScreen({super.key, this.title = 'Collection Detail'});

  @override
  State<CollectionDetailScreen> createState() => _CollectionDetailScreenState();
}

class _CollectionDetailScreenState extends State<CollectionDetailScreen> {
  String sortBy = 'Recommended';

  @override
  Widget build(BuildContext context) {
    final products = [
      {'title': 'Product 1', 'price': '£15.00', 'image': 'https://via.placeholder.com/300x300?text=Product+1'},
      {'title': 'Product 2', 'price': '£20.00', 'image': 'https://via.placeholder.com/300x300?text=Product+2'},
      {'title': 'Product 3', 'price': '£25.00', 'image': 'https://via.placeholder.com/300x300?text=Product+3'},
      {'title': 'Product 4', 'price': '£18.00', 'image': 'https://via.placeholder.com/300x300?text=Product+4'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: const Color(0xFF4d2963),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Sort by Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Sort by:',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                DropdownButton<String>(
                  value: sortBy,
                  items: const [
                    DropdownMenuItem(value: 'Recommended', child: Text('Recommended')),
                    DropdownMenuItem(value: 'Price: Low to High', child: Text('Price: Low to High')),
                    DropdownMenuItem(value: 'Price: High to Low', child: Text('Price: High to Low')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      sortBy = value ?? 'Recommended';
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Products Grid
            Expanded(
              child: GridView.count(
                crossAxisCount: MediaQuery.of(context).size.width > 600 ? 2 : 1,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.8,
                children: List.generate(products.length, (index) {
                  final product = products[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Image.network(
                          product['image']!,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey[300],
                              child: const Center(
                                child: Icon(Icons.image_not_supported, color: Colors.grey),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        product['title']!,
                        style: const TextStyle(fontSize: 14, color: Colors.black),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        product['price']!,
                        style: const TextStyle(fontSize: 13, color: Colors.grey),
                      ),
                    ],
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
