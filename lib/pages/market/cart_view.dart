import 'package:agropro/pages/market/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        backgroundColor: Colors.green,
      ),
      body: GetBuilder<CartController>(
        builder: (controller) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: controller.cartItems.length,
                  itemBuilder: (context, index) {
                    var product = controller.cartItems[index];
                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                      child: ListTile(
                        leading: Image.network(product['image_url']),
                        title: Text(product['name']),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('\$${product['price']}', style: TextStyle(fontSize: 16.0, color: Colors.green)),
                            SizedBox(height: 4.0), // Space between price and description
                            Text(
                              product['description'], // Add product description
                              maxLines: 2, // Limit to 2 lines
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 14.0, color: Colors.grey[600]),
                            ),
                          ],
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.remove_circle),
                          onPressed: () {
                            controller.removeFromCart(product);
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Total: \$${controller.totalPrice}',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  controller.checkout();
                },
                child: Text('Checkout'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              ),
            ],
          );
        },
      ),
    );
  }
}