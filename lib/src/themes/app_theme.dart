import 'package:appsilon/src/themes/app_color.dart';
import 'package:appsilon/src/themes/app_size.dart';
import 'package:appsilon/src/themes/app_text.dart';
import 'package:flutter/material.dart';

final appTheme = ThemeData(
  scaffoldBackgroundColor: AppColor.lightGrey,
  brightness: Brightness.light,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: false,
    titleTextStyle: AppText.semiBold24.copyWith(
      color: AppColor.black,
    ),
  ),
  primaryColor: AppColor.lightBlue,
  fontFamily: 'Poppins',
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColor.lightBlue,
      elevation: 0,
      padding: const EdgeInsets.symmetric(
          horizontal: AppSize.paddingMedium, vertical: AppSize.paddingRegular),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppSize.borderRadiusMedium,
        ),
      ),
      textStyle: AppText.semiBold20,
    ),
  ),
);
