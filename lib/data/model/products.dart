import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String name;
  final String imageUrl;
  final double price;

  Product({
    required this.name,
    required this.imageUrl,
    required this.price,
  });

  factory Product.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return Product(
      name: data['name'],
      imageUrl: data['imageUrl'],
      price: data['price'],
    );
  }
}
