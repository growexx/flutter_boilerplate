import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/constant/environment.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripePaymentScreen extends StatelessWidget {
  static const String name = "stripe-payment";
  static const String path = "/$name";

  Future<Map> _createTestPaymentSheet() {
    Map paymentIntent = {
      "id": "pi_1GszpY2eZvKYlo2Cpmq1EzO4",
      "object": "payment_intent",
      "amount": 1000,
      "amount_capturable": 0,
      "amount_details": {"tip": {}},
      "amount_received": 0,
      "application": null,
      "application_fee_amount": null,
      "automatic_payment_methods": null,
      "canceled_at": null,
      "cancellation_reason": null,
      "capture_method": "automatic",
      "client_secret":
          'sk_test_51NaFctSFxHeE10ClKFYi4LL5SE7gLihXIllcnRQTOW5kDYiMsg5yIdQANwqQXOtJRSqU1Ij5j4jizb0wSGKM3epq006BapnXAF',
      "confirmation_method": "automatic",
      "created": 1591918148,
      "currency": "usd",
      "customer": null,
      "description": "Created by stripe.com/docs demo",
      "invoice": null,
      "last_payment_error": null,
      "latest_charge": null,
      "livemode": false,
      "metadata": {},
      "next_action": null,
      "on_behalf_of": null,
      "payment_method": null,
      "payment_method_options": {
        "card": {
          "installments": null,
          "mandate_options": null,
          "network": null,
          "request_three_d_secure": "automatic"
        }
      },
      "payment_method_types": ["card"],
      "processing": null,
      "receipt_email": null,
      "redaction": null,
      "review": null,
      "setup_future_usage": null,
      "shipping": null,
      "statement_descriptor": null,
      "statement_descriptor_suffix": null,
      "status": "requires_payment_method",
      "transfer_data": null,
      "transfer_group": null
    };
    Map<String, dynamic> data = {
      "paymentIntent": paymentIntent.toString(),
      "epiphermalKey": "epipheralKey",
      "customerId": "customerId"
    };
    return Future.value(data);
  }

  Future<void> _handlePayment() async {
    try {
      final data = await _createTestPaymentSheet();
      await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: const SetupPaymentSheetParameters(
        customFlow: true,
        merchantDisplayName: 'Flutter Stripe Store Demo',
        paymentIntentClientSecret:
            'pi_3M6V89SCAXtREmcD1UrF9nxl_secret_4e9MuunpP7sHtVSB5gbQTnz3g',
        customerEphemeralKeySecret: 'ek_test_YWNjdF8xTEE2WXdTQ0FYdFJFbWNELFBlZG1aTHZQbjBaQUdGOUNiandUM2ZrR2FzOGJkTXc_006vE4rbtP',
        customerId: 'customerId',
      ));
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
