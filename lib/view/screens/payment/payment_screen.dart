import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/constant/payment_config.dart';
import 'package:pay/pay.dart';

const _paymentItems = [
  PaymentItem(
    label: 'Total',
    amount: '99.99',
    status: PaymentItemStatus.final_price,
  )
];

class PaymentScreen extends StatelessWidget {

  static const String name = "payment";
  static const String path = "/$name";

  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: ApplePayButton(
        paymentConfiguration: PaymentConfiguration.fromJsonString(defaultApplePay),
        paymentItems: _paymentItems,
        style: ApplePayButtonStyle.black,
        type: ApplePayButtonType.buy,
        margin: const EdgeInsets.only(top: 25.0),
        onPaymentResult: onApplePayResult,
        loadingIndicator: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
void onApplePayResult(paymentResult) {
  // Send the resulting Apple Pay token to your server / PSP
}