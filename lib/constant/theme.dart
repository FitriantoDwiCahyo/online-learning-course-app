import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

/// white background
const Color primaryBackground = Color.fromARGB(255, 255, 255, 255);

/// grey background
const Color primarySecondaryBackground = Color.fromARGB(255, 247, 247, 249);

/// main widget color blue
const Color primaryElement = Color.fromARGB(255, 61, 61, 216);

/// main text color black
const Color primaryText = Color.fromARGB(255, 0, 0, 0);
// video background color
const Color primary_bg = Color.fromARGB(210, 32, 47, 62);

/// main widget text color white
const Color primaryElementText = Color.fromARGB(255, 255, 255, 255);
// main widget text color grey
const Color primarySecondaryElementText = Color.fromARGB(255, 102, 102, 102);
// main widget third color grey
const Color primaryThreeElementText = Color.fromARGB(255, 170, 170, 170);

const Color primaryFourElementText = Color.fromARGB(255, 204, 204, 204);
//state color
const Color primaryElementStatus = Color.fromARGB(255, 88, 174, 127);

const Color primaryElementBg = Color.fromARGB(255, 238, 121, 99);

ThemeData lightMode = ThemeData(
  scaffoldBackgroundColor: primaryBackground,
  appBarTheme: const AppBarTheme(
    centerTitle: true,
  ),
  textTheme: TextTheme(
    displayMedium:
        GoogleFonts.poppins(color: primaryText), // font size default : 45sp
    headlineSmall:
        GoogleFonts.poppins(color: primaryText), // font size default : 24sp
    titleMedium: GoogleFonts.poppins(color: primaryText), // 16sp
    titleSmall: GoogleFonts.poppins(color: primaryText), // 14sp
    bodyMedium:
        GoogleFonts.poppins(color: primaryText), // font size defautl : 14sp
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: primaryElement,
      textStyle: GoogleFonts.poppins(color: primaryElementText,fontWeight: FontWeight.bold),
      padding: EdgeInsets.symmetric(vertical: 18.h),
      foregroundColor: primaryElementText,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      textStyle: GoogleFonts.poppins(color: primaryElementText,fontWeight: FontWeight.bold),
      padding: EdgeInsets.symmetric(vertical: 18.h),
      foregroundColor: primaryText,
    ),
  ),
);
