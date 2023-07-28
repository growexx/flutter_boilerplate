


import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/component/password_field.dart';
import 'package:flutter_boilerplate/app_manager/helper/show_toast.dart';
import 'package:flutter_boilerplate/app_manager/helper/validation_helper.dart';
import 'package:flutter_boilerplate/authentication/user.dart';
import 'package:flutter_boilerplate/authentication/user_repository.dart';
import 'package:flutter_boilerplate/view/screens/dashboard_screen.dart';
import 'package:flutter_boilerplate/view/screens/main_screen.dart';
import 'package:flutter_boilerplate/view_model/google_signin_view_model.dart';
import 'package:flutter_boilerplate/view_model/signin_view_model.dart';
import 'package:go_router/go_router.dart';

class SigninFieldWidget extends StatelessWidget {
  final SigninViewModel viewModel;
  final GoogleSigninViewModel googleSigninViewModel;
  final UserRepository userRepository;
  const SigninFieldWidget({super.key, required this.viewModel, required this.googleSigninViewModel, required this.userRepository});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 400
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              child: Builder(
                builder: (ctx) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text("login_screen").tr(),
                      const SizedBox(height: 20,),
                      TextFormField(
                        controller: viewModel.emailC,
                        decoration: const InputDecoration(
                          hintText: "Enter Email"
                        ),
                        validator: ValidationHelper.emailValidation,
                        onFieldSubmitted: (val) {
                          onPressSignin(ctx);
                        },
                      ),
                      const SizedBox(height: 20,),
                      PasswordField(
                        controller: viewModel.passwordC,
                        hintText: "Enter Password",
                        validator: ValidationHelper.passwordValidation,
                        onFieldSubmitted: (val) {
                          onPressSignin(ctx);
                        },
                      ),
                      const SizedBox(height: 20,),
                      TextButton(onPressed: (){
                        onPressSignin(ctx);
                      }, child: const Text("sign_in",).tr()),
                      const SizedBox(height: 20,),
                      TextButton(onPressed: (){
                        googleSigninViewModel.signin().then((User? user){
                          if(user!=null) {
                            userRepository.updateUserData(user).then((value) =>
                                Router.neglect(context, () =>
                                    context.goNamed(MainScreen.name)
                                ));
                          }
                        });
                      }, child: const Text("Google Signin",)),
                    ],
                  );
                }
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> onPressSignin(BuildContext ctx) async {
    if(Form.of(ctx).validate()){
      viewModel.signIn(
          email: viewModel.emailC.text,
          password: viewModel.passwordC.text
      );
    } else {
      showToast("Fill Required Fields");
    }
  }

}
