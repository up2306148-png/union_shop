import 'package:flutter/material.dart';
import 'dummy_data.dart';
import 'package:union_shop/widgets/footer.dart';
import 'package:union_shop/widgets/header.dart'; // added import

class CollectionsScreen extends StatelessWidget {
  const CollectionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final collections = [
      {'title': 'Hoodies', 'image': 'https://img.sonofatailor.com/images/customizer/product/hoodie-2/Black.jpg'},
      {'title': 'T-Shirts', 'image': 'https://i.postimg.cc/y7yB6V6H/t-shirt.jpg'},
      {'title': 'Accessories', 'image': 'data:image/jpeg;base64,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'},
      {'title': 'Gifts', 'image': 'https://t3.ftcdn.net/jpg/05/48/89/72/360_F_548897270_9egkvOw8SwoSTHlon47RzUIszsYGmN8K.jpg'},
      {'title': 'Sale', 'image': 'https://via.placeholder.com/400x300?text=Sale'},
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Header(),

            // Added centered COLLECTIONS title below Header and above the back button
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0),
              child: Center(
                child: Text(
                  'COLLECTIONS',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ),

            // Back button moved to be directly after the Header (above the collection images)
            // Make the back button flush to the left edge and remove default IconButton padding
            Container(
              width: double.infinity,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 4.0, top: 6.0),
              child: IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(minWidth: 0, minHeight: 0),
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),
            ),

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
