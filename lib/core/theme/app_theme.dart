import 'package:cat_breeds_app/core/constants/palette.dart';
import 'package:cat_breeds_app/core/constants/text_styles.dart';
import 'package:flutter/material.dart' show ThemeData, Brightness, TextTheme;

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    scaffoldBackgroundColor: Palette.surface,
    textTheme: TextTheme(
      headlineSmall: AppTextStyle.headlineSmall,
      titleMedium: AppTextStyle.titleMedium,
      bodyMedium: AppTextStyle.bodyMedium,
      bodySmall: AppTextStyle.bodySmall,
      labelSmall: AppTextStyle.labelSmall,
    ),
  );
}