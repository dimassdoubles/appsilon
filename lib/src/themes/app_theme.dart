import 'package:appsilon/src/themes/app_color.dart';
import 'package:appsilon/src/themes/app_size.dart';
import 'package:appsilon/src/themes/app_text.dart';
import 'package:flutter/material.dart';

final appTheme = ThemeData(
  scaffoldBackgroundColor: AppColor.lightGrey,
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
