import 'package:bijak/app/theme/app_colors.dart';
import 'package:bijak/app/theme/text_styles.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData appTheme = ThemeData(
    appBarTheme: _appBarTheme,
  );

  static const AppBarTheme _appBarTheme = AppBarTheme(
      backgroundColor: AppColors.greenColor,
      centerTitle: true,
      titleTextStyle: TextStyles.appBarTextStyle);
}
