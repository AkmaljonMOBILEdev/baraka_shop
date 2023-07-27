import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/colors.dart';

class GlobalTextField extends StatelessWidget {
  GlobalTextField({
    Key? key,
    required this.hintText,
    required this.keyboardType,
    required this.textInputAction,
    required this.textAlign,
    this.obscureText = false,
    required this.controller,
    required this.icon,
  }) : super(key: key);

  final String hintText;
  TextInputType keyboardType;
  TextInputAction textInputAction;
  TextAlign textAlign;
  Icon icon;
  final bool obscureText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: Theme.of(context).textTheme.titleLarge,
      textAlign: textAlign,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.white,
        hintText: hintText,
        prefixStyle: TextStyle(color: AppColors.c_040415),
        prefixIcon: icon,
        hintStyle: Theme.of(context).textTheme.titleLarge!.copyWith(letterSpacing:1,fontSize: 16,color: AppColors.c_040415.withOpacity(0.2)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide:const BorderSide(width: 1, color: AppColors.white),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide:const BorderSide(
            width: 1,
            color: AppColors.white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide:const BorderSide(
            width: 1,
            color: AppColors.c_FC6828,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide:const BorderSide(
            width: 1,
            color: AppColors.white,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide:const BorderSide(
            width: 1,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}