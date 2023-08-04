import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/constant/environment.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripePaymentScreen extends StatelessWidget {
  static const String name = "stripe-payment";
  static const String path = "/$name";

  Future<Map> _createTestPaymentSheet() {
    //TODO api call here
    return Future.value({});
  }

  Future<void> _handlePayment() async {
    try {
      final data = await _createTestPaymentSheet();
      // 2. initialize the payment sheet
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          // Enable custom flow
          customFlow: true,
          // Main params
          merchantDisplayName: 'Flutter Stripe Store Demo',
          paymentIntentClientSecret: data['paymentIntent'],
          // Customer keys
          customerEphemeralKeySecret: data['ephemeralKey'],
          customerId: data['customer'],
          // Extra options
          style: ThemeMode.dark,
        ),
      );
      await Stripe.instance.presentPaymentSheet();
      // You can now process the payment with the obtained paymentMethod
      // For example, send the paymentMethod.id to your server and handle the payment on the server-side.
    } catch (e) {
      print('Error: ${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stripe Payment'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _handlePayment,
          child: Text('Make Payment'),
        ),
      ),
    );
  }
}
