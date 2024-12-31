import 'package:flutter/material.dart';

class MyBottomSheetTheme {
  static BottomSheetThemeData primary =  const BottomSheetThemeData(
    backgroundColor: Colors.white,
    elevation: 10,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(0),
      ),
    ),
  );
}