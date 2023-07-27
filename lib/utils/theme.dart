import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'colors.dart';

class AppTheme{
  static ThemeData lightTheme=ThemeData(
      scaffoldBackgroundColor: AppColors.white,
      appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: AppColors.white,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: AppColors.white,
              statusBarBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.dark
          )
      ),
      textTheme:  TextTheme(
        //display
          displayLarge: TextStyle(
              color: AppColors.black,
              fontSize: 57.sp,
              fontWeight: FontWeight.w800,
              fontFamily: 'Spartan'
          ),
          displayMedium: TextStyle(
              color: AppColors.black,
              fontSize: 45.sp,
              fontWeight: FontWeight.w700,
              fontFamily: 'Poppins'
          ),
          displaySmall: TextStyle(
              color: AppColors.black,
              fontSize: 36.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'Spartan'
          ),
          //headline
          headlineLarge: TextStyle(
              color: AppColors.black,
              fontSize: 32.sp,
              fontWeight: FontWeight.w700,
              fontFamily: 'Spartan'
          ),
          headlineMedium: TextStyle(
              color: AppColors.black,
              fontSize: 28.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'Spartan'
          ),
          headlineSmall: TextStyle(
              color: AppColors.black,
              fontSize: 24.sp,
              fontWeight: FontWeight.w400,
              fontFamily: 'Spartan'
          ),
          //title
          titleLarge: TextStyle(
              color: AppColors.black,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'Spartan'
          ),
          titleMedium: TextStyle(
              color: AppColors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'Spartan'
          ),
          titleSmall: TextStyle(
              color: AppColors.black,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'Spartan'
          ),
          //label
          labelLarge: TextStyle(
              color: AppColors.black,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'Spartan'
          ),
          labelMedium: TextStyle(
              color: AppColors.black,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'Spartan'
          ),
          labelSmall: TextStyle(
              color: AppColors.black,
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'Spartan'
          ),
          //body
          bodyLarge: TextStyle(
              color: AppColors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'Spartan'
          ),
          bodyMedium: TextStyle(
              color: AppColors.black,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'Spartan'
          ),
          bodySmall: TextStyle(
              color: AppColors.black,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'Spartan'
          )

      )
  );

  static ThemeData darkTheme=ThemeData(
      scaffoldBackgroundColor: AppColors.black,
      appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.black,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: AppColors.black,
              statusBarBrightness: Brightness.light,
              statusBarIconBrightness: Brightness.light
          )
      ),
      textTheme:  TextTheme(
        //display
          displayLarge: TextStyle(
              color: AppColors.white,
              fontSize: 57.sp,
              fontWeight: FontWeight.w800,
              fontFamily: 'Spartan'
          ),
          displayMedium: TextStyle(
              color: AppColors.white,
              fontSize: 45.sp,
              fontWeight: FontWeight.w700,
              fontFamily: 'Spartan'
          ),
          displaySmall: TextStyle(
              color: AppColors.white,
              fontSize: 36.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'Spartan'
          ),
          //headline
          headlineLarge: TextStyle(
              color: AppColors.white,
              fontSize: 32.sp,
              fontWeight: FontWeight.w700,
              fontFamily: 'Spartan'
          ),
          headlineMedium: TextStyle(
              color: AppColors.white,
              fontSize: 28.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'Spartan'
          ),
          headlineSmall: TextStyle(
              color: AppColors.white,
              fontSize: 24.sp,
              fontWeight: FontWeight.w400,
              fontFamily: 'Spartan'

          ),
          //title
          titleLarge: TextStyle(
              color: AppColors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'Spartan'
          ),
          titleMedium: TextStyle(
              color: AppColors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'Spartan'
          ),
          titleSmall: TextStyle(
              color: AppColors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'Spartan'
          ),
          //label
          labelLarge: TextStyle(
              color: AppColors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'Spartan'
          ),
          labelMedium: TextStyle(
              color: AppColors.white,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'Spartan'
          ),
          labelSmall: TextStyle(
              color: AppColors.white,
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'Spartan'
          ),
          //body
          bodyLarge: TextStyle(
              color: AppColors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'Spartan'
          ),
          bodyMedium: TextStyle(
              color: AppColors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'Spartan'
          ),
          bodySmall: TextStyle(
              color: AppColors.white,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'Spartan'
          )

      )
  );
}