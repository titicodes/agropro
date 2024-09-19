import 'dart:math';

class MockPaymentService {
  Future<bool> makePayment({required String email, required int amount}) async {
    // Simulate a network delay
    await Future.delayed(Duration(seconds: 2));

    // Simulate a 90% chance of success and 10% chance of failure
    bool paymentSuccess = Random().nextInt(100) < 90;

    return paymentSuccess;
  }
}
