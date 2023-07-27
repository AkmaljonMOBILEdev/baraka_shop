import 'package:baraka_shop/utils/helper_sizebox_and_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_provider.dart';
import '../../utils/colors.dart';
import '../../widget/authorisation_social_media.dart';
import '../../widget/global_button.dart';
import '../../widget/global_text_fields.dart';
import '../login_page/login_page.dart';
import '../login_page/widget/or_auth_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c_F9FAFB,
      appBar: AppBar(
        backgroundColor: AppColors.c_F9FAFB,
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
                    .copyWith(color: AppColors.c_FC6828),
              ),
            ),
            70.ph,
            GlobalTextField(
                icon: Icon(Icons.account_circle),
                hintText: "username",
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                textAlign: TextAlign.start,
                controller: context.read<AuthProvider>().emailController),
            20.ph,
            GlobalTextField(
                icon: Icon(Icons.lock),
                hintText: "password",
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                textAlign: TextAlign.start,
                controller: context.read<AuthProvider>().passwordController),
            20.ph,
            GlobalTextField(
                icon: Icon(Icons.lock),
                hintText: "confirm password",
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                textAlign: TextAlign.start,
                controller: context.read<AuthProvider>().passwordController),
            70.ph,
            GlobalButton(title: "Login", onTap: () {}),
            40.ph,
          const  OrAuthWidget(),
            50.ph,
            const  Padding(
              padding:  EdgeInsets.symmetric(horizontal: 80),
              child: AuthorisationSocialMedia(),
            ),
            80.ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don’t have an account?",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.c_040415.withOpacity(0.2),
                      ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ));
                  },
                  child: Text("Sign Up"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
