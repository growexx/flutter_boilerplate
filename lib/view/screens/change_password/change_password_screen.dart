import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/component/responsive/widget/responsive_helper.dart';
import 'package:flutter_boilerplate/authentication/user_repository.dart';
import 'package:flutter_boilerplate/view/screens/change_password/widget/change_password_field_widget.dart';
import 'package:flutter_boilerplate/view/screens/change_password/widget/change_password_web_page_filler_widget.dart';
import 'package:flutter_boilerplate/view/screens/dashboard/dashboard_screen.dart';
import 'package:flutter_boilerplate/view_model/change_password_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ChangePasswordScreen extends StatefulWidget {
  static const String name = "change_password";
  static const String path = "/$name";

  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final viewModel =
        Provider.of<ChangePasswordViewModel>(context, listen: false);
    final userRepository = Provider.of<UserRepository>(context, listen: false);

    Widget fieldPart = ChangePasswordFieldWidget(
      viewModel: viewModel,
      userRepository: userRepository,
    );

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          key: const Key("to_dashboard"),
            onPressed: () {
              context.goNamed(DashboardScreen.name);
            },
            icon: const Icon(Icons.arrow_back_sharp)),
        title: Text("change_password",style: theme.textTheme.headlineSmall).tr(),
        automaticallyImplyLeading: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ResponsiveHelperWidget(
              mobile: fieldPart,
              desktop: Row(
                children: [
                  const Expanded(
                      flex: 3, child: ChangePasswordWebPageFillerWidget()),
                  SizedBox(width: 440, child: fieldPart),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
