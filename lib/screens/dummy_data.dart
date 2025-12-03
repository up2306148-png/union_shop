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
