import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primary = Color(0xffFFBB3B);
  static const Color blackDark = Color(0xff000000);
  static const Color black = Color(0xff1A1A1A);
  static const Color gray = Color(0xffC6C6C6);
  static const Color white = Color(0xffffffff);
  static const Color darkGray = Color(0xff514F4F);

  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: blackDark,
      appBarTheme: AppBarTheme(
        backgroundColor: black,
        elevation: 0,
        centerTitle: true,
        foregroundColor: white,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: black,
          statusBarIconBrightness: Brightness.light,
        ),
        iconTheme: const IconThemeData(
          size: 30,
          color: white,
        ),
        titleTextStyle: GoogleFonts.inter(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: white,
        ),
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: primary,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: black,
        selectedItemColor: primary,
        unselectedItemColor: gray,
        elevation: 0,
      ),
      textTheme: TextTheme(
        titleLarge: GoogleFonts.inter(
          fontSize: 22,
          fontWeight: FontWeight.w400,
          color: white,
        ),
        titleMedium: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: white,
        ),
      ));
}
