import 'package:dio/dio.dart';
import 'package:donation_app/utils/dialog_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'links.dart';

class StripeService {
  StripeService._();

  static final StripeService instance = StripeService._();

  Future<void> makePayment(int amount, BuildContext context) async {
    try {
      String? paymentIntentClientSecret = await _createPaymentIntent(
        amount,
        "usd",
      );
      if (paymentIntentClientSecret == null) {
        DialogBox.errorDialogBox(
            context, "Failed to create Payment Intent", "Error");
        return;
      }

      // Initialize the payment sheet
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntentClientSecret,
          merchantDisplayName: "Haider Ali",
        ),
      );

      // Process the payment
      await _processPayment(context); // Pass context to _processPayment
    } catch (e) {
      print('Error in makePayment: $e');
      DialogBox.errorDialogBox(context, "Payment Canceled", "");
    }
  }

  Future<String?> _createPaymentIntent(int amount, String currency) async {
    try {
      final Dio dio = Dio();
      Map<String, dynamic> data = {
        "amount": _calculateAmount(amount),
        "currency": currency,
      };
      var response = await dio.post(
        "https://api.stripe.com/v1/payment_intents",
        data: data,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            "Authorization": "Bearer $stripeSecretKey",
            "Content-Type": 'application/x-www-form-urlencoded',
          },
        ),
      );
      if (response.data != null) {
        return response.data["client_secret"];
      } else {
        print('Response data is null');
        return null;
      }
    } catch (e) {
      print('Error in _createPaymentIntent: $e');
      return null;
    }
  }

  Future<void> _processPayment(BuildContext context) async {
    try {
      // Present and confirm the payment
      await Stripe.instance.presentPaymentSheet();
      await Stripe.instance.confirmPaymentSheetPayment();

      // Ensure dialog is displayed on the main UI thread
      Future.delayed(Duration.zero, () {
        DialogBox.successDialogBox(context, "Payment Successful", "Thank you!");
      });
    } catch (e) {
      print('Error in _processPayment: $e');
      // Show failure dialog in case of an error
      Future.delayed(Duration.zero, () {
        DialogBox.errorDialogBox(
            context, "Payment Failed", "Please try again.");
      });
    }
  }

  String _calculateAmount(int amount) {
    final calculatedAmount = amount * 100; // Stripe expects amount in cents
    return calculatedAmount.toString();
  }
}
