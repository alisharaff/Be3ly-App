import 'package:flutter/material.dart';
import '../../../data/model/product.dart';
class ProductList extends StatelessWidget {
  final List<Product> products;

  ProductList({required this.products});

  void toggleFavorite(Product product) {
    // Toggle the isFavorite property when the button is pressed
    product.isFavorite = !product.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];

        // Calculate the number of stars based on the product's rating
        int numberOfStars = product.rating.round();

        // Create a list of star icons
        List<Icon> starIcons = List.generate(
          5,
          (index) => Icon(
            index < numberOfStars ? Icons.star : Icons.star_border,
            color: Colors.yellow, // You can change the star color here
          ),
        );

        // Wrap the product information in a Card
        return Container(
          width: 200,
          height: 250,
          child: Card(
            elevation: 4,
            margin: EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(
                  product.imageUrl,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
                Text(product.name),
                Text('\$${product.price.toStringAsFixed(2)}'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: starIcons,
                ),
                IconButton(
                  icon: Icon(
                    product.isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: Colors.red, // Customize the favorite icon color
                  ),
                  onPressed: () {
                    // Toggle the favorite status when the button is pressed
                    toggleFavorite(product);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
