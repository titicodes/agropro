import 'package:get/get.dart';

class CartController extends GetxController {
  var cartItems = <Map>[].obs;
  var totalPrice = 0.0.obs;

  void addToCart(Map product) {
    cartItems.add(product);
    totalPrice.value += product['price'];
  }

  void removeFromCart(Map product) {
    cartItems.remove(product);
    totalPrice.value -= product['price'];
  }

  void clearCart() {
    cartItems.clear();
    totalPrice.value = 0.0;
  }

  void checkout() {
    // Checkout logic, e.g., integrating with a payment gateway
    clearCart();
    Get.snackbar('Checkout Successful', 'Your purchase was completed!',
        snackPosition: SnackPosition.BOTTOM);
  }
}
