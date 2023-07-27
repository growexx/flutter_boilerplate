import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/helper/navigation/navigation_helper.dart';
import 'package:flutter_boilerplate/app_manager/helper/validation_helper.dart';
import 'package:flutter_boilerplate/gen/assets.gen.dart';
import 'package:flutter_boilerplate/view/screens/otp_verification_screen.dart';
import 'package:flutter_boilerplate/viewmodel/otp_view_model.dart';
import 'package:provider/provider.dart';

class OTPWidget extends StatefulWidget {
  const OTPWidget({super.key});

  @override
  State<OTPWidget> createState() => _OTPWidgetState();
}

class _OTPWidgetState extends State<OTPWidget> {
  var isChecked = false;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    OTPViewModel otpViewModel =
        Provider.of<OTPViewModel>(context, listen: false);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
        child: Column(
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: theme.primaryColor,
                shape: BoxShape.circle,
              ),
              child: Assets.png.otp2.image(),
            ),
            const SizedBox(
              height: 24,
            ),
            Text('registration', style: theme.textTheme.headlineSmall).tr(),
            const SizedBox(
              height: 10,
            ),
            Text(
              "add_your_phone_number",
              style: theme.textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ).tr(),
            const SizedBox(
              height: 28,
            ),
            Container(
              padding: const EdgeInsets.all(28),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (val) =>
                          ValidationHelper.mobileValidation(val),
                      controller: otpViewModel.phoneC,
                      keyboardType: TextInputType.number,
                      style: theme.textTheme.bodyMedium,
                      decoration: InputDecoration(
                        hintText: "Phone",
                        prefix: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            '(+91)',
                            style: theme.textTheme.bodyMedium,
                          ),
                        ),
                        suffixIcon: Icon(
                          Icons.check_circle,
                          color: theme.iconTheme.color,
                          size: 30,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    SizedBox(
                        width: double.infinity,
                        child: TextButton(
                          onPressed: () {
                            if (!formKey.currentState!.validate()) {
                              NavigationHelper.pushNamed(
                                  context, OTPVerificationScreen.name);
                            }
                          },
                          style: TextButton.styleFrom(
                            minimumSize: const Size.fromHeight(50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: const Text("send").tr(),
                        ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
