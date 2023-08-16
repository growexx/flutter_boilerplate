import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/helper/validation_helper.dart';
import 'package:flutter_boilerplate/app_manager/theme/app_color.dart';
import 'package:flutter_boilerplate/view/screens/components/validation_stack_box.dart';

class PasswordField<T> extends StatefulWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final TextStyle? style;
  final Widget? prefixIcon;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;

  const PasswordField(
      {super.key,
      this.controller,
      this.labelText,
      this.hintText,
      this.validator,
      this.style,
      this.prefixIcon,
      this.onFieldSubmitted});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _passwordVisible = true;
  bool focus = false;

  bool get passwordVisible => _passwordVisible;

  set passwordVisible(bool val) {
    _passwordVisible = val;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget field = TextFormField(
      style: widget.style,
      controller: widget.controller,
      obscureText: passwordVisible,
      onFieldSubmitted: widget.onFieldSubmitted,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: widget.hintText,
        errorMaxLines: 3,
        prefixIcon: widget.prefixIcon,
        suffixIconConstraints: const BoxConstraints(maxHeight: 35),
        suffixIcon: IconButton(
          onPressed: () {
            passwordVisible = !passwordVisible;
          },
          icon: Icon(
            passwordVisible ? Icons.visibility_off : Icons.visibility,
            color: AppColor.hintColor,
          ),
        ),
      ),
      validator: widget.validator ?? ValidationHelper.passwordValidation,
    );

    return widget.validator != null
        ? field
        : Stack(
            clipBehavior: Clip.none,
            children: [
              Focus(
                onFocusChange: (val) {
                  setState(() {
                    focus = val;
                  });
                },
                child: field,
              ),
              (focus == false)
                  ? Container()
                  : const Positioned(
                      right: 0, top: -94, child: ValidationStackBox()),
            ],
          );
  }
}
