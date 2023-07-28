import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class GlobalLogoName extends StatelessWidget {
  const GlobalLogoName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Text(
      "Baraka Shop",
      style: Theme.of(context)
          .textTheme
          .titleLarge!
          .copyWith(
        fontFamily: 'Capriola',
        letterSpacing: 1.0,
          fontWeight: FontWeight.w900,
          fontSize: 35,
          color: AppColors.white,
      ),
    );
  }
}
