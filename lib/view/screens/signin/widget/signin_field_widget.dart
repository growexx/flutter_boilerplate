import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/component/password_field.dart';
import 'package:flutter_boilerplate/app_manager/helper/navigation/navigation_helper.dart';
import 'package:flutter_boilerplate/app_manager/helper/show_toast.dart';
import 'package:flutter_boilerplate/app_manager/helper/validation_helper.dart';
import 'package:flutter_boilerplate/authentication/user.dart';
import 'package:flutter_boilerplate/authentication/user_repository.dart';
import 'package:flutter_boilerplate/gen/assets.gen.dart';
import 'package:flutter_boilerplate/view/screens/dashboard/dashboard_screen.dart';
import 'package:flutter_boilerplate/view/screens/forgot_password/forgot_password_screen.dart';
import 'package:flutter_boilerplate/view/screens/signup/signup_screen.dart';
import 'package:flutter_boilerplate/view_model/google_signin_view_model.dart';
import 'package:flutter_boilerplate/view_model/signin_view_model.dart';
import 'package:go_router/go_router.dart';

class SignInFieldWidget extends StatefulWidget {
  final SignInViewModel viewModel;
  final GoogleSigninViewModel googleSignInViewModel;
  final UserRepository userRepository;

  const SignInFieldWidget(
      {super.key,
      required this.viewModel,
      required this.googleSignInViewModel,
      required this.userRepository});

  @override
  State<SignInFieldWidget> createState() => _SignInFieldWidgetState();
}

class _SignInFieldWidgetState extends State<SignInFieldWidget> {
  var isChecked = false;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              child: Builder(builder: (ctx) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "sign_in",
                      style: theme.textTheme.headlineMedium,
                    ).tr(),
                    const SizedBox(
                      height: 10,
                    ),
                    Text("login_using_social_networks",
                            style: theme.textTheme.bodyMedium)
                        .tr(),
                    const SizedBox(height: 20),
                    Wrap(
                      children: [
                        Assets.png.facebook.image(width: 35, height: 35),
                        const SizedBox(width: 20),
                        Assets.png.instagram.image(width: 35, height: 35),
                        const SizedBox(width: 20),
                        InkWell(
                            onTap: () {
                              widget.googleSignInViewModel
                                  .signin()
                                  .then((User? user) {
                                if (user != null) {
                                  widget.userRepository
                                      .updateUserData(user)
                                      .then((value) => Router.neglect(
                                          context,
                                          () => context
                                              .goNamed(DashboardScreen.name)));
                                }
                              });
                            },
                            child:
                                Assets.png.google.image(width: 35, height: 35)),
                        const SizedBox(width: 20),
                        Assets.png.twitter.image(width: 35, height: 35),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text("or_capital", style: theme.textTheme.bodyMedium).tr(),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: widget.viewModel.emailC,
                      decoration:
                          const InputDecoration(hintText: "Enter Email"),
                      validator: ValidationHelper.emailValidation,
                      onFieldSubmitted: (val) {
                        onPressSignIn(ctx);
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    PasswordField(
                      controller: widget.viewModel.passwordC,
                      hintText: "Enter Password",
                      validator: ValidationHelper.passwordValidation,
                      onFieldSubmitted: (val) {
                        onPressSignIn(ctx);
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton(
                      onPressed: () {
                        onPressSignIn(ctx);
                      },
                      style: TextButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: const Text("sign_in").tr(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              SizedBox(
                                width: 30,
                                child: Checkbox(
                                  fillColor: theme.checkboxTheme.fillColor,
                                  value: isChecked,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isChecked = value!;
                                    });
                                  },
                                ),
                              ),
                              Text(
                                "remember_me",
                                style: theme.textTheme.bodySmall,
                              ).tr()
                            ],
                          ),
                          const SizedBox(width: 5),
                          InkWell(
                              onTap: (){
                                NavigationHelper.pushNamed(context, ForgotPasswordScreen.name);
                              },
                              child: Text("forgot_password", style: theme.textTheme.bodySmall).tr())
                        ],
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Wrap(
                      children: [
                        Text("don't_have_an_account",
                                style: theme.textTheme.bodyMedium)
                            .tr(),
                        const SizedBox(width: 10),
                        InkWell(
                            onTap: () => NavigationHelper.pushNamed(
                                context, SignUpScreen.name),
                            child: Text(
                              "sign_up",
                              style: theme.textTheme.bodyMedium,
                            ).tr()),
                      ],
                    )
                  ],
                );
              }),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> onPressSignIn(BuildContext ctx) async {
    if (Form.of(ctx).validate()) {
      widget.viewModel.signIn(
          email: widget.viewModel.emailC.text,
          password: widget.viewModel.passwordC.text);
    } else {
      showToast("Fill Required Fields");
    }
  }
}
