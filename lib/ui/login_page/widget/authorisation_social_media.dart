import 'package:baraka_shop/utils/helper_sizebox_and_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../utils/app_images.dart';

class AuthorisationSocialMedia extends StatelessWidget {
  const AuthorisationSocialMedia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ZoomTapAnimation(
          child: Container(
              child: Image.asset(
            AppImages.facebook,
            height: 40.h,
            width: 40.w,
          )),
        ),
        24.pw,
        ZoomTapAnimation(child: Container(child: Image.asset(AppImages.google, height: 40.h, width: 40.w))),
        24.pw,
        ZoomTapAnimation(child: Container(child: Image.asset(AppImages.ios, height: 40.h, width: 40.w))),
      ],
    );
  }
}
