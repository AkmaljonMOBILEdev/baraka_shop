import 'package:baraka_shop/app/app_screen.dart';
import 'package:baraka_shop/ui/auth_screens/login_screen.dart';
import 'package:baraka_shop/ui/auth_screens/sign_up_screen.dart';
import 'package:baraka_shop/ui/splash_screen/splash_screen.dart';
import 'package:baraka_shop/ui/tab_box/tab_box.dart';
import 'package:flutter/material.dart';

class RouteNames{
  static const String splashScreen = "/";
  static const String appScreen = "/app_screen";
  static const String loginScreen = "/login_screen";
  static const String signUpScreen = "/sign_up_screen";
  static const String tabBox = "/tab_box";
}

class AppRoute{
  static Route generateRoute(RouteSettings settings){
    switch(settings.name){
      case RouteNames.splashScreen:
        return MaterialPageRoute(builder: (context)=>const SplashScreen());
      case RouteNames.appScreen:
        return MaterialPageRoute(builder: (context)=>const App());
      // case RouteNames.loginScreen:
      //   return MaterialPageRoute(builder: (context)=>const LoginPage());
      // case RouteNames.signUpScreen:
      //   return MaterialPageRoute(builder: (context)=>const SignUpPage());
      case RouteNames.tabBox:
        return MaterialPageRoute(builder: (context)=>const TabBox());
      default:
        return MaterialPageRoute(builder: (context){
          return const Scaffold();
        });
    }
  }
}