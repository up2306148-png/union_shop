import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  void placeholderCallbackForButtons() {
    // placeholder for non-functional buttons
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
    return Container(
      height: 120,
      color: Colors.white,
      child: Column(
        children: [
          // Top announcement bar (purple)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 6),
            color: const Color(0xFF4d2963),
            child: const Text(
              'Welcome to Union Shop',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
          // Center row with SALE and ABOUT
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    navigateToHome(context);
                  },
                  child: const Text(
                    'HOME',
                    style: TextStyle(color: Color(0xFF4d2963)),
                  ),
                ),
                const SizedBox(width: 16),

                // Added COLLECTIONS button
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/collections');
                  },
                  child: const Text(
                    'COLLECTIONS',
                    style: TextStyle(color: Color(0xFF4d2963)),
                  ),
                ),
                const SizedBox(width: 16),

                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/sale');

                  },
                  child: const Text(
                    'SALE',
                    style: TextStyle(color: Color(0xFF4d2963)),
                  ),
                ),
                const SizedBox(width: 16),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/about');
                  },
                  child: const Text(
                    'ABOUT',
                    style: TextStyle(color: Color(0xFF4d2963)),
                  ),
                ),
              ],
            ),
          ),
          // Main header row with logo and icons
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      navigateToHome(context);
                    },
                    child: Image.network(
                      'https://shop.upsu.net/cdn/shop/files/upsu_300x300.png?v=1614735854',
                      height: 36,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[300],
                          width: 28,
                          height: 28,
                          child: const Center(
                            child: Icon(Icons.image_not_supported,
                                color: Colors.grey),
                          ),
                        );
                      },
                    ),
                  ),
                  const Spacer(),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 600),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.search,
                            size: 18,
                            color: Colors.grey,
                          ),
                          padding: const EdgeInsets.all(4),
                          constraints: const BoxConstraints(
                            minWidth: 36,
                            minHeight: 36,
                          ),
                          onPressed: placeholderCallbackForButtons,
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.person_outline,
                            size: 18,
                            color: Colors.grey,
                          ),
                          padding: const EdgeInsets.all(4),
                          constraints: const BoxConstraints(
                            minWidth: 36,
                            minHeight: 36,
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/signin');
                          },
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.shopping_bag_outlined,
                            size: 18,
                            color: Colors.grey,
                          ),
                          padding: const EdgeInsets.all(4),
                          constraints: const BoxConstraints(
                            minWidth: 36,
                            minHeight: 36,
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/cart');
                          },
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.menu,
                            size: 18,
                            color: Colors.grey,
                          ),
                          padding: const EdgeInsets.all(4),
                          constraints: const BoxConstraints(
                            minWidth: 36,
                            minHeight: 36,
                          ),
                          onPressed: () {
                            openMenu(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
