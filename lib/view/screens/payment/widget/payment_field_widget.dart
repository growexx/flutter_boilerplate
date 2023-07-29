import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/authentication/user_repository.dart';
import 'package:flutter_boilerplate/view/screens/payment/payment_configurations.dart';
import 'package:flutter_boilerplate/view_model/google_signin_view_model.dart';
import 'package:flutter_boilerplate/view_model/payment_view_model.dart';
import 'package:pay/pay.dart';
import 'dart:io';

class PaymentFieldWidget extends StatefulWidget {
  final PaymentViewModel viewModel;
  final GoogleSigninViewModel googleSignInViewModel;
  final UserRepository userRepository;

  const PaymentFieldWidget(
      {super.key,
      required this.viewModel,
      required this.googleSignInViewModel,
      required this.userRepository});

  @override
  State<PaymentFieldWidget> createState() => _PaymentFieldWidgetState();
}

class _PaymentFieldWidgetState extends State<PaymentFieldWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    var applePayButton = ApplePayButton(
      paymentConfiguration: PaymentConfiguration.fromJsonString(
          defaultApplePay),
      paymentItems: widget.viewModel.paymentItems,
      style: ApplePayButtonStyle.black,
      type: ApplePayButtonType.buy,
      margin: const EdgeInsets.only(top: 15.0),
      onPaymentResult: onApplePayResult,
      loadingIndicator: const Center(
        child: CircularProgressIndicator(),
      ),
    );

    var googlePayButton =  GooglePayButton(
      paymentConfiguration: PaymentConfiguration.fromJsonString(
          defaultGooglePay),
      paymentItems: widget.viewModel.paymentItems,
      type: GooglePayButtonType.pay,
      margin: const EdgeInsets.only(top: 15.0),
      onPaymentResult: onGooglePayResult,
      loadingIndicator: const Center(
        child: CircularProgressIndicator(),
      ),
    );

    return Center(
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              child: Builder(builder: (ctx) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      key: const Key("pay_now"),
                      "pay_now",
                      style: theme.textTheme.headlineMedium,
                    ).tr(),
                    const SizedBox(
                      height: 20,
                    ),
                    Platform.isIOS ? applePayButton : googlePayButton
                  ],
                );
              }),
            ),
          ),
        ),
      ),
    );
  }

  void onApplePayResult(paymentResult) {
    // Send the resulting Apple Pay token to your server / PSP
    widget.viewModel.savePaymentDetails(paymentResult);
  }

  void onGooglePayResult(paymentResult) {
    // Send the resulting Google Pay token to your server / PSP
    widget.viewModel.savePaymentDetails(paymentResult);
  }
}
