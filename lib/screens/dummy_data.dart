class Product {
  final String title;
  final double price;
  final double? previousPrice;
  final String imageUrl;
  final String description;

  Product(this.title, this.price, this.imageUrl, {this.previousPrice, this.description = ''});
}

final List<Product> hoodieProducts = [
  Product('Classic Hoodie', 49.99, 'https://via.placeholder.com/400x300?text=Classic+Hoodie',
      previousPrice: 59.99, description: 'Classic comfy hoodie.'),
  Product('Zip-Up Hoodie', 59.99, 'https://via.placeholder.com/400x300?text=Zip-Up+Hoodie',
      previousPrice: 69.99, description: 'Warm zip-up hoodie.'),
  Product('Pullover Hoodie', 44.99, 'https://via.placeholder.com/400x300?text=Pullover+Hoodie',
      previousPrice: 54.99, description: 'Cozy pullover hoodie.'),
];

final List<Product> tshirtProducts = [
  Product('Crewneck Tee', 19.99, 'https://via.placeholder.com/400x300?text=Crewneck+Tee',
      previousPrice: 24.99, description: 'Everyday crewneck tee.'),
  Product('V-Neck Tee', 17.99, 'https://via.placeholder.com/400x300?text=V-Neck+Tee',
      previousPrice: 22.99, description: 'Casual v-neck tee.'),
  Product('Long Sleeve Tee', 24.99, 'https://via.placeholder.com/400x300?text=Long+Sleeve+Tee',
      previousPrice: 29.99, description: 'Long sleeve option.'),
];

final List<Product> accessoryProducts = [
  Product('Baseball Cap', 14.99, 'https://via.placeholder.com/400x300?text=Baseball+Cap',
      previousPrice: 20.00, description: 'Adjustable cap.'),
  Product('Beanie', 12.99, 'https://via.placeholder.com/400x300?text=Beanie',
      previousPrice: 18.00, description: 'Warm beanie.'),
  Product('Socks Pack', 9.99, 'https://via.placeholder.com/400x300?text=Socks+Pack',
      previousPrice: 12.00, description: 'Comfort pack of socks.'),
  Product('Keychain', 4.99, 'https://via.placeholder.com/400x300?text=Keychain',
      previousPrice: 6.99, description: 'Union keychain.'),
];

final List<Product> giftProducts = [
  Product('Gift Card \$25', 25.00, 'https://via.placeholder.com/400x300?text=Gift+Card+25',
      previousPrice: 25.00, description: 'Gift card for purchases.'),
  Product('Gift Box', 29.99, 'https://via.placeholder.com/400x300?text=Gift+Box',
      previousPrice: 34.99, description: 'Presentation gift box.'),
  Product('Mug', 12.50, 'https://via.placeholder.com/400x300?text=Mug',
      previousPrice: 15.00, description: 'Union logo mug.'),
];
