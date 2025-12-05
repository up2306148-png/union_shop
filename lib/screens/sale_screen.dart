import 'package:flutter/material.dart';
import 'package:union_shop/widgets/footer.dart';
import 'package:union_shop/widgets/header.dart';

// Helper to navigate to the Sale screen using pushReplacementNamed so a duplicate SaleScreen won't be stacked.
void navigateToSale(BuildContext context) {
  Navigator.pushReplacementNamed(context, '/sale');
}

class SaleScreen extends StatelessWidget {
  const SaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final saleProducts = [
      {'title': 'Sale Hoodie', 'original': '£45.00', 'sale': '£29.99', 'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMqZV0qWSxwyYEs4TXQIr1mcK7hZz6BdYWzg&s'},
      {'title': 'Sale T-Shirt', 'original': '£22.00', 'sale': '£14.99', 'image': 'https://via.placeholder.com/300x300?text=Sale+2'},
      {'title': 'Sale Mug', 'original': '£9.99', 'sale': '£6.99', 'image': 'https://via.placeholder.com/300x300?text=Sale+3'},
      {'title': 'Sale Tote Bag', 'original': '£14.99', 'sale': '£9.99', 'image': 'https://via.placeholder.com/300x300?text=Sale+4'},
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Header(), // moved header to the top of the screen

            // Added centered SALE title below Header and above the back button
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0),
              child: Center(
                child: Text(
                  'SALE',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ),

            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.count(
                // Removed Expanded and made the GridView size itself inside the scroll view
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: MediaQuery.of(context).size.width > 600 ? 2 : 1,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.85,
                children: List.generate(saleProducts.length, (index) {
                  final product = saleProducts[index];
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
                      Row(
                        children: [
                          Text(
                            product['original']!,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            product['sale']!,
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                }),
              ),
            ),
            // Footer
            const Footer(),
          ],
        ),
      ),
    );
  }
}
