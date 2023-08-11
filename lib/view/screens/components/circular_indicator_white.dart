import 'package:flutter/material.dart';

class CircularIndicatorWhite extends StatelessWidget {
  const CircularIndicatorWhite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 20,
      width: 20,
      child: CircularProgressIndicator(
        color: Colors.white,
      ),
    );
  }
}
