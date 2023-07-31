import 'package:baraka_shop/utils/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../data/firebase/auth_service.dart';
import '../data/models/universal_data.dart';
import '../utils/ui_utils/loading_dialog.dart';


class AuthProvider with ChangeNotifier {

  AuthProvider({required this.firebaseServices}) {
    notifyy();
  }
  final AuthService firebaseServices;


  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  String email = '';
  String password = '';

  getNeeds() {
    email = emailController.text;
    password = passwordController.text;
  }

  signUpPressed(){
    usernameController.clear();
    emailController.clear();
    passwordController.clear();
  }
  loginPressed(){
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

  Future<void> signUpUser(BuildContext context) async {
    getNeeds();
    try {
      isLoading = true;
      notifyListeners();
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ).then((value){
        if(value.user!=null){
          return Navigator.pushReplacementNamed(context, RouteNames.tabBox);
        }
      });
      isLoading = false;
      notifyListeners();
    } on FirebaseException catch (error) {
      manageMessage(context, error.code);
      if (error.code == 'weak-password') {
        debugPrint('The password provided is too weak.');
      } else if (error.code == 'email-already-in-use') {
        debugPrint('The account already exists for that email.');
      }
    } catch (error) {
      manageMessage(context, error.toString());
    }
  }

  Future<void> login(BuildContext context) async {
    getNeeds();
    try{
      isLoading = true;
      notifyListeners();
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      ).then((value){
        if(value.user!=null){
          return Navigator.pushReplacementNamed(context, RouteNames.tabBox);
        }
      });
      isLoading=false;
      notifyListeners();
    }on FirebaseException catch(error){
      manageMessage(context, error.code);
      if (error.code == 'weak-password') {
        debugPrint('The password provided is too weak.');
      } else if (error.code == 'email-already-in-use') {
        debugPrint('The account already exists for that email.');
      }
    } catch (error) {
      manageMessage(context, error.toString());
    }

    }

  Future<void> logOut(BuildContext context)async{
    try{
      isLoading=true;
      notifyListeners();
      await FirebaseAuth.instance.signOut().then((value) => Navigator.pushReplacementNamed(context, RouteNames.loginScreen));
      isLoading=false;
      notifyListeners();
    }on FirebaseException catch(error){
      manageMessage(context, error.code);
      if (error.code == 'weak-password') {
        debugPrint('The password provided is too weak.');
      } else if (error.code == 'email-already-in-use') {
        debugPrint('The account already exists for that email.');
      }
    } catch (error) {
      manageMessage(context, error.toString());
    }
  }




  Future<void> signInWithGoogle(BuildContext context) async {
    showLoading(context: context);
    UniversalData universalData = await firebaseServices.signInWithGoogle();

    if (universalData.error.isEmpty) {
      if (context.mounted) {
        manageMessage(context, "User Signed Up with Google.");
      }
    } else {
      if (context.mounted) {
        manageMessage(context, universalData.error);
      }
    }
  }

  manageMessage(BuildContext context, String error) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error)));
    isLoading = false;
    notifyListeners();
  }
}

