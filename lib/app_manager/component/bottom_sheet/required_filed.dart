



import 'package:flutter_boilerplate/app_manager/constant/app_constant.dart';
import 'package:flutter/material.dart';

class RequiredField extends StatelessWidget {

  final TextSpan child;
  final TextAlign? textAlign;
  const RequiredField({super.key,
    required this.child,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return  Text.rich(
      textAlign: textAlign,
      TextSpan(
        children: [
          const TextSpan(
            text: '* ',
            style: TextStyle(
                fontFamily: AppConstant.fontFamily,
                color: Colors.red
            ),),
          child,
        ],
      ),
    );
  }
}
