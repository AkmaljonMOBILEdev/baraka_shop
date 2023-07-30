import 'package:animate_do/animate_do.dart';
import 'package:baraka_shop/ui/auth_screens/widget/or_auth_widget.dart';
import 'package:baraka_shop/ui/auth_screens/widget/other_auth_ways.dart';
import 'package:baraka_shop/ui/widget/global_logo_name.dart';
import 'package:baraka_shop/utils/app_routes.dart';
import 'package:baraka_shop/utils/icons.dart';
import 'package:baraka_shop/utils/sizebox_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';
import '../../utils/colors.dart';
import '../widget/global_button.dart';
import '../widget/global_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        backgroundColor: AppColors.cFC6828,
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.0.w),
          child: Column(
            children: [
              20.ph,
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    70.ph,
                      FadeInLeft(child: const Center(child:  GlobalLogoName(),)),
                    70.ph,
                     FadeInLeft(
                       child: GlobalTextField(
                          icon: AppIcons.username,
                          hintText: "Enter your email",
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          controller: context.read<AuthProvider>().emailController
                          ),
                     ),
                    20.ph,
                     FadeInRight(
                       child: GlobalTextField(
                          icon: AppIcons.password,
                          hintText: "Enter you password",
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.done,
                          controller: context.read<AuthProvider>().passwordController,
                    ),
                     ),
                    70.ph,
                    FadeInUpBig(
                      child: GlobalButton(
                        title: "Login",
                        onTap: () {
                          context.read<AuthProvider>().login(context);
                        },
                      ),
                    ),
                    50.ph,
                    const OrAuthWidget(),
                    60.ph,
                    const Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 80),
                      child: OtherAuthWays(),
                    ),
                    60.ph,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don’t have an account?",
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            context.read<AuthProvider>().signUpPressed();
                            Navigator.pushReplacementNamed(context, RouteNames.signUpScreen);
                          },
                          child:  Text("Sign Up",
                            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                fontSize: 19.sp, color: AppColors.c040415, fontWeight: FontWeight.w900
                            )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  }
}
