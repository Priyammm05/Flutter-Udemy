// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentGateway extends GetxController {
  Razorpay? razorpay;

  @override
  void onInit() {
    razorpay = Razorpay();
    razorpay!.on(Razorpay.EVENT_PAYMENT_SUCCESS, handleSuccess);
    razorpay!.on(Razorpay.EVENT_PAYMENT_ERROR, handleError);
    razorpay!.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
    super.onInit();
  }

  void handleError(PaymentFailureResponse paymentFailureResponse) {
    Get.snackbar('Error occurred', paymentFailureResponse.message as String);
  }

  void handleSuccess(PaymentSuccessResponse paymentSuccessResponse) {
    Get.snackbar('Success', paymentSuccessResponse.orderId as String);
  }

  void handleExternalWallet(ExternalWalletResponse externalWalletResponse) {
    Get.snackbar('Error occurred', externalWalletResponse.walletName as String);
  }

  void dispatchPayment(
      double amount, String name, int contact, String email, String wallet) {
    var options = {
      'key': 'rzp_test_yHTJDslNSFxz8i',
      'amount': amount,
      'name': name,
      'description': 'Payment',
      'prefill': {'contact': contact, 'email': email},
      'external': {
        'wallets': [wallet]
      }
    };

    try {
      razorpay!.open(options);
    } catch (e) {
      print(e.toString());
    }
  }
}
