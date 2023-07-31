import 'package:flutter/material.dart';

import '../colors.dart';



class CustomCircularProgressIndicator extends StatelessWidget {
  final double? strokeWidth;
 final BuildContext? context;

class CustomCircularProgressIndicator extends StatelessWidget {
  final double? strokeWidth;


  const CustomCircularProgressIndicator({
    super.key,
    this.strokeWidth,

    this.context

  });

  @override
  Widget build(BuildContext context) {
    if (strokeWidth == 4.0 || strokeWidth == null) {

      return CircularProgressIndicator(
        strokeWidth: 5,
        valueColor: AlwaysStoppedAnimation<Color>(AppColors.c040415),

      return const CircularProgressIndicator(
        strokeWidth: 2,

      );
    } else {
      return CircularProgressIndicator(
        strokeWidth: strokeWidth!,

        valueColor: AlwaysStoppedAnimation<Color>(AppColors.white),

        valueColor: const AlwaysStoppedAnimation<Color>(AppColors.white),

      );
    }
  }
}
