import 'package:flutter/material.dart';

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
      body: Padding(
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
                final route = col['title'] == 'Sale' ? '/sale' : '/collection';
                Navigator.pushNamed(context, route);
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
    );
  }
}
