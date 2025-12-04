import 'package:flutter/material.dart';
import 'dummy_data.dart';
import 'package:union_shop/widgets/footer.dart';
import 'package:union_shop/widgets/header.dart'; // added import

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Header(),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: GridView.count(
                // Removed Expanded and made the GridView size itself inside the scroll view
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
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
            // Footer
            const Footer(),
          ],
        ),
      ),
    );
  }
}
