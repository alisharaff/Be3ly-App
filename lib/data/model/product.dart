class Product {
  final String id;
  final String name;
  final double price;
  final String imageUrl;
  final double rating;
  bool isFavorite; // Add the isFavorite property

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.rating,
    this.isFavorite = false, // Initialize isFavorite to false
  });

  factory Product.fromMap(Map<String, dynamic> data, String id) {
    return Product(
      id: id,
      name: data['name'],
      price: data['price'].toDouble(),
      imageUrl: data['imageUrl'],
      rating: data['rating'].toDouble(),
      isFavorite: false, // Set isFavorite to false by default
    );
  }
}
