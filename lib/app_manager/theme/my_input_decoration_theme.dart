import 'package:flutter/material.dart';
import 'package:my_training_app/app_manager/constant/color_constant.dart';

class MyInputDecorationTheme {
  static InputDecorationTheme primary =   InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: ColorConstant.greyLight, width: 1.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: ColorConstant.greyLight, width: 2.0),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: ColorConstant.greyLight, width: 1.0),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: ColorConstant.greyLight, width: 2.0),
    ),
    hintStyle: TextStyle(
      color: ColorConstant.greyLight,
      fontSize: 14.0,
      fontWeight: FontWeight.normal
    ),
    contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
  );
}