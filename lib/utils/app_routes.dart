import 'package:baraka_shop/ui/auth_screens/login_screen.dart';
import 'package:baraka_shop/ui/auth_screens/sign_up_screen.dart';
import 'package:baraka_shop/ui/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

class RouteNames{
  static const String splashScreen = "/";
  static const String loginScreen = "/login_screen";
  static const String signUpScreen = "/sign_up_screen";
}

class AppRoute{
  static Route generateRoute(RouteSettings settings){
    switch(settings.name){
      case RouteNames.splashScreen:
        return MaterialPageRoute(builder: (context)=>const SplashScreen());
      case RouteNames.loginScreen:
        return MaterialPageRoute(builder: (context)=>const LoginScreen());
      case RouteNames.signUpScreen:
        return MaterialPageRoute(builder: (context)=>const SignUpScreen());
      default:
        return MaterialPageRoute(builder: (context){
          return const Scaffold();
        });
    }
  }
}