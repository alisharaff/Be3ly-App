import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Product {
  final String id;
  final String name;
  final double price;
  final String imageUrl;
  final double rating;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.rating,
  });
}

class WebDashboard extends StatefulWidget {
  @override
  _WebDashboardState createState() => _WebDashboardState();
}

class _WebDashboardState extends State<WebDashboard> {
  final List<Product> products = [];
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();
  final TextEditingController _ratingController = TextEditingController();

  int _currentIndex = 0; // To keep track of the selected tab

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Dashboard - Web'),
      ),
      body: _currentIndex == 0
          ? _buildAddProductForm()
          : _buildProductList(), // Conditional rendering based on the selected tab
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Change the selected tab
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add Product',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Product List',
          ),
        ],
      ),
    );
  }

  Widget _buildAddProductForm() {
    return Center(
      child: Container(
        width: 400.0,
        padding: EdgeInsets.all(16.0),
        child: Card(
          elevation: 4.0,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'Add Product',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Product Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 12.0),
                TextFormField(
                  controller: _priceController,
                  decoration: InputDecoration(
                    labelText: 'Price (\$)',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 12.0),
                TextFormField(
                  controller: _imageUrlController,
                  decoration: InputDecoration(
                    labelText: 'Image URL',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 12.0),
                TextFormField(
                  controller: _ratingController,
                  decoration: InputDecoration(
                    labelText: 'Rating (0-5)',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: _addProduct,
                  child: Text('Add Product'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProductList() {
    // Replace this with code to display the list of products from Firestore
    return Center(
      child: Text('Product List will be displayed here.'),
    );
  }

  void _addProduct() {
    final newProduct = Product(
      id: UniqueKey().toString(),
      name: _nameController.text,
      price: double.parse(_priceController.text),
      imageUrl: _imageUrlController.text,
      rating: double.parse(_ratingController.text),
    );

    CollectionReference productsCollection =
        FirebaseFirestore.instance.collection('products');

    productsCollection.add({
      'name': newProduct.name,
      'price': newProduct.price,
      'imageUrl': newProduct.imageUrl,
      'rating': newProduct.rating,
    }).then((DocumentReference docRef) {
      final snackBar = SnackBar(
        content: Text('Added successfully'),
        duration: Duration(seconds: 2),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      print('Product added with ID: ${docRef.id}');
    }).catchError((error) {
      final snackBar = SnackBar(
        content: Text('Added failed, try again'),
        duration: Duration(seconds: 2),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      print('Error adding product: $error');
    });

    setState(() {
      products.add(newProduct);
      _nameController.clear();
      _priceController.clear();
      _imageUrlController.clear();
      _ratingController.clear();
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _imageUrlController.dispose();
    _ratingController.dispose();
    super.dispose();
  }
}
