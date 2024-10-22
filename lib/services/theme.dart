import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

Color primaryColor = const Color(0xFFE42323);
Color secondaryColor = const Color(0xFF263238);
Color boxColor = const Color(0xFF455A64);
Color backgroundDark = const Color(0xFF273443);
Color backgroundLight = const Color(0xffffffff);

const Color textPrimary = Color(0xff000000);
const Color textSecondary = Color(0xff838383);
const Color textBrown = Color(0xff362D2D);

class CustomTheme {
  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    colorScheme: ColorScheme.light(
      primary: primaryColor,
      background: backgroundLight, // Set the background color here
    ),
    drawerTheme: DrawerThemeData(
        backgroundColor: backgroundLight, surfaceTintColor: backgroundLight),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.white,
      titleTextStyle: GoogleFonts.montserrat(),
      iconTheme: const IconThemeData(),
      systemOverlayStyle: const SystemUiOverlayStyle(
        // Status bar color
        statusBarColor: Colors.transparent,
        // // Status bar brightness (optional)
        statusBarIconBrightness: Brightness.dark,

        // statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        // statusBarBrightness: Brightness.light, // For iOS (dark icons)
      ),
    ),
    // Set scaffold background color

    fontFamily: 'Montserrat',
    textTheme: const TextTheme(
      labelLarge: TextStyle(fontWeight: FontWeight.bold),
      displayLarge: TextStyle(fontWeight: FontWeight.bold),
      displayMedium: TextStyle(fontWeight: FontWeight.bold),
      displaySmall: TextStyle(fontWeight: FontWeight.bold),
      titleLarge: TextStyle(fontWeight: FontWeight.bold),
      titleMedium: TextStyle(fontWeight: FontWeight.bold),
      titleSmall: TextStyle(fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(fontWeight: FontWeight.bold),
      bodyMedium: TextStyle(fontWeight: FontWeight.bold),
      bodySmall: TextStyle(fontWeight: FontWeight.bold),
    ),
  );
  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    colorScheme: ColorScheme.dark(
      primary: primaryColor,
      background: backgroundDark, // Set the background color here
    ),
    // cardColor: const Color.fromARGB(255, 33, 45, 56),
    scaffoldBackgroundColor: backgroundDark,
    drawerTheme: DrawerThemeData(
        backgroundColor: backgroundDark, surfaceTintColor: backgroundDark),
    appBarTheme: AppBarTheme(
      backgroundColor: backgroundDark,
      surfaceTintColor: backgroundDark,
      titleTextStyle: GoogleFonts.montserrat(),
      iconTheme: const IconThemeData(),
      systemOverlayStyle: const SystemUiOverlayStyle(
        // Status bar color
        statusBarColor: Colors.transparent,
        // // Status bar brightness (optional)
        statusBarIconBrightness: Brightness.dark,
        // statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        // statusBarBrightness: Brightness.light, // For iOS (dark icons)
      ),
    ),
    fontFamily: 'Montserrat',
    textTheme: const TextTheme(
      labelLarge: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      displayLarge: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      displayMedium:
          TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      displaySmall: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      titleLarge: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      titleMedium: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      titleSmall: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      bodyLarge: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      bodyMedium: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      bodySmall: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
    ),
  );
}
