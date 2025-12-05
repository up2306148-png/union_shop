import 'package:flutter/material.dart';
import 'package:union_shop/widgets/header.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        backgroundColor: const Color(0xFF4d2963),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          const Header(), // inserted header at the very top of the page content
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'About Union Shop',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      '''Welcome to the Union Shop!
                      
We’re dedicated to giving you the very best University branded products, with a range of clothing and merchandise available to shop all year round! We even offer an exclusive personalisation service!

All online purchases are available for delivery or instore collection!

We hope you enjoy our products as much as we enjoy offering them to you. If you have any questions or comments, please don’t hesitate to contact us at hello@upsu.net.

Happy shopping!

The Union Shop & Reception Team''',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Visit us today to find the perfect item to show your support for your student community!',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF4d2963),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Footer
          Container(
            width: double.infinity,
            color: Colors.grey[50],
            padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Opening Hours
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Opening Hours',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          SizedBox(height: 8),
                          Text('Mon – Fri: 09:00 – 17:00'),
                          Text('Saturday: 10:00 – 16:00'),
                          Text('Sunday: Closed'),
                          SizedBox(height: 8),
                          Text('Address: 123 Union Street'),
                        ],
                      ),
                    ),

                    // Help & Information
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Help & Information',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          SizedBox(height: 8),
                          Text('About us'),
                          Text('Delivery & Returns'),
                          Text('Terms & Conditions'),
                          Text('Privacy Policy'),
                        ],
                      ),
                    ),

                    // Newsletter
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Newsletter',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 8),
                          const Text('Sign up to receive news and offers'),
                          const SizedBox(height: 8),
                          // simple static TextField (no controller required)
                          Container(
                            color: Colors.white,
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                      hintText: 'Enter your email',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF4d2963),
                                  ),
                                  child: const Text('Subscribe'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),
                const Divider(),
                const SizedBox(height: 12),

                // social + payment icons row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.facebook, size: 20, color: Colors.grey),
                        SizedBox(width: 12),
                        // Twitter and Instagram are not available as Icons.* in Material by default.
                        // Use alternative available icons (send / camera) to avoid errors.
                        Icon(Icons.send, size: 20, color: Colors.grey),
                        SizedBox(width: 12),
                        Icon(Icons.camera_alt, size: 20, color: Colors.grey),
                      ],
                    ),
                    Row(
                      children: const [
                        Icon(Icons.credit_card, size: 20, color: Colors.grey),
                        SizedBox(width: 8),
                        Icon(Icons.payment, size: 20, color: Colors.grey),
                        SizedBox(width: 8),
                        Icon(Icons.account_balance_wallet, size: 20, color: Colors.grey),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 12),
                const Center(
                  child: Text(
                    '© 2025 Union Shop',
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
