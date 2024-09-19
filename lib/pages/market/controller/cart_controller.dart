import 'package:agropro/data/model/order.dart';
import 'package:agropro/data/services/payment_service.dart';
import 'package:agropro/pages/market/controller/order_controller.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var cartItems = <Map>[].obs;
  var totalPrice = 0.0.obs;

  final MockPaymentService _mockPaymentService = MockPaymentService();

  // Add to Cart
  void addToCart(Map product) {
    cartItems.add(product);
    totalPrice.value += product['price'];
  }

  // Remove from Cart
  void removeFromCart(Map product) {
    cartItems.remove(product);
    totalPrice.value -= product['price'];
  }

  // Clear Cart
  void clearCart() {
    cartItems.clear();
    totalPrice.value = 0.0;
  }

  // Simulated Checkout Process
  void checkout() async {
    Get.snackbar(
        'Processing Payment', 'Please wait while we process your payment...');

    int priceInKobo = (totalPrice.value * 100).toInt(); // Convert price to kobo
    String email = "customer@example.com"; // Mock customer email

    // Simulate the payment
    bool paymentSuccess = await _mockPaymentService.makePayment(
        email: email, amount: priceInKobo);

    if (paymentSuccess) {
      // If payment is successful, place the order
      placeOrder();
    } else {
      // If payment fails
      Get.snackbar('Checkout Failed', 'Transaction could not be completed.',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  // Place Order
  void placeOrder() {
    // Get the OrderController instance using Get.find()
    final OrderController orderController = Get.find<OrderController>();

    // Create a new OrderModel object
    OrderModel newOrder = OrderModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      status: 'pending',
      total: totalPrice.value,
    );

    // Add the order using OrderController
    orderController.addOrder(newOrder);

    Get.snackbar('Order Placed', 'Your order has been successfully placed!',
        snackPosition: SnackPosition.BOTTOM);

    // Clear the cart after placing the order
    clearCart();
  }
}
