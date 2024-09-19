import 'package:agropro/pages/market/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductTile extends StatelessWidget {
  final product;
  ProductTile({required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to ProductDetailScreen
        Get.to(() => ProductDetailScreen(product: product));
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.network(
                product['image_url'], // Product image URL from Firestore
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                product['name'],
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '\$${product['price']}',
                style: TextStyle(fontSize: 16.0, color: Colors.green),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                product['description'], // Add product description
                maxLines: 2, // Limit the description to 2 lines
                overflow: TextOverflow.ellipsis, // Ellipsis for overflow
                style: TextStyle(fontSize: 14.0, color: Colors.grey[600]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}