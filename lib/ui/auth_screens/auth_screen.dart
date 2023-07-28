import 'package:baraka_shop/ui/auth_screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';
import '../../utils/colors.dart';
import 'login_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLoginPage = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFC6828,
      body: SafeArea(
        child: Stack(
          children: [
            isLoginPage
                ? LoginPage(
              voidCallback: () {
                setState(() {
                  isLoginPage = false;
                });
              },
            )
                : SignUpPage(
              voidCallback: () {
                setState(() {
                  isLoginPage = true;
                });
              },
            ),
            Visibility(
              visible: context.watch<AuthProvider>().isLoading,
              child:const Align(
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
