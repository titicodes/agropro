import 'package:get/get.dart';

class PaymentController extends GetxController {
  // Simulate the payment process
  Future<void> makePayment({
    required String email,
    required int amount,
    required String orderId,
  }) async {
    // Validate email format (basic validation)
    if (!GetUtils.isEmail(email)) {
      Get.snackbar("Invalid Email", "Please provide a valid email address.");
      return;
    }

    // Validate amount (ensure it's positive)
    if (amount <= 0) {
      Get.snackbar("Invalid Amount", "Amount must be greater than zero.");
      return;
    }

    try {
      // Show a snackbar indicating the payment process has started
      Get.snackbar("Processing Payment", "Please wait...");

      // Simulate a delay for the payment process
      await Future.delayed(Duration(seconds: 2));

      // Simulate a successful payment
      bool paymentSuccess = true;

      if (paymentSuccess) {
        // Payment success logic
        Get.snackbar("Payment Successful", "Your payment of \$${amount / 100} for Order $orderId was successful!",
            snackPosition: SnackPosition.BOTTOM);
      } else {
        // Payment failure logic
        Get.snackbar("Payment Failed", "Transaction failed. Please try again.",
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      // Handle error during the payment process
      Get.snackbar("Error", "An error occurred during payment: ${e.toString()}");
    }
  }
}