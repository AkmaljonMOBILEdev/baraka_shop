import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'colors.dart';

class AppTheme{
  static ThemeData lightTheme=ThemeData(
      scaffoldBackgroundColor: AppColors.c246EE9,
      appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: AppColors.c246EE9,
          titleTextStyle: TextStyle(
              color: AppColors.c442C2E
          ),
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: AppColors.c246EE9,
              statusBarBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.dark
          )
      ),
      textTheme:  TextTheme(
        //display
          displayLarge: TextStyle(
              color: AppColors.c442C2E,
              fontSize: 57.sp,
              fontWeight: FontWeight.w800,
              fontFamily: 'Capriola'
          ),
          displayMedium: TextStyle(
              color: AppColors.c442C2E,
              fontSize: 45.sp,
              fontWeight: FontWeight.w700,
              fontFamily: 'Capriola'
          ),
          displaySmall: TextStyle(
              color: AppColors.c442C2E,
              fontSize: 36.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'Capriola'
          ),
          //headline
          headlineLarge: TextStyle(
              color: AppColors.c442C2E,
              fontSize: 32.sp,
              fontWeight: FontWeight.w700,
              fontFamily: 'Capriola'
          ),
          headlineMedium: TextStyle(
              color: AppColors.c442C2E,
              fontSize: 28.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'Capriola'
          ),
          headlineSmall: TextStyle(
              color: AppColors.c442C2E,
              fontSize: 24.sp,
              fontWeight: FontWeight.w400,
              fontFamily: 'Capriola'
          ),
          //title
          titleLarge: TextStyle(
              color: AppColors.c442C2E,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'Capriola'
          ),
          titleMedium: TextStyle(
              color: AppColors.c442C2E,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'Capriola'
          ),
          titleSmall: TextStyle(
              color: AppColors.c442C2E,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'Capriola'
          ),
          //label
          labelLarge: TextStyle(
              color: AppColors.black,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'Capriola'
          ),
          labelMedium: TextStyle(
              color: AppColors.c442C2E,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'Capriola'
          ),
          labelSmall: TextStyle(
              color: AppColors.c442C2E,
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'Capriola'
          ),
          //body
          bodyLarge: TextStyle(
              color: AppColors.c442C2E,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'Capriola'
          ),
          bodyMedium: TextStyle(
              color: AppColors.c442C2E,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'Capriola'
          ),
          bodySmall: TextStyle(
              color: AppColors.c442C2E,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'Capriola'
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
              fontFamily: 'Capriola'
          ),
          displayMedium: TextStyle(
              color: AppColors.white,
              fontSize: 45.sp,
              fontWeight: FontWeight.w700,
              fontFamily: 'Capriola'
          ),
          displaySmall: TextStyle(
              color: AppColors.white,
              fontSize: 36.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'Capriola'
          ),
          //headline
          headlineLarge: TextStyle(
              color: AppColors.white,
              fontSize: 32.sp,
              fontWeight: FontWeight.w700,
              fontFamily: 'Capriola'
          ),
          headlineMedium: TextStyle(
              color: AppColors.white,
              fontSize: 28.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'Capriola'
          ),
          headlineSmall: TextStyle(
              color: AppColors.white,
              fontSize: 24.sp,
              fontWeight: FontWeight.w400,
              fontFamily: 'Capriola'

          ),
          //title
          titleLarge: TextStyle(
              color: AppColors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'Capriola'
          ),
          titleMedium: TextStyle(
              color: AppColors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'Capriola'
          ),
          titleSmall: TextStyle(
              color: AppColors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'Capriola'
          ),
          //label
          labelLarge: TextStyle(
              color: AppColors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'Capriola'
          ),
          labelMedium: TextStyle(
              color: AppColors.white,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'Capriola'
          ),
          labelSmall: TextStyle(
              color: AppColors.white,
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'Capriola'
          ),
          //body
          bodyLarge: TextStyle(
              color: AppColors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'Capriola'
          ),
          bodyMedium: TextStyle(
              color: AppColors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'Capriola'
          ),
          bodySmall: TextStyle(
              color: AppColors.white,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'Capriola'
          )

      )
  );
}