import 'package:flutter/material.dart';
import 'package:union_shop/screens/dummy_data.dart';
import 'package:union_shop/product_page.dart';
import 'package:union_shop/screens/collections_screen.dart';
import 'package:union_shop/screens/collection_detail_screen.dart';
import 'package:union_shop/screens/about_us.dart';
import 'package:union_shop/screens/sale_screen.dart';
import 'package:union_shop/screens/sign_in_screen.dart';
import 'package:union_shop/screens/cart_screen.dart';
import 'package:union_shop/widgets/footer.dart'; // added import
import 'package:union_shop/widgets/header.dart'; // import the new Header widget


void main() {
  runApp(const UnionShopApp());
}

class UnionShopApp extends StatelessWidget {
  const UnionShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Union Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4d2963)),
      ),
      home: const HomeScreen(),
      // By default, the app starts at the '/' route, which is the HomeScreen
      initialRoute: '/',
      // When navigating to '/product', build and return the ProductPage
      // In your browser, try this link: http://localhost:49856/#/product
      routes: {
        '/product': (context) => ProductPage(),
        '/about': (context) => const AboutUsScreen(),
        '/signin': (context) => const SignInScreen(),
        '/collections': (context) => const CollectionsScreen(),
        '/collection': (context) {
          // Safely obtain route arguments and validate type
          final args = ModalRoute.of(context)?.settings.arguments;
          final products = args is List<Product> ? args : null;
          return CollectionDetailScreen(products: products);
        },
        '/sale': (context) => const SaleScreen(),
        '/cart': (context) => CartScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  void navigateToProduct(BuildContext context) {
    Navigator.pushNamed(context, '/product');
  }

  void placeholderCallbackForButtons() {
    // This is the event handler for buttons that don't work yet
  }

  void openMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('About Us'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/about');
              },
            ),
            ListTile(
              title: const Text('Collections'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/collections');
              },
            ),
            ListTile(
              title: const Text('Sale'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/sale');
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Replaced the custom header Container with the shared Header widget
            const Header(),

            // Centered hero with title, subtitle and CTA
            SizedBox(
              width: double.infinity,
              child: Container(
                height: 320,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  // dark overlay
                  decoration: BoxDecoration(color: Colors.black.withOpacity(0.45)),
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 900),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'Essential Range - Over 20% OFF!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 38, // increased to match real site
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              height: 1.05,
                            ),
                          ),
                          const SizedBox(height: 18), // more vertical spacing for subtitle
                          const Text(
                            "Over 20% off our essential range. Come and grab yours while stock lasts!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              height: 1.4,
                            ),
                          ),
                          const SizedBox(height: 12), // button closer to the text
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/collections');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF4d2963),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            child: const Text(
                              'BROWSE COLLECTION',
                              style: TextStyle(fontSize: 14, letterSpacing: 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
 
            // Products Section
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  children: [
                    const Text(
                      'Featured Products',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 48),
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount:
                          MediaQuery.of(context).size.width > 600 ? 2 : 1,
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 48,
                      children: [
                        ProductCard(
                          product: Product(
                            'Union Classic Hoodie',
                            45.00,
                            'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                            previousPrice: 49.99,
                            description: 'Classic comfy hoodie.',
                          ),
                        ),
                        ProductCard(
                          product: Product(
                            'Union Heritage T-Shirt',
                            22.00,
                            'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                            previousPrice: 24.99,
                            description: 'Heritage style t-shirt.',
                          ),
                        ),
                        ProductCard(
                          product: Product(
                            'Union Logo Mug',
                            9.99,
                            'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                            previousPrice: 12.50,
                            description: 'Ceramic logo mug.',
                          ),
                        ),
                        ProductCard(
                          product: Product(
                            'Union Campus Tote Bag',
                            14.99,
                            'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                            previousPrice: 18.00,
                            description: 'Durable campus tote bag.',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
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

class ProductCard extends StatefulWidget {
  final Product product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/product', arguments: widget.product);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.network(
              widget.product.imageUrl,
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
          // simplified details: only title and price
          const SizedBox(height: 8),
          Text(
            widget.product.title,
            style: const TextStyle(fontSize: 14, color: Colors.black),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            '£${widget.product.price.toStringAsFixed(2)}',
            style: const TextStyle(fontSize: 13, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

