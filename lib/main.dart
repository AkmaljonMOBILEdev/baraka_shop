import 'package:baraka_shop/ui/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return ScreenUtilInit(
        designSize: Size(screenSize.width, screenSize.height),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child){
      return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      );
    });
  }
}
