import 'package:agropro/data/model/order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'market_plaes.dart';

class OrderSummaryScreen extends StatelessWidget {
  final OrderModel order;

  OrderSummaryScreen({required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Summary"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("Order ID: ${order.id}"),
            Text("Status: ${order.status}"),
            Text("Total: \$${order.total}"),
            ElevatedButton(
              onPressed: () {
                // Navigate back to the main marketplace or cart
                Get.offAll(() => MarketPlacesView());
              },
              child: Text("Back to Marketplace"),
            ),
          ],
        ),
      ),
    );
  }
}
