class Product {
  final String title;
  final double price;
  final double? previousPrice;
  final String imageUrl;
  final String description;

  Product(this.title, this.price, this.imageUrl, {this.previousPrice, this.description = ''});
}

final List<Product> hoodieProducts = [
  Product(
    'Classic Hoodie',
    49.99,
    'https://img.sonofatailor.com/images/customizer/product/hoodie-2/Black.jpg',
    previousPrice: 59.99,
    description: 'Classic comfy hoodie.',
  ),
  Product('Zip-Up Hoodie', 59.99, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcpVsHRaf1Gget2cUP6MzYD_K4GjpQNjf4fw&s',
      previousPrice: 69.99, description: 'Warm zip-up hoodie.'),
  Product('Pullover Hoodie', 44.99, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyfzoKcSsDf0qcHOZOzFPhQu-mD3Juu0GbZA&s',
      previousPrice: 54.99, description: 'Cozy pullover hoodie.'),
];


final List<Product> tshirtProducts = [
  Product('Crewneck Tee', 19.99, 'https://m.media-amazon.com/images/I/61xVh4j40iL._AC_SL1200_.jpg',
      previousPrice: 24.99, description: 'Everyday crewneck tee.'),
  Product('V-Neck Tee', 17.99, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHyrii-wyK01TXxctYtwtdVgt5ygQVDd-__g&s',
      previousPrice: 22.99, description: 'Casual v-neck tee.'),
  Product('Long Sleeve Tee', 24.99, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSz794sMs4R_0oM4qvvW4fyueLHq2lSDuN1tg&s',
      previousPrice: 29.99, description: 'Long sleeve option.'),
];

final List<Product> accessoryProducts = [
  Product('Baseball Cap', 14.99, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQq8LTsnsHHLSzRhlSxL58OBAmgEH0H-GpzVw&s',
      previousPrice: 20.00, description: 'Adjustable cap.'),
  Product('Beanie', 12.99, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTO76PjOFvezsHRiKSKx7haYhqczU2aYCS1pQ&s',
      previousPrice: 18.00, description: 'Warm beanie.'),
  Product('Socks Pack', 9.99, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcROQ1xIWGhb75fjezelcVc_haAPAG7T_Th22w&s',
      previousPrice: 12.00, description: 'Comfort pack of socks.'),
  Product('Keychain', 4.99, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTd981b8ShhwTMpVJ3V1-wXCrxkJaUZPrnO2g&s',
      previousPrice: 6.99, description: 'Union keychain.'),
];

final List<Product> giftProducts = [
  Product('Gift Card \$25', 25.00, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcROv-XY2kXyp0oypBdQbc7s2HXGx1uEcF0djA&s',
      previousPrice: 25.00, description: 'Gift card for purchases.'),
  Product('Gift Box', 29.99, 'https://www.crystalmailing.co.uk/cdn/shop/files/GBwithRibbonRed_50e98f4f-9d98-4bcd-af08-ff468d951ecc.jpg?v=1688652116',
      previousPrice: 34.99, description: 'Presentation gift box.'),
  Product('Mug', 12.50, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0Y4xVf9Rboau85q1fGzNht4SJCjPn5Dm2rA&s',
      previousPrice: 15.00, description: 'Union logo mug.'),
];
