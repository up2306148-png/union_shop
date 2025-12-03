import 'package:flutter/material.dart';

class Product {
  final String title;
  final String price;
  final String imageUrl;

  Product({required this.title, required this.price, required this.imageUrl});
}

// Top-level private helper that returns the dummy product list.
List<Product> _getDummyProducts() {
  return [
    Product(title: 'Product 1', price: '£15.00', imageUrl: 'https://via.placeholder.com/300x300?text=Product+1'),
    Product(title: 'Product 2', price: '£20.00', imageUrl: 'https://via.placeholder.com/300x300?text=Product+2'),
    Product(title: 'Product 3', price: '£25.00', imageUrl: 'https://via.placeholder.com/300x300?text=Product+3'),
    Product(title: 'Product 4', price: '£18.00', imageUrl: 'https://via.placeholder.com/300x300?text=Product+4'),
  ];
}

class CollectionDetailScreen extends StatefulWidget {
  final String title;
  final List<Product> products;

  // Accept an optional products list; default to the dummy list so existing callers continue to work.
  CollectionDetailScreen({
    super.key,
    this.title = 'Collection Detail',
    List<Product>? products,
  }) : products = products ?? _getDummyProducts();

  @override
  State<CollectionDetailScreen> createState() => _CollectionDetailScreenState();
}

class _CollectionDetailScreenState extends State<CollectionDetailScreen> {
  String sortBy = 'Recommended';

  @override
  Widget build(BuildContext context) {
    // use widget.products directly (do not create a local products variable)

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: const Color(0xFF4d2963),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
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
                  // Filter Chips Row
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        FilterChip(
                          label: const Text('All'),
                          onSelected: (value) {},
                        ),
                        const SizedBox(width: 8),
                        FilterChip(
                          label: const Text('Hoodies'),
                          onSelected: (value) {},
                        ),
                        const SizedBox(width: 8),
                        FilterChip(
                          label: const Text('T-Shirts'),
                          onSelected: (value) {},
                        ),
                        const SizedBox(width: 8),
                        FilterChip(
                          label: const Text('Accessories'),
                          onSelected: (value) {},
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Sorting Status
                  if (sortBy != 'Recommended')
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Text(
                        sortBy == 'Price: Low to High'
                            ? 'Sorting: Low to High'
                            : 'Sorting: High to Low',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  // Products Grid
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: MediaQuery.of(context).size.width > 600 ? 2 : 1,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 0.8,
                      children: List.generate(widget.products.length, (index) {
                        final product = widget.products[index];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Image.network(
                                product.imageUrl,
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
                              product.title,
                              style: const TextStyle(fontSize: 14, color: Colors.black),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              product.price,
                              style: const TextStyle(fontSize: 13, color: Colors.grey),
                            ),
                            const SizedBox(height: 8),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/product');
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                              ),
                              child: const Text(
                                'View Product',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF4d2963),
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Footer
          Container(
            width: double.infinity,
            color: Colors.grey[50],
            padding: const EdgeInsets.all(24),
            child: const Text(
              'Placeholder Footer',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

