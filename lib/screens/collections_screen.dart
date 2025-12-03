import 'package:flutter/material.dart';

// Product model and sample lists
class Product {
  final String title;
  final double price;
  final String imageUrl;

  Product(this.title, this.price, this.imageUrl);
}

final List<Product> hoodieProducts = [
  Product('Classic Hoodie', 49.99, 'https://via.placeholder.com/400x300?text=Classic+Hoodie'),
  Product('Zip-Up Hoodie', 59.99, 'https://via.placeholder.com/400x300?text=Zip-Up+Hoodie'),
  Product('Pullover Hoodie', 44.99, 'https://via.placeholder.com/400x300?text=Pullover+Hoodie'),
];

final List<Product> tshirtProducts = [
  Product('Crewneck Tee', 19.99, 'https://via.placeholder.com/400x300?text=Crewneck+Tee'),
  Product('V-Neck Tee', 17.99, 'https://via.placeholder.com/400x300?text=V-Neck+Tee'),
  Product('Long Sleeve Tee', 24.99, 'https://via.placeholder.com/400x300?text=Long+Sleeve+Tee'),
];

final List<Product> accessoryProducts = [
  Product('Baseball Cap', 14.99, 'https://via.placeholder.com/400x300?text=Baseball+Cap'),
  Product('Beanie', 12.99, 'https://via.placeholder.com/400x300?text=Beanie'),
  Product('Socks Pack', 9.99, 'https://via.placeholder.com/400x300?text=Socks+Pack'),
  Product('Keychain', 4.99, 'https://via.placeholder.com/400x300?text=Keychain'),
];

final List<Product> giftProducts = [
  Product('Gift Card \$25', 25.00, 'https://via.placeholder.com/400x300?text=Gift+Card+25'),
  Product('Gift Box', 29.99, 'https://via.placeholder.com/400x300?text=Gift+Box'),
  Product('Mug', 12.50, 'https://via.placeholder.com/400x300?text=Mug'),
];

class CollectionsScreen extends StatelessWidget {
  const CollectionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final collections = [
      {'title': 'Hoodies', 'image': 'https://via.placeholder.com/400x300?text=Hoodies'},
      {'title': 'T-Shirts', 'image': 'https://via.placeholder.com/400x300?text=T-Shirts'},
      {'title': 'Accessories', 'image': 'https://via.placeholder.com/400x300?text=Accessories'},
      {'title': 'Gifts', 'image': 'https://via.placeholder.com/400x300?text=Gifts'},
      {'title': 'Sale', 'image': 'https://via.placeholder.com/400x300?text=Sale'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Collections'),
        backgroundColor: const Color(0xFF4d2963),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.9,
                children: List.generate(collections.length, (index) {
                  final col = collections[index];
                  return GestureDetector(
                    onTap: () {
                      // Select the route and optionally a product list to pass
                      if (col['title'] == 'Sale') {
                        Navigator.pushNamed(context, '/sale');
                        return;
                      }

                      List<Product> productsToPass;
                      switch (col['title']) {
                        case 'Hoodies':
                          productsToPass = hoodieProducts;
                          break;
                        case 'T-Shirts':
                          productsToPass = tshirtProducts;
                          break;
                        case 'Accessories':
                          productsToPass = accessoryProducts;
                          break;
                        case 'Gifts':
                          productsToPass = giftProducts;
                          break;
                        default:
                          productsToPass = [];
                      }

                      Navigator.pushNamed(
                        context,
                        '/collection',
                        arguments: productsToPass,
                      );
                    },
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      elevation: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: Image.network(
                              col['image']!,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: Colors.grey[200],
                                  child: const Center(
                                    child: Icon(Icons.image_not_supported, color: Colors.grey),
                                  ),
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              col['title']!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
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
