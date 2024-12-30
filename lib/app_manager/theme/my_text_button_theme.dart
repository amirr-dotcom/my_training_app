import 'package:flutter/material.dart';
import 'package:my_training_app/app_manager/constant/color_constant.dart';

class MyTextButtonTheme {

  static TextButtonThemeData primary =  TextButtonThemeData(
    style: TextButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2),
      ),
      foregroundColor: ColorConstant.white,
      backgroundColor: ColorConstant.primary,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      textStyle: const TextStyle(fontSize: 16 ),
    ),
  );

  static TextButtonThemeData grey =  TextButtonThemeData(
    style: TextButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
        side: const BorderSide(
          color: ColorConstant.grey,
          width: 1.0,
        ),
      ),
      foregroundColor: ColorConstant.grey,
      padding: const EdgeInsets.all(0),
      textStyle: const TextStyle(fontSize: 14 ),
    ),
  );
}