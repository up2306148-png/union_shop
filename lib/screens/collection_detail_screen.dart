import 'package:flutter/material.dart';

class CollectionDetailScreen extends StatelessWidget {
  final String title;

  const CollectionDetailScreen({super.key, this.title = 'Collection Detail'});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: const Color(0xFF4d2963),
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Text(
            'Collection details will appear here. This is a placeholder screen.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
        ),
      ),
    );
  }
}
