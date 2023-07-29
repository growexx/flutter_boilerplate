import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/component/responsive/widget/responsive_helper.dart';
import 'package:flutter_boilerplate/app_manager/locale/widget/locale_selector_widget.dart';
import 'package:flutter_boilerplate/app_manager/theme/widget/theme_mode_selector.dart';
import 'package:flutter_boilerplate/authentication/user_repository.dart';
import 'package:flutter_boilerplate/view/screens/payment/widget/payment_field_widget.dart';
import 'package:flutter_boilerplate/view/screens/payment/widget/signin_web_page_filler_widget.dart';
import 'package:flutter_boilerplate/view/screens/signin/widget/signin_web_page_filler_widget.dart';
import 'package:flutter_boilerplate/view_model/google_signin_view_model.dart';
import 'package:flutter_boilerplate/view_model/payment_view_model.dart';
import 'package:provider/provider.dart';

class PaymentScreen extends StatefulWidget {

  static const String name = "payment";
  static const String path = "/$name";

  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<PaymentViewModel>(context,listen: false);
    final googleSignInViewModel = Provider.of<GoogleSigninViewModel>(context,listen: false);
    final userRepository = Provider.of<UserRepository>(context,listen: false);

    Widget fieldPart = PaymentFieldWidget(
      viewModel: viewModel,
      googleSignInViewModel: googleSignInViewModel,
      userRepository: userRepository,
    );

    return  Scaffold(
      body: Column(
        children: [
           SizedBox(
             width: double.infinity,
             child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: Wrap(
                alignment: WrapAlignment.spaceAround,
                children: [
                  const ThemeModeSelector(),
                  LocaleSelectorWidget(
                    onLocaleChange: () {
                      setState(() {

                      });
                    },
                  )
                ],
          ),
             ),
           ),
          Expanded(
            child: ResponsiveHelperWidget(
              mobile: fieldPart,
              desktop: Row(
                children: [
                  const Expanded(child: PaymentWebPageFillerWidget()),
                  Expanded(child: fieldPart),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
