

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/component/shadow_container.dart';


class SelectionBox extends StatelessWidget {
  final String title;
  final String description;
  final IconData iconData;

  const SelectionBox({Key? key, required this.title, required this.description, required this.iconData,}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final theme=Theme.of(context);

    return ShadowContainer(
      gradientColor: Colors.white,
      child: SizedBox(
        width: 100,
        height: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 10,),
            Text(title, style:  theme.textTheme.labelMedium),
            const SizedBox(height: 5,),
            Expanded(child:Padding(
              padding: const EdgeInsets.all(5.0),
              child: Icon(iconData,
                color: theme.primaryColor, size: 40,),
            )),
            // const SizedBox(height: 5,),
            // Text(description.toString(),
            //     style:  MyTextTheme.smallWCB,),
          ],
        ),
      ),
    );
  }
}