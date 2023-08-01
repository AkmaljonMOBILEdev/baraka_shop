import 'package:baraka_shop/app/app_screen.dart';
import 'package:baraka_shop/ui/admin/tab_box/ad_tab_box.dart';
import 'package:baraka_shop/ui/admin/tab_box/categories/ad_category_screen.dart';
import 'package:baraka_shop/ui/admin/tab_box/products/ad_product_screen.dart';
import 'package:baraka_shop/ui/admin/tab_box/profile/ad_profile_screen.dart';
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
  static const String adTabBox = "/ad_tab_box";
  static const String adProduct = "/ad_product";
  static const String adCategory = "/ad_category";
  static const String adProfile = "/ad_profile";
}

class AppRoute{
  static Route generateRoute(RouteSettings settings){
    switch(settings.name){
      case RouteNames.splashScreen:
        return MaterialPageRoute(builder: (context)=>const SplashScreen());
      case RouteNames.appScreen:
        return MaterialPageRoute(builder: (context)=>const App());
      case RouteNames.loginScreen:
        return MaterialPageRoute(builder: (context)=> const LoginScreen());
      case RouteNames.signUpScreen:
        return MaterialPageRoute(builder: (context)=> const SignUpScreen());
      case RouteNames.tabBox:
        return MaterialPageRoute(builder: (context)=>const TabBox());
      case RouteNames.adTabBox:
        return MaterialPageRoute(builder: (context)=>const AdTabBox());
      case RouteNames.adProduct:
        return MaterialPageRoute(builder: (context)=>const AdProductScreen());
      case RouteNames.adCategory:
        return MaterialPageRoute(builder: (context)=>const AdCategoryScreen());
      case RouteNames.adProfile:
        return MaterialPageRoute(builder: (context)=>const AdProfileScreen());
      default:
        return MaterialPageRoute(builder: (context){
          return const Scaffold();
        });
    }
  }
}