import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/payment_controller.dart';

class PaymentScreen extends StatelessWidget {
  final PaymentController paymentController = Get.put(PaymentController());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Simulated Payment")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: amountController,
              decoration: InputDecoration(labelText: "Amount"),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                int amount = int.parse(amountController.text);
                String email = emailController.text;

                // Simulate the payment by calling the controller method
                paymentController.makePayment(
                    email: email, amount: amount, orderId: "testOrderId123");
                    
              },
              child: Text("Simulate Payment"),
            ),
          ],
        ),
      ),
    );
  }
}
