import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/helper/navigation/navigation_helper.dart';
import 'package:flutter_boilerplate/gen/assets.gen.dart';
import 'package:flutter_boilerplate/view/screens/signin/signin_screen.dart';
import 'package:flutter_boilerplate/view_model/otp_verification_view_model.dart';
import 'package:provider/provider.dart';

class OTPVerificationScreen extends StatefulWidget {
  static const String name = "otp_verification";
  static const String path = "/$name";

  const OTPVerificationScreen({super.key});

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  var isChecked = false;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    OTPVerificationViewModel otpVerificationViewModel =
        Provider.of<OTPVerificationViewModel>(context, listen: false);

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(
                  color:theme.iconTheme.color,
                  Icons.arrow_back,
                  size: 30,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: _otpVerificationWidget(theme),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _otpVerificationWidget(ThemeData theme){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
      child: Column(
        children: [
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: theme.primaryColor.withOpacity(0.3),
              shape: BoxShape.circle,
            ),
            child: Assets.png.otp3.image(),
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            'Verification',
            style: theme.textTheme.headlineMedium,
          ).tr(),
          const SizedBox(
            height: 10,
          ),
          Text(
            "enter_otp",
            style: theme.textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ).tr(),
          const SizedBox(
            height: 28,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _textFieldOTP(first: true, last: false),
                    _textFieldOTP(first: false, last: false),
                    _textFieldOTP(first: false, last: false),
                    _textFieldOTP(first: false, last: true),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        NavigationHelper.pushNamed(
                            context, SignInScreen.name);
                      }
                    },
                    style: TextButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: const Text("verify").tr(),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          Text(
            "did_not_receive_code",
            style: theme.textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ).tr(),
          const SizedBox(
            height: 18,
          ),
          InkWell(
            onTap: () {
              //work in progress
              /*const snackBar = SnackBar(
                content: Text('Code sent again.'),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);*/
            },
            child: Text(
              "resend_new_code",
              style: theme.textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ).tr(),
          ),
        ],
      ),
    );
  }

  Widget _textFieldOTP({required bool first, last}) {
    return SizedBox(
      height: 85,
      child: AspectRatio(
        aspectRatio: 0.7,
        child: TextField(
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.isEmpty && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counter: const Offstage(),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 2, color: Colors.black12),
                borderRadius: BorderRadius.circular(12)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 2, color: Colors.purple),
                borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
    );
  }
}
