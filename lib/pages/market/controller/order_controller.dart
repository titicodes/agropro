import 'package:get/get.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:uuid/uuid.dart';
import 'package:agropro/data/model/order.dart';

class OrderController extends GetxController {
  RxList<OrderModel> orders = RxList<OrderModel>();

  @override
  void onInit() {
    super.onInit();
    fetchOrders();
  }

  // Fetch orders from the local JSON file
  Future<void> fetchOrders() async {
    try {
      final String response = await rootBundle.loadString('assets/mock/orders.json');
      final List<dynamic> data = json.decode(response);
      orders.value = data.map((order) => OrderModel.fromMap(order)).toList();
    } catch (e) {
      Get.snackbar("Error", "Failed to load orders");
    }
  }

  // Add a new order to the local state
  Future<void> addOrder(OrderModel order) async {
    try {
      orders.add(order); // Update local state
      Get.snackbar("Success", "Order added successfully!");
    } catch (e) {
      Get.snackbar("Error", "Failed to add order");
    }
  }
}
