import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTypography {
  AppTypography._();

  static TextTheme textTheme = TextTheme(
    /// HEADINGS → League Spartan
    displayLarge: GoogleFonts.leagueSpartan(
      fontSize: 57,
      fontWeight: FontWeight.bold,
    ),

    displayMedium: GoogleFonts.leagueSpartan(
      fontSize: 45,
      fontWeight: FontWeight.bold,
    ),

    headlineLarge: GoogleFonts.leagueSpartan(
      fontSize: 32,
      fontWeight: FontWeight.w700,
    ),

    headlineMedium: GoogleFonts.leagueSpartan(
      fontSize: 28,
      fontWeight: FontWeight.w700,
    ),

    /// BODY → Poppins
    bodyLarge: GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),

    bodyMedium: GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),

    bodySmall: GoogleFonts.poppins(
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),

    labelLarge: GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
  );
}
