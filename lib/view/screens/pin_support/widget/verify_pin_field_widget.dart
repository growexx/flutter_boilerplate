import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/helper/show_toast.dart';
import 'package:flutter_boilerplate/app_manager/helper/validation_helper.dart';
import 'package:flutter_boilerplate/authentication/user_repository.dart';
import 'package:flutter_boilerplate/view_model/security_pin_view_model.dart';

class VerifySecurityPinWidget extends StatefulWidget {
  final SecurityPinViewModel viewModel;
  final UserRepository userRepository;

  const VerifySecurityPinWidget(
      {super.key,
      required this.viewModel,
      required this.userRepository});

  @override
  State<VerifySecurityPinWidget> createState() => _VerifySecurityPinWidgetState();
}

class _VerifySecurityPinWidgetState extends State<VerifySecurityPinWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: Form(
            child: Builder(builder: (ctx) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    key:const Key("verify_security_pin"),
                    "verify_security_pin",
                    style: theme.textTheme.headlineMedium,
                  ).tr(),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                      key:const Key("enter_security_pin"),
                      "enter_security_pin",
                          style: theme.textTheme.bodyMedium)
                      .tr(),
                  const SizedBox(height: 20),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    maxLength: 4,
                    maxLines: 1,
                    key:const Key("tf_security_pin"),
                    controller: widget.viewModel.pinC,
                    decoration:
                    InputDecoration(hintText: "your_4_digit_pin".tr()),
                    validator: ValidationHelper.requiredField,
                    onFieldSubmitted: (val) {
                      onPressSave(ctx);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    key:const Key("tb_verify"),
                    onPressed: () {
                      onPressSave(ctx);
                    },
                    style: TextButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: const Text("verify").tr(),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }

  Future<void> onPressSave(BuildContext ctx) async {
    if (Form.of(ctx).validate()) {
      widget.viewModel.savePin(
          context: ctx,
          pin: widget.viewModel.pinC.text);
    } else {
      showToast("Fill Required Fields");
    }
  }
}
