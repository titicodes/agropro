import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/cart_controller.dart';
import 'place_order_screen.dart'; 

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
                      margin:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                      child: ListTile(
                        leading: Image.network(product['image_url']),
                        title: Text(product['name']),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '\$${product['price']}',
                              style: TextStyle(
                                  fontSize: 16.0, color: Colors.green),
                            ),
                            SizedBox(
                                height:
                                    4.0), 
                            Text(
                              product['description'], 
                              maxLines: 2, 
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 14.0, color: Colors.grey[600]),
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
                  // Navigate to the PlaceOrderScreen
                  Get.to(() => PlaceOrderScreen());
                },
                child: Text('Place Order'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              ),
              ElevatedButton(
                onPressed: () {
                  controller
                      .checkout(); // Checkout button will simulate payment
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
