
import 'dart:io';
import 'package:baraka_shop/data/firebase/order_service.dart';
import 'package:baraka_shop/data/firebase/profile_service.dart';

import 'package:baraka_shop/data/firebase/auth_services.dart';

import 'package:baraka_shop/providers/auth_provider.dart';
import 'package:baraka_shop/providers/category_provider.dart';
import 'package:baraka_shop/providers/order_provider.dart';
import 'package:baraka_shop/providers/products_provider.dart';
import 'package:baraka_shop/providers/profiles_provider.dart';
import 'package:baraka_shop/utils/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'app/auth_service.dart';
import 'data/firebase/category_service.dart';
import 'data/firebase/products_service.dart';

Future<void> main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => AuthProvider(firebaseServices: AuthServices()),
        lazy: true,
      ),
     ChangeNotifierProvider(
       lazy: true,
       create: (context)=>ProfileProvider(profileService: ProfileService(),
     ),),
      ChangeNotifierProvider(
        create: (context) => ProductsProvider(ProductService()),
        lazy: true,
      ),
      ChangeNotifierProvider(
        create: (context) =>
            ProfileProvider(profileService: ProfileService()),
        lazy: true,
      ),
      ChangeNotifierProvider(
        create: (context) =>
            CategoryProvider(categoryService: CategoryService()),
        lazy: true,
      ),
      // ChangeNotifierProvider(
      //   create: (context) =>
      //       OrderProvider( OrderService()),
      //   create: (context) => AuthProvider( firebaseServices:  AuthServices()),
      //
      //   lazy: true,
      // ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print(Platform.version);
    Size screenSize = MediaQuery.of(context).size;
    return ScreenUtilInit(
        designSize: Size(screenSize.width, screenSize.height),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
          return  MaterialApp(
            theme: ThemeData.dark(),
            debugShowCheckedModeBanner: false,
            initialRoute: RouteNames.splashScreen,
            onGenerateRoute: AppRoute.generateRoute,
          );
        });
  }
}
