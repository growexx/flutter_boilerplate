import 'package:flutter/cupertino.dart';
import 'package:pay/pay.dart';

class PaymentViewModel extends ChangeNotifier {
  final paymentItems = [
    const PaymentItem(
      label: 'Total',
      amount: '99.99',
      status: PaymentItemStatus.final_price,
    )
  ];

  Future<bool> savePaymentDetails(
    paymentResult
  ) async {
    /// Implement Api Call Here
    return true;
  }

}
