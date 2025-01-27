import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:ichota_mobile_app/features/auth/presentation/widgets/social_button.dart';
import 'package:ichota_mobile_app/features/auth/provider/auth_provider.dart';
import 'package:ichota_mobile_app/features/dashboard/dash_board.dart';
import 'package:ichota_mobile_app/shared/styles/text_style.dart';
import 'package:ichota_mobile_app/shared/widgets/app_button.dart';
import 'package:ichota_mobile_app/shared/widgets/text_input.dart';
import 'package:ichota_mobile_app/utils/constants/app_fonts.dart';
import 'package:ichota_mobile_app/utils/constants/colors.dart';
import 'package:ichota_mobile_app/utils/constants/images.dart';
import 'package:ichota_mobile_app/utils/extension/context_extensions.dart';
import 'package:ichota_mobile_app/utils/validation.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  bool _obscureText = true;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xff1167B1),
      body: SingleChildScrollView(
        child: Container(
          width: context.deviceWidth,
          height: context.deviceHeight * .98,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [
                Color(0xff1167B1),
                Color(0xffFFFF00),
              ],
              stops: [
                0.7,
                1.0,
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Spacer(),
              SvgPicture.asset(
                AppSvg.appLogo,
                colorFilter:
                    ColorFilter.mode(AppColor.whiteColor, BlendMode.srcIn),
                width: 150,
              ),
              Spacer(),
              Container(
                width: context.deviceWidth,
                height: context.deviceHeight * 0.8,
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  color: Colors.white,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      40.verticalSpace,
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Get started with',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextSpan(
                              text: ' iChota',
                              style: TextStyle(
                                color: Colors.blue, //Todo change
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                      ),
                      20.verticalSpace,
                      TextInputField(
                        title: "Email",
                        hintText: 'yourname@company.com',
                        validator: AppValidations.validatedEmail,
                      ),
                      40.verticalSpace,
                      TextInputField(
                        title: "Password",
                        obscureText: _obscureText,
                        validator: AppValidations.validatePassword,
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          child: Icon(
                            _obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                      ),
                      20.verticalSpace,
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextRegular(
                          'Forgot your password?',
                          color: AppColor.blueColor,
                        ),
                      ),
                      20.verticalSpace,
                      AppButton(
                        title: "Log in",
                        state: false,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // context.pushReplacement(DashBoard.routeName);
                          }
                        },
                      ),
                      20.verticalSpace,

                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(text: "Need to create an account? "),
                            TextSpan(
                              text: "Sign Up",
                              style: TextStyle(
                                color: AppColor.blueColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      20.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            color: AppColor.greyColor,
                            height: 1,
                            width: context.deviceWidth * 0.35,
                          ),
                          TextRegular('Or'),
                          Container(
                            color: AppColor.greyColor,
                            height: 1,
                            width: context.deviceWidth * 0.35,
                          ),
                        ],
                      ),
                      10.verticalSpace,

                      ///TODO social login
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SocialButton(
                            svg: AppSvg.google,
                            onTap: () async {
                              log("message");
                              await ref.read(authProvider).continueWithGoogle();

                              // context.pushReplacement(DashBoard.routeName);
                            },
                          ),
                          SocialButton(
                            svg: AppSvg.facebook,
                            onTap: () {},
                          ),
                          SocialButton(
                            svg: AppSvg.apple,
                            onTap: () {},
                          ),
                        ],
                      ),
                      10.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            color: AppColor.greyColor,
                            height: 1,
                            width: context.deviceWidth * 0.35,
                          ),
                          TextRegular('Or'),
                          Container(
                            color: AppColor.greyColor,
                            height: 1,
                            width: context.deviceWidth * 0.35,
                          ),
                        ],
                      ),
                      const Spacer(),
                      TextRegular(
                        'Continue as a guest',
                        color: AppColor.blueColor,
                      ),
                      const Spacer(),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: TextStyle(
                            fontFamily: AppFonts.poppins,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: 'By proceeding you consent to our ',
                            ),
                            TextSpan(
                              text: 'terms of service',
                              style: TextStyle(
                                color: AppColor.blueColor,
                              ),
                            ),
                            TextSpan(text: ' and '),
                            TextSpan(
                              text: 'privacy policy',
                              style: TextStyle(
                                color: AppColor.blueColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      10.verticalSpace,
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
