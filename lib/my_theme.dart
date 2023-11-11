import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static Color primaryLight = Color(0xff5D9CEC);
  static Color backgroundLight = Color(0xffDFECDB);
  static Color whiteColor = Color(0xffffffff);
  static Color greenColor = Color(0xff61E757);
  static Color redColor = Color(0xffEC4B4B);
  static Color blackColor = Color(0xff383838);
  static Color backgroundDark = Color(0xff060E1E);
  static Color greyColor = Color(0xffC8C9CB);
  static Color blackDark = Color(0xff141922);

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: backgroundLight,
    appBarTheme: AppBarTheme(
      backgroundColor: primaryLight,
      elevation: 0
    ),
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.poppins(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: whiteColor,
      ),
      bodyMedium: GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: blackColor,
      ),
      bodySmall: GoogleFonts.poppins(
        fontSize: 18,
        color: blackColor,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: primaryLight,
      unselectedItemColor: greyColor,
      elevation: 0,
      backgroundColor: Colors.transparent
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      shape: StadiumBorder(
        side: BorderSide(
          color: whiteColor,
          width: 4
        )
      )
    )
  );
  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: backgroundDark,
      appBarTheme: AppBarTheme(
          backgroundColor: primaryLight,
          elevation: 0,
        centerTitle: true,
      ),
      textTheme: TextTheme(
        bodyLarge: GoogleFonts.poppins(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: whiteColor,
        ),
        bodyMedium: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: blackColor,
        ),
        bodySmall: GoogleFonts.poppins(
          fontSize: 18,
          color: blackColor,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: primaryLight,
          unselectedItemColor: whiteColor,
          elevation: 0,
          backgroundColor: Colors.transparent
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          shape: StadiumBorder(
              side: BorderSide(
                  color: blackColor,
                  width: 4
              )
          )
      )
  );
}
