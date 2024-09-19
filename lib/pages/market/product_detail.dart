import 'package:agropro/pages/market/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ProductDetailScreen extends StatelessWidget {
  final product;
  ProductDetailScreen({required this.product});

  //final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product['name']),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                product['image_url'],
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              product['name'],
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              '\$${product['price']}',
              style: TextStyle(fontSize: 20.0, color: Colors.green),
            ),
            SizedBox(height: 16.0),
            Text(
              product['description'],
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            GetBuilder<CartController>(
              builder: (controller) {
                return ElevatedButton(
                  onPressed: () {
                    controller.addToCart(product);
                    Get.snackbar('Added to Cart', '${product['name']} added to cart!',
                        snackPosition: SnackPosition.BOTTOM);
                  },
                  child: Text('Add to Cart'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}