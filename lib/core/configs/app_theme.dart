import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal_page/core/constants/colors.dart';

class AppTheme {
  //? light theme config
  ThemeData lightTheme = ThemeData();

  //? dark theme config
  ThemeData darkTheme = ThemeData(
    fontFamily: "poppins",
    brightness: Brightness.dark,
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: whiteColor,
      onPrimary: blackColor,
      secondary: whiteColor,
      onSecondary: blackColor,
      error: redColor,
      onError: whiteColor,
      surface: darkGray50,
      onSurface: whiteColor,
    ),

    scaffoldBackgroundColor: darkGrayDefault,

    dividerColor: darkGray50,
    dividerTheme: DividerThemeData(
      color: darkGray100,
      thickness: 2.r,
      space: 2.r,
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      iconTheme: IconThemeData(color: darkGray900),
    ),

    chipTheme: ChipThemeData(
      backgroundColor: darkGray200,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
        side: BorderSide(color: darkGray200),
      ),
    ),

    cardTheme: CardThemeData(color: darkGray100),

    textTheme: TextTheme(
      bodyLarge: TextStyle(color: darkGray900),
      bodyMedium: TextStyle(color: darkGray600),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: darkGray900,
        foregroundColor: darkGrayDefault,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
    ),
  );
}
