import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../ui/login_page/login_page.dart';
import '../utils/app_svg.dart';
import '../utils/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _init() async {
    await Future.delayed(const Duration(seconds: 10));

    if (context.mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return LoginPage();
          },
        ),
      );
    }
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c_FC6828,
      appBar: AppBar(
        backgroundColor: AppColors.c_FC6828,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 120.h,
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 140.h),
                child: Stack(
                  children: [
                    Positioned(
                      left: 25,
                      bottom: 80,
                      child: SvgPicture.asset(AppSvg.brandTut,fit: BoxFit.cover,),
                    ),
                    Positioned(
                      top: 25.h,
                      left: 3.w,
                      child: SvgPicture.asset(
                        AppSvg.brandSumka,
                      ),
                    ),
                    Positioned(
                      top: 45.h,
                      left: 30.w,
                      child: Text("b",
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                            fontSize: 40,
                            fontWeight: FontWeight.w800,
                                color: AppColors.c_FC6828,
                              ),),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "baraka shop",
                style: Theme.of(context).textTheme.headlineMedium
              ),
            ),
          ],
        ),
      ),
    );
  }
}
