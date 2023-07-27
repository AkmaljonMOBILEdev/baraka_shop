import 'package:baraka_shop/utils/helper_sizebox_and_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_images.dart';

class AuthorisationSocialMedia extends StatelessWidget {
  const AuthorisationSocialMedia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Image.asset(
            AppImages.facebook,
            height: 40.h,
            width: 40.w,
          ),
          24.pw,
          Image.asset(AppImages.google, height: 40.h, width: 40.w),
          24.pw,
          Image.asset(AppImages.ios, height: 40.h, width: 40.w),
        ],
      ),
    );
  }
}
