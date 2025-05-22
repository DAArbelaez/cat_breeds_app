import 'package:cat_breeds_app/core/constants/dimens.dart';
import 'package:cat_breeds_app/core/constants/palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  static TextStyle headlineSmall = GoogleFonts.poppins(
    fontSize: Dimens.d24,
    fontWeight: FontWeight.w700,
    color: Palette.textColor,
  );

  static TextStyle titleMedium = GoogleFonts.poppins(
    fontSize: Dimens.d18,
    fontWeight: FontWeight.w700,
    color: Palette.textColor,
  );

  static TextStyle bodyMedium = GoogleFonts.poppins(
    fontSize: Dimens.d16,
    fontWeight: FontWeight.w400,
    color: Palette.textColor,
  );

  static TextStyle bodySmall = GoogleFonts.poppins(
    fontSize: Dimens.d14,
    fontWeight: FontWeight.w400,
    color: Palette.textColor,
  );

  static TextStyle labelSmall = GoogleFonts.poppins(
    fontSize: Dimens.d12,
    fontWeight: FontWeight.w400,
    color: Palette.textColor,
  );

  static TextStyle buttonMedium = GoogleFonts.poppins(
    fontSize: Dimens.d18,
    fontWeight: FontWeight.w500,
    color: Palette.textColor,
  );

  static TextStyle buttonSmall = GoogleFonts.poppins(
    fontSize: Dimens.d16,
    fontWeight: FontWeight.w500,
    color: Palette.textColor,
  );
}
