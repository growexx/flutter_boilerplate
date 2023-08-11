import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/constant/app_constant.dart';
import 'package:flutter_boilerplate/app_manager/theme/app_color.dart';
import 'circular_indicator_white.dart';
class LoaderButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool enable;
  final bool loading;
  final bool center;
  final Widget loader;
  const LoaderButton({Key? key, required this.label, this.onPressed, this.enable = true,
    this.loading = false, this.center = true,
    this.loader =  const CircularIndicatorWhite()
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget child = AnimatedSwitcher(
        key: UniqueKey(),
        duration: AppConstant.animationDuration,
        child: loading ?
       loader
            :  Text(label));

    return SelectionContainer.disabled(
      child: TextButton(
          style: TextButton.styleFrom(
            minimumSize: const Size.fromHeight(50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          onPressed: (){
            if (enable && onPressed!=null && !loading) {
              onPressed!();
            }
          }, child:  center?
      Center(child: child): child),
    );
  }
}


class LoaderButtonWithIcon extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool enable;
  final bool loading;
  final Widget icon;
  final Widget loader;
  const LoaderButtonWithIcon({Key? key, required this.label, this.onPressed, this.enable = true,
    this.loading = false, required this.icon,
    this.loader = const CircularIndicatorWhite()
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SelectionContainer.disabled(
      child: TextButton.icon(
          icon: icon,
          style: TextButton.styleFrom(
            backgroundColor: enable? null: AppColor.grey,
          ),
          onPressed: (){
            if (enable && onPressed!=null && !loading) {
              onPressed!();
            }
          }, label:  AnimatedSwitcher(
          key: UniqueKey(),
          duration: AppConstant.animationDuration,
          child: loading ?
          SizedBox(
              height: 20,
              width: 20,
              child: loader)
              :  Text(label))),
    );
  }
}
