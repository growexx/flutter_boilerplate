import 'package:flutter/material.dart';

class TextFieldSpacer extends StatelessWidget {
  final Widget child;
  final double? minHeight;
  const TextFieldSpacer({super.key, required this.child, this.minHeight});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints:  BoxConstraints(
        minHeight: minHeight ?? 55,
      ),
      child: child,
    );
  }
}
