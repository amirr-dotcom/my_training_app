import 'package:flutter/material.dart';
import 'package:my_training_app/app_manager/theme/my_color_scheme.dart';
import 'package:my_training_app/app_manager/theme/my_text_button_theme.dart';
import 'package:my_training_app/app_manager/theme/my_text_theme.dart';

class MyThemeData {
  static ThemeData primary = ThemeData(
    useMaterial3: true,
    colorScheme: MyColorScheme.primary,
    textTheme: MyTextTheme.primary,
    textButtonTheme: MyTextButtonTheme.primary
  );
}
