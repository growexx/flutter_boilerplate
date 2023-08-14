import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/constant/app_constant.dart';
import 'package:flutter_boilerplate/app_manager/theme/app_color.dart';

class ValidationStackBox extends StatelessWidget {
  const ValidationStackBox({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> validations = ["password_hint".tr()];
    TextStyle style = const TextStyle(
        fontFamily: AppConstant.fontFamily,
        fontSize: 11,
        fontWeight: FontWeight.w400);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          width: 226,
          padding: const EdgeInsets.fromLTRB(10, 6, 10, 6),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: AppColor.grey0, width: 1)),
          child: Column(
            children: List.generate(
                validations.length,
                (index) => Padding(
                      padding: const EdgeInsets.only(bottom: 2),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 14,
                            child: Text(
                              validations[index].toString(),
                              style: style,
                            ),
                          ),
                        ],
                      ),
                    )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: SizedBox(
            height: 10,
            width: 10,
            child: CustomPaint(
              painter: Arrow(),
            ),
          ),
        ),
      ],
    );
  }
}

class Arrow extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = AppColor.grey0
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    Path path = Path();

    path
      ..lineTo(size.width, 0)
      ..lineTo(size.width / 2, size.width / 2)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
