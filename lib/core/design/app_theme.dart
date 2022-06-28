import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:valorant_pocket_guide/core/design/app_colors.dart';

ThemeData theme() {
  return ThemeData(
    textTheme: TextTheme(
      headline1: TextStyle(
        color: AppColors.white,
        fontWeight: FontWeight.normal,
        fontSize: 44,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      headline2: TextStyle(
        color: AppColors.white,
        fontWeight: FontWeight.normal,
        fontSize: 24,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      headline3: TextStyle(
        color: AppColors.white,
        fontWeight: FontWeight.normal,
        fontSize: 20,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      headline4: TextStyle(
        color: AppColors.white,
        fontWeight: FontWeight.normal,
        fontSize: 18,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      headline5: TextStyle(
        color: AppColors.white,
        fontWeight: FontWeight.normal,
        fontSize: 16,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      headline6: TextStyle(
        color: AppColors.white,
        fontWeight: FontWeight.normal,
        fontSize: 4,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      headlineSmall: TextStyle(
        color: AppColors.white,
        fontWeight: FontWeight.normal,
        fontSize: 12,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
    ),
  );
}
