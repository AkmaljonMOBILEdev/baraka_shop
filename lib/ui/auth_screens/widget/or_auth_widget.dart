import 'package:baraka_shop/utils/sizebox_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/colors.dart';


class OrAuthWidget extends StatelessWidget {
  const OrAuthWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return    Row(
      children: [
        Container(
          color: AppColors.c040415.withOpacity(0.2),
          width: 155.w,
          height: 1,
        ),
        9.pw,
        Text(
          "or",
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: AppColors.c040415),
        ),
        9.pw,
        Container(
          color: AppColors.c040415.withOpacity(0.2),
          width: 155.w,
          height: 1,
        ),
      ],
    );
  }
}
