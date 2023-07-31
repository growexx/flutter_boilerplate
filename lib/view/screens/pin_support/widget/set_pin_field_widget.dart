import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/helper/show_toast.dart';
import 'package:flutter_boilerplate/app_manager/helper/validation_helper.dart';
import 'package:flutter_boilerplate/authentication/user_repository.dart';
import 'package:flutter_boilerplate/view_model/security_pin_view_model.dart';

class SetSecurityPinWidget extends StatefulWidget {
  final SecurityPinViewModel viewModel;
  final UserRepository userRepository;

  const SetSecurityPinWidget(
      {super.key,
      required this.viewModel,
      required this.userRepository});

  @override
  State<SetSecurityPinWidget> createState() => _SetSecurityPinWidgetState();
}

class _SetSecurityPinWidgetState extends State<SetSecurityPinWidget> {
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
                    key:const Key("security_pin"),
                    "security_pin",
                    style: theme.textTheme.headlineMedium,
                  ).tr(),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                      key:const Key("sign_in_description"),
                      "security_pin_description",
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
                        const InputDecoration(hintText: "Your 4 digit PIN"),
                    validator: ValidationHelper.requiredField,
                    onFieldSubmitted: (val) {
                      onPressSave(ctx);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    key:const Key("tb_save"),
                    onPressed: () {
                      onPressSave(ctx);
                    },
                    style: TextButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: const Text("save").tr(),
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