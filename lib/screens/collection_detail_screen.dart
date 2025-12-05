import 'package:flutter/material.dart';
import 'package:union_shop/widgets/header.dart';
import 'dummy_data.dart';
import 'package:union_shop/widgets/footer.dart';

// Top-level private helper that returns the dummy product list.
List<Product> _getDummyProducts() {
  return [
    Product('Product 1', 15.00, 'https://via.placeholder.com/300x300?text=Product+1'),
    Product('Product 2', 20.00, 'https://via.placeholder.com/300x300?text=Product+2'),
    Product('Product 3', 25.00, 'https://via.placeholder.com/300x300?text=Product+3'),
    Product('Product 4', 18.00, 'https://via.placeholder.com/300x300?text=Product+4'),
  ];
}

class CollectionDetailScreen extends StatefulWidget {
  final String title;
  final List<Product> products;

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

    // --- SAFE SORTING LOGIC (executed before building the UI) ---
    if (sortBy == 'Price: Low to High') {
      widget.products.sort((a, b) => a.price.compareTo(b.price));
    } else if (sortBy == 'Price: High to Low') {
      widget.products.sort((a, b) => b.price.compareTo(a.price));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: const Color(0xFF4d2963),
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Header(),

              // Back button
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: const Icon(Icons.arrow_back, color: Color(0xFF4d2963)),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),

              // Sort Row
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

              // Filter chips (not active yet)
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

              // Sorting status text
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

              // Product Grid
              GridView.count(
                crossAxisCount: MediaQuery.of(context).size.width > 600 ? 2 : 1,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.8,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
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
                        '£${product.price.toStringAsFixed(2)}',
                        style: const TextStyle(fontSize: 13, color: Colors.grey),
                      ),
                      const SizedBox(height: 8),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/product', arguments: product);
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

              const SizedBox(height: 16),

              const Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
