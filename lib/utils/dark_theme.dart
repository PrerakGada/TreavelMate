import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'palette.dart';

// ignore: non_constant_identifier_names
ThemeData dark_theme() => ThemeData(
      fontFamily: GoogleFonts.montserrat().fontFamily,
      appBarTheme: const AppBarTheme(
        backgroundColor: Palette.bgColor,
        systemOverlayStyle: SystemUiOverlayStyle(
            // systemStatusBarContrastEnforced: true,
            // statusBarColor: Colors.white,
            // statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
            // statusBarBrightness: Brightness.dark, // For iOS (dark icons)
            ),
      ),
      brightness: Brightness.dark,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: const TextTheme().apply(
        bodyColor: Colors.white,
        displayColor: Colors.white,
        fontSizeDelta: 11,
      ),
      scaffoldBackgroundColor: Palette.bgColor,
      primaryTextTheme: const TextTheme().apply(
        bodyColor: Colors.white,
        displayColor: Colors.white,
        fontSizeDelta: 11,
      ),

      // iconTheme: const IconThemeData(color: Palette.greyLight),
      // colorScheme: const ColorScheme.dark().copyWith(background: Palette.black),
    );
