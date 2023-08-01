import 'package:animate_do/animate_do.dart';
import 'package:baraka_shop/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../utils/icons.dart';
import '../../utils/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _init() async {
    await Future.delayed(const Duration(seconds: 2));

    if (context.mounted) {
      Navigator.pushReplacementNamed(
        context, RouteNames.appScreen
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
      backgroundColor: AppColors.c442C2E,
      appBar: AppBar(
        backgroundColor: AppColors.c442C2E,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FadeInRight(
              child: SizedBox(
                height: 120.h,
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 140.h),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 25,
                        bottom: 80,
                        child: SvgPicture.asset(AppIcons.splashHelperLogo,fit: BoxFit.cover,),
                      ),
                      Positioned(
                        top: 25.h,
                        left: 3.w,
                        child: SvgPicture.asset(
                          AppIcons.splashMainLogo,
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
                                  color: AppColors.cFEEAE6,
                                ),),
                      )
                    ],
                  ),
                ),
              ),
            ),
            FadeInLeft(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "baraka shop",
                  style: Theme.of(context).textTheme.headlineMedium
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
