import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData LightTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: GoogleFonts.lato().fontFamily,
        appBarTheme: AppBarTheme(
          color: Colors.white, elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          toolbarTextStyle: Theme.of(context).textTheme.bodyText2,
          titleTextStyle: Theme.of(context).textTheme.headline6,
          //primaryTextTheme: GoogleFonts.latoTextTheme()
        ),
      );

  static ThemeData darktheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: GoogleFonts.lato().fontFamily,
        appBarTheme: AppBarTheme(
          color: Colors.white, elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          toolbarTextStyle: Theme.of(context).textTheme.bodyText2,
          titleTextStyle: Theme.of(context).textTheme.headline6,
          //primaryTextTheme: GoogleFonts.latoTextTheme()
        ),
      );
  static Color creamColor = Color(0xfff5f5f5);
  static Color darkBluishColor = Color(0xff403b58);
  static Color whitebluecolor = Color(0xFFE3F2FD);
  static Color whitecolor = Color(0xFFFFFFFF);
  static Color yellowcolor = Color(0xFFFFE57F);
  static Color violetcolor = Color(0xFF9575CD);
}
