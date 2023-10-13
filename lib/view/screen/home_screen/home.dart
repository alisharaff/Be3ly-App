import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../../data/model/product.dart';
import 'ProductList.dart';

// FirebaseService to getProducts
class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Product>> getProducts() async {
    final QuerySnapshot snapshot =
        await _firestore.collection('products').get();
    return snapshot.docs
        .map((doc) =>
            Product.fromMap(doc.data() as Map<String, dynamic>, doc.id))
        .toList();
  }
}

class BannerSlider extends StatelessWidget {
  final List<String> banners;

  BannerSlider({required this.banners});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: banners.map((bannerUrl) {
        return Image.network(bannerUrl);
      }).toList(),
      options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: true,
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final FirebaseService firebaseService = FirebaseService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      // appBar: AppBar(
      //   title: Text('Ecommerce App'),
      // ),
      body: FutureBuilder<List<Product>>(
        future: firebaseService.getProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No products available.'));
          } else {
            final products = snapshot.data!;
            final banners = [
              "https://img.freepik.com/free-vector/shopping-time-banner-with-realistic-map-cart-gift-bags-vector-illustration_548887-120.jpg",
              "https://img.freepik.com/free-vector/shopping-time-banner-with-realistic-map-cart-gift-bags-vector-illustration_548887-120.jpg",
              "https://img.freepik.com/free-vector/shopping-time-banner-with-realistic-map-cart-gift-bags-vector-illustration_548887-120.jpg"
            ]; // Replace with actual banner URLs

            return SingleChildScrollView(
              child: Column(
                children: [
                  BannerSlider(banners: banners),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text(
                        "Sale",
                        style: TextStyle(
                          letterSpacing: 0.5,
                          fontSize: 30, // Customize the font size
                          fontWeight:
                              FontWeight.w500, // Customize the font weight
                        ),
                      ),
                    ),
                  ),
                    const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text(
                        "Super Summer Sale",
                        style: TextStyle(
                          fontSize: 16, // Customize the font size
                          fontWeight:
                              FontWeight.w100, // Customize the font weight
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                      height: 300,
                      // width: 200,
                      child: ProductList(products: products)),
                ],
              ),
            );
          }
        },
      ),
    ));
  }
}
