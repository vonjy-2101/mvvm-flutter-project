import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: ColorAppThemeData.lightPrimary,
    scaffoldBackgroundColor: ColorAppThemeData.lightBg,
    appBarTheme: AppBarTheme(
        backgroundColor: ColorAppThemeData.lightPrimary,
        foregroundColor: const Color.fromARGB(255, 31, 31, 31)
    ),
    textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.black),
    ),
    fontFamily: GoogleFonts.acme().fontFamily
);

final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: ColorAppThemeData.darkPrimary,
    scaffoldBackgroundColor: ColorAppThemeData.darkBg,
    appBarTheme: AppBarTheme(
        backgroundColor: ColorAppThemeData.darkPrimary,
        foregroundColor: Colors.white,
    ),
    textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.white),
    ),
    fontFamily: GoogleFonts.acme().fontFamily
);

//Riverpod for theme app
final themeModeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.system);


class ColorAppThemeData {

    static Color colorFromHex(String hexColor) {
        final hexCode = hexColor.replaceAll('#', '');
        return Color(int.parse('FF$hexCode', radix: 16));
    }

    static Color darkBg = colorFromHex('#111827');
    static Color darkPrimary = colorFromHex("#1f2937");

    static Color lightBg = colorFromHex('#e2edf1');
    static Color lightPrimary = colorFromHex("#ffffff");
    

}