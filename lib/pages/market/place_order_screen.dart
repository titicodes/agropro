import 'package:agropro/data/model/order.dart';
import 'package:agropro/pages/market/order_summary_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/order_controller.dart';
import 'package:uuid/uuid.dart';

class PlaceOrderScreen extends StatelessWidget {
  final OrderController orderController = Get.find();

  final TextEditingController fruitController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Place Order")),
      body: GetBuilder<OrderController>(
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: fruitController,
                  decoration: InputDecoration(labelText: "Fruit Name"),
                ),
                TextField(
                  controller: quantityController,
                  decoration: InputDecoration(labelText: "Quantity"),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Generate a new order
                    String id = Uuid().v4();
                    OrderModel newOrder = OrderModel(
                      id: id,
                      status: 'pending',
                      total: 0.0,
                    );
                    controller.addOrder(newOrder);

                    fruitController.clear();
                    quantityController.clear();

                    // Show a success message
                    Get.snackbar("Order Placed",
                        "Your order has been placed successfully!",
                        snackPosition: SnackPosition.BOTTOM);

                    // Navigate to the Order Summary Screen with the newly created order
                    Get.to(() => OrderSummaryScreen(order: newOrder));
                  },
                  child: Text("Place Order"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
