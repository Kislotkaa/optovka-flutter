import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.backGroundColorLight,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: AppColors.primaryConst,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      titleTextStyle: TextStyle(color: Color.fromRGBO(24, 26, 31, 1)),
      actionsIconTheme: IconThemeData(color: AppColors.textColorLight),
      iconTheme: IconThemeData(color: AppColors.textColorLight),
    ),
    primaryColorDark: AppColors.textColorLight,
    iconTheme: const IconThemeData(color: AppColors.textColorLight),
    primaryIconTheme: const IconThemeData(color: AppColors.textColorLight),
    highlightColor: Colors.transparent,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(
          AppColors.primaryConst,
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          const TextStyle(color: AppColors.textColorLight),
        ),
      ),
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.primaryConst,
      circularTrackColor: Colors.transparent,
    ),
    primaryColor: AppColors.primaryConst,
    backgroundColor: AppColors.backGroundColorLight,
    dividerColor: AppColors.dividerColorLight,
    cardColor: AppColors.cardColorLight,
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(secondary: AppColors.secondaryColorLight),
    textTheme: const TextTheme(
      subtitle1: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: AppColors.textColorLight,
      ),
      subtitle2: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.normal,
        color: AppColors.greyConst,
      ),
      bodyText1: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: AppColors.textColorLight,
      ),
      bodyText2: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: AppColors.textColorLight,
      ),
      headline1: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.normal,
        color: AppColors.textColorLight,
      ),
      headline2: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppColors.textColorLight,
      ),
      headline3: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.normal,
        color: AppColors.textColorLight,
      ),
      headline4: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: AppColors.textColorLight,
      ),
      headline5: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.normal,
        color: AppColors.textColorLight,
      ),
      headline6: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: AppColors.textColorLight,
      ),
      caption: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: AppColors.greyConst,
      ),
    ),
  );
}
