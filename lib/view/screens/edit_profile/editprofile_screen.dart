import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/component/responsive/widget/responsive_helper.dart';
import 'package:flutter_boilerplate/authentication/user_repository.dart';
import 'package:flutter_boilerplate/view/screens/edit_profile/widget/editprofile_field_widget.dart';
import 'package:flutter_boilerplate/view/widgets/welcome.dart';
import 'package:flutter_boilerplate/view_model/editprofile_view_model.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatefulWidget {
  static const String name = "editprofile";
  static const String path = "/$name";

  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<EditProfileViewModel>(context, listen: false);
    final userRepository = Provider.of<UserRepository>(context, listen: false);
    
    Widget fieldPart = EditProfileFieldWidget(
      viewModel: viewModel,
      userRepository: userRepository,
    );

    return Scaffold(
      body: ResponsiveHelperWidget(
        mobile: fieldPart,
        desktop: Row(
          children: [
            SizedBox(width: 440,child: fieldPart),
          ],
        ),
      ),
    );
  }
}