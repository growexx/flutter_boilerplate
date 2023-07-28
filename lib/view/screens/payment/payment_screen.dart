import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/constant/payment_config.dart';
import 'package:pay/pay.dart';
import 'package:flutter/foundation.dart';

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
  return Scaffold(
    body: Center(
      child: _buildApplePayButton(),
    ),
  );
 }

Widget _buildApplePayButton() {
  if (defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.macOS)
    return ApplePayButton(
      paymentConfiguration: PaymentConfiguration.fromJsonString(defaultApplePay),
      paymentItems: _paymentItems,
      style: ApplePayButtonStyle.black,
      type: ApplePayButtonType.buy,
      margin: const EdgeInsets.only(top: 25.0),
      onPaymentResult: onApplePayResult,
      loadingIndicator: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  } else {
    return Container();
  }
 }
}
void onApplePayResult(paymentResult) {
}