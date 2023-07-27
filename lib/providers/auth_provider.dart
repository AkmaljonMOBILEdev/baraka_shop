import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();

  Stream<User?> listenAuthState() => FirebaseAuth.instance.authStateChanges();


  bool isLoading = false;

  loginButtonPressed() {
    passwordController.clear();
    emailController.clear();
    userNameController.clear();
  }

  signUpButtonPressed() {
    passwordController.clear();
    emailController.clear();
  }


















  manageMessage(BuildContext context, String error) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error)));
    isLoading = false;
    notifyListeners();
  }
}
