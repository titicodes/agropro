import 'package:agropro/pages/market/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
        backgroundColor: Colors.green,
      ),
      body: GetBuilder<CartController>(
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Cart Items
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.cartItems.length,
                    itemBuilder: (context, index) {
                      var product = controller.cartItems[index];
                      return Card(
                        margin: EdgeInsets.symmetric(vertical: 8.0),
                        child: ListTile(
                          leading: Image.network(
                            product['image_url'],
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                          title: Text(product['name']),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '\$${product['price'].toStringAsFixed(2)}',
                                style: TextStyle(fontSize: 16.0, color: Colors.green),
                              ),
                              SizedBox(height: 4.0),
                              Text(
                                product['description'],
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 14.0, color: Colors.grey[600]),
                              ),
                            ],
                          ),
                          trailing: Text(
                            '\$${product['price'].toStringAsFixed(2)}',
                            style: TextStyle(fontSize: 16.0, color: Colors.green),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                
                // Total Price
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    'Total: \$${controller.totalPrice.value.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                ),
                
                // Checkout Button
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      controller.checkout();
                    },
                    child: Text('Checkout'),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
