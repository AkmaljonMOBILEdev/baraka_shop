import 'package:baraka_shop/ui/auth_screens/widget/or_auth_widget.dart';
import 'package:baraka_shop/ui/auth_screens/widget/other_auth_ways.dart';
import 'package:baraka_shop/ui/widget/global_logo_name.dart';
import 'package:baraka_shop/utils/icons.dart';
import 'package:baraka_shop/utils/sizebox_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/colors.dart';
import '../widget/global_button.dart';
import '../widget/global_text_field.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cF9FAFB,
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.0.w),
        child: ListView(
          children: [
            40.ph,
            const   Center(child:  GlobalLogoName()),
            40.ph,
            const GlobalTextField(
                icon: AppIcons.username,
                hintText: "Enter your username",
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                // controller: context.read<AuthProvider>().emailController,
            ),
            20.ph,
            const GlobalTextField(
                icon: AppIcons.email,
                hintText: "Enter your email",
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                // controller: context.read<AuthProvider>().userNameController
            ),
            20.ph,
            const GlobalTextField(
                icon: AppIcons.password,
                hintText: "Enter your password",
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                // controller: context.read<AuthProvider>().passwordController
          ),
            20.ph,
            const GlobalTextField(
              icon: AppIcons.password,
              hintText: "Confirm password",
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              // controller: context.read<AuthProvider>().passwordController
            ),
            60.ph,
            GlobalButton(title: "Sign Up", onTap: () {}),
            40.ph,
            const OrAuthWidget(),
            40.ph,
            const  Padding(
              padding:  EdgeInsets.symmetric(horizontal: 80),
              child: OtherAuthWays(),
            ),
            60.ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Do you have an account?",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.c040415.withOpacity(0.2),
                      ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ));
                  },
                  child: const Text("Login"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
