import 'package:baraka_shop/ui/auth_screens/widget/or_auth_widget.dart';
import 'package:baraka_shop/ui/auth_screens/widget/other_auth_ways.dart';
import 'package:baraka_shop/utils/icons.dart';
import 'package:baraka_shop/utils/sizebox_extension.dart';
import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../widget/global_button.dart';
import 'sign_up_screen.dart';
import '../widget/global_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cF9FAFB,
      appBar: AppBar(
        backgroundColor: AppColors.cF9FAFB,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView(
          children: [
            50.ph,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80.0),
              child: Text(
                "Login to b - Shop",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: AppColors.cFC6828),
              ),
            ),
            70.ph,
            GlobalTextField(
                icon: AppIcons.username,
                hintText: "Enter your username",
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                // controller: context.read<AuthProvider>().emailController
                ),
            20.ph,
            GlobalTextField(
                icon: AppIcons.password,
                hintText: "Enter you password",
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                // controller: context.read<AuthProvider>().passwordController
            ),
            70.ph,
            GlobalButton(title: "Login", onTap: () {}),
            40.ph,
            const OrAuthWidget(),
            50.ph,
            const Padding(
              padding:  EdgeInsets.symmetric(horizontal: 80),
              child: OtherAuthWays(),
            ),
            80.ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don’t have an account?",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.c040415.withOpacity(0.2),
                      ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpScreen(),
                        ));
                  },
                  child: const Text("Sign Up"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
