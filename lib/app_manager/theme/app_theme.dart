import 'package:flutter/material.dart';
import 'package:my_training_app/app_manager/constant/app_constant.dart';
import 'package:my_training_app/app_manager/theme/my_bottom_sheet_theme.dart';
import 'package:my_training_app/app_manager/theme/my_color_scheme.dart';
import 'package:my_training_app/app_manager/theme/my_input_decoration_theme.dart';
import 'package:my_training_app/app_manager/theme/my_text_button_theme.dart';
import 'package:my_training_app/app_manager/theme/my_text_theme.dart';

class MyThemeData {
  static ThemeData primary = ThemeData(
    useMaterial3: true,
    fontFamily: AppConstant.fontFamily,
    colorScheme: MyColorScheme.primary,
    textTheme: MyTextTheme.primary,
    textButtonTheme: MyTextButtonTheme.primary,
    bottomSheetTheme: MyBottomSheetTheme.primary,
    inputDecorationTheme: MyInputDecorationTheme.primary,
  );
}
