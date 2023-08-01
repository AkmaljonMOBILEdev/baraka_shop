import 'package:baraka_shop/data/models/universal_data.dart';
import 'package:baraka_shop/utils/ui_utils/error_message_dialog.dart';
import 'package:baraka_shop/utils/ui_utils/loading_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


import '../data/firebase/auth_services.dart';
import '../utils/app_routes.dart';

class AuthProvider with ChangeNotifier {


  AuthProvider({required this.firebaseServices}) {
    notifyy();
  }
  final AuthServices firebaseServices;



  // AuthProvider({
  //   required this.authServices,
  // });
  // final AuthServices authServices;
  var isLoading = false;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  signUpPressed() {
    usernameController.clear();
    emailController.clear();
    passwordController.clear();
  }

  loginPressed() {
    emailController.clear();
    passwordController.clear();
  }

  User? usser = FirebaseAuth.instance.currentUser;
  bool isuservisible = true;
  bool isadminvisible = true;


  notifyy() {
    print(isadminvisible);
    if(usser!=null){
      if (usser!.email!.contains(
        "admin",
      )) {
        isadminvisible = true;
        isuservisible = false;
        notifyListeners();
      } else {
        isuservisible = true;
        isadminvisible = false;
        notifyListeners();
      }
    }
  }

  Stream<User?> listenAuthState() => FirebaseAuth.instance.authStateChanges();

  Future<void> signInWithGoogle(BuildContext context) async {
    showLoading(context: context);
    UniversalData universalData = await firebaseServices.signInWithGoogle();
    if (context.mounted) hideLoading(dialogContext: context);
    if (universalData.error.isEmpty) {
      if (context.mounted) {
        Navigator.pushReplacementNamed(context, RouteNames.tabBox);
        showConfirmMessage(message: "Signed in with Google", context: context);
      } else {
        if (context.mounted) {
          showErrorMessage(message: universalData.error, context: context);
        }
      }
    }
  }

  Future<void> signUpUser(BuildContext context) async {
    showLoading(context: context);
    UniversalData universalData = await firebaseServices.signUp(
      email: emailController.text,
      password: passwordController.text,
    );
    if (context.mounted) hideLoading(dialogContext: context);
    if (universalData.error.isEmpty) {
      if (context.mounted) {
        Navigator.pushReplacementNamed(context, RouteNames.tabBox);
        showConfirmMessage(
            message: "Welcome to Baraka Shop!", context: context);
      } else {
        if (context.mounted) {
          showErrorMessage(message: universalData.error, context: context);
        }
      }
    }
  }

  Future<void> loginUser(BuildContext context) async {
    showLoading(context: context);
    UniversalData universalData = await firebaseServices.login(
      email: emailController.text,
      password: passwordController.text,
    );
    if(context.mounted) hideLoading(dialogContext: context);
    if(universalData.error.isEmpty){
      if(context.mounted){
        Navigator.pushReplacementNamed(context, RouteNames.tabBox);
        showConfirmMessage(message: "Welcome back!", context: context);
      }else{
        if(context.mounted){
          showErrorMessage(message: universalData.error, context: context);
        }
      }
    }
  }

  Future<void> logOutUser(BuildContext context) async {
    showLoading(context: context);
    UniversalData universalData = await firebaseServices.logOutUser();

    if (universalData.error.isEmpty) {
      if (context.mounted) {
        showErrorMessage(message: universalData.error, context: context);
      }
    } else {
      if (context.mounted) {
        showErrorMessage(message: universalData.error, context: context);
      }
    }
  }



  // Future<void> signInWithGoogle(BuildContext context) async {
  //   showLoading(context: context);
  //   UniversalData universalData = await firebaseServices.signInWithGoogle();
  //
  //   if (universalData.error.isEmpty) {
  //     if (context.mounted) {
  //       manageMessage(context, "User Signed Up with Google.");
  //     }
  //   } else {
  //     if (context.mounted) {
  //       manageMessage(context, universalData.error);
  //     }
  //   }
  // }

  manageMessage(BuildContext context, String error) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error)));
     isLoading = false;
    notifyListeners();

  Future<void> logout(BuildContext context)async{
    showLoading(context: context);
    UniversalData universalData = await firebaseServices.logOutUser();
    if(context.mounted) hideLoading(dialogContext: context);
    if(universalData.error.isEmpty){
      if(context.mounted){
        Navigator.pop(context);
        showConfirmMessage(message: universalData.data as String, context: context);
      }else{
        if(context.mounted){
          showErrorMessage(message: universalData.error, context: context);
        }
      }
    }

  }
}}
