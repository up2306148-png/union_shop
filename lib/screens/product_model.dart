class Product {
  final String title;
  final double price;
  final double? previousPrice;
  final String imageUrl;
  final String description;

  Product({
    required this.title,
    required dynamic price, // accepts double/int or String like "£45.00" for backwards compatibility
    this.previousPrice,
    required this.imageUrl,
    this.description = '',
  }) : price = _parsePrice(price);

  static double _parsePrice(dynamic p) {
    if (p is double) return p;
    if (p is int) return p.toDouble();
    if (p is String) {
      final cleaned = p.replaceAll(RegExp(r'[^\d\.\-]'), '');
      return double.tryParse(cleaned) ?? 0.0;
    }
    return 0.0;
  }
}
