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
import 'package:provider/provider.dart';

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
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: Form(
            child: Builder(builder: (ctx) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    key:const Key("sign_in"),
                    "sign_in",
                    style: theme.textTheme.headlineMedium,
                  ).tr(),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                      key:const Key("sign_in_description"),
                      "login_using_social_networks",
                          style: theme.textTheme.bodyMedium)
                      .tr(),
                  const SizedBox(height: 20),
                  Wrap(
                    key:const Key("social_container"),
                    children: [
                      Assets.png.facebook.image(
                          key:const Key("facebook"),
                          width: 35, height: 35),
                      const SizedBox(width: 20),
                      Assets.png.instagram.image(
                          key:const Key("instagram"),
                          width: 35, height: 35),
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
                              Assets.png.google.image(
                                  key:const Key("google"),
                                  width: 35, height: 35)),
                      const SizedBox(width: 20),
                      Assets.png.twitter.image(
                          key:const Key("twitter"),
                          width: 35, height: 35),
                      const SizedBox(width: 20),
                      Assets.png.apple.image(
                          key:const Key("apple"),
                          width: 38, height: 38),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text("or_capital", style: theme.textTheme.bodyMedium).tr(),
                  const SizedBox(height: 10),
                  TextFormField(
                    key:const Key("tf_email"),
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
                    key:const Key("tf_password"),
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
                    key:const Key("tb_sign_in"),
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
                  Row(
                    key:const Key("row_sing_in_utils"),
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Wrap(
                        key:const Key("remember_me"),
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          SizedBox(
                            width: 12,
                            child: Selector<SignInViewModel, bool>(
                              selector: (_, listener) =>
                              listener.isRememberMeChecked,
                              builder: (context, isRememberCheck, child) =>
                                  Checkbox(
                                    key:const Key("cb_remember_me"),
                                    fillColor: theme.checkboxTheme.fillColor,
                                    value: isRememberCheck,
                                    onChanged: (bool? value) =>
                                    widget.viewModel.setRememberMe = value!,
                                  ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            key:const Key("t_remember_me"),
                            "remember_me",
                            style: theme.textTheme.bodySmall,
                          ).tr()
                        ],
                      ),
                      InkWell(
                          key:const Key("forgot_password"),
                          onTap: () {
                            NavigationHelper.pushNamed(
                                context, ForgotPasswordScreen.name);
                          },
                          child: Text(
                              key:const Key("t_forgot_password"),
                              "forgot_password",
                              style: theme.textTheme.bodySmall)
                              .tr())
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Wrap(
                    key:const Key("t_sign_up_description"),
                    children: [
                      Text("don't_have_an_account",
                              style: theme.textTheme.bodyMedium)
                          .tr(),
                      const SizedBox(width: 10),
                      InkWell(
                          onTap: () => NavigationHelper.pushNamed(
                              context, SignUpScreen.name),
                          child: Text(
                            key:const Key("t_sign_up"),
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
    );
  }

  Future<void> onPressSignIn(BuildContext ctx) async {
    if (Form.of(ctx).validate()) {
      widget.viewModel.signIn(
          context: ctx,
          email: widget.viewModel.emailC.text,
          password: widget.viewModel.passwordC.text);
    } else {
      showToast("Fill Required Fields");
    }
  }
}
