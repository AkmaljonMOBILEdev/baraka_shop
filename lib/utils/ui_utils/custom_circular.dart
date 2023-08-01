import 'package:flutter/material.dart';

import '../colors.dart';



class CustomCircularProgressIndicator extends StatelessWidget {
  final double? strokeWidth;
 final BuildContext? context;




  const CustomCircularProgressIndicator({
    super.key,
    this.strokeWidth,

    this.context

  });

  @override
  Widget build(BuildContext context) {
    if (strokeWidth == 4.0 || strokeWidth == null) {

      return const CircularProgressIndicator(
        strokeWidth: 5,
        valueColor: AlwaysStoppedAnimation<Color>(AppColors.c040415),

      );
    } else {
      return const CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(AppColors.white),


      );
    }
  }
}
