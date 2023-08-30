import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/common/constant/res/const_attribute.dart';
import 'package:portfolio/common/constant/res/const_color.dart';

class AppTheme {
  static const lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: kccPrimary,
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFE9DDFF),
    onPrimaryContainer: kccSecondary, // Color(0xFF22005D),
    secondary: Color(0xFF625B71),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFE8DEF8),
    onSecondaryContainer: Color(0xFF1E192B),
    tertiary: Color(0xFF7E5260),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFFFD9E3),
    onTertiaryContainer: Color(0xFF31101D),
    error: Color(0xFFBA1A1A),
    onError: Color(0xFFFFFFFF),
    errorContainer: Color(0xFFFFDAD6),
    onErrorContainer: Color(0xFF410002),
    outline: Color(0xFF7A757F),
    background: Color(0xFFFFFBFF),
    onBackground: kccSecondary, //Color(0xFF1C1B1E),
    surface: Color(0xFFFDF8FD),
    onSurface: Color(0xFF1C1B1E),
    surfaceVariant: Color(0xFFE7E0EB),
    onSurfaceVariant: Color(0xFF49454E),
    inverseSurface: Color(0xFF313033),
    onInverseSurface: Color(0xFFF4EFF4),
    inversePrimary: Color(0xFFCFBCFF),
    shadow: Color(0xFF000000),
    surfaceTint: kccSecondary, // Color(0xFF6750A4),
    outlineVariant: Color(0xFFCAC4CF),
    scrim: Color(0xFF000000),
  );

  static const darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: kccPrimary, //Color(0xFFCFBCFF),
    onPrimary: kccOnPrimary,
    primaryContainer: kccSecondary, //Color(0xFF4F378A),
    onPrimaryContainer: kccOnSecondary,
    secondary: kccSecondary, //Color(0xFFCBC2DB),
    onSecondary: kccOnSecondary,
    secondaryContainer: kccTertiary,
    onSecondaryContainer: kccOnTertiary,
    tertiary: kccTertiary, //Color(0xFFEFB8C8),
    onTertiary: kccOnTertiary,
    tertiaryContainer: Color(0xFF633B48),
    onTertiaryContainer: Color(0xFFFFD9E3),
    error: Color(0xFFFFB4AB),
    onError: Color(0xFF690005),
    errorContainer: Color(0xFF93000A),
    onErrorContainer: Color(0xFFFFDAD6),
    outline: kccSecondary,
    background: kccPrimary, //Color(0xFF1C1B1E),
    onBackground: Color(0xFFE6E1E6),
    surface: Color(0xFF141316),
    onSurface: Color(0xFFCAC5CA),
    surfaceVariant: Color(0xFF49454E),
    onSurfaceVariant: Color(0xFFCAC4CF),
    inverseSurface: Color(0xFFE6E1E6),
    onInverseSurface: Color(0xFF1C1B1E),
    inversePrimary: kccTertiary, //Color(0xFF6750A4),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFFCFBCFF),
    outlineVariant: Color(0xFF49454E),
    scrim: Color(0xFF000000),
  );

  static TextTheme textThemeDark = TextTheme(
    displayLarge: GoogleFonts.inter(
      color: kccWhite,
      fontSize: 50, //57,
      fontWeight: kcfbold,
    ),
    displayMedium: GoogleFonts.inter(
      color: kccWhite,
      fontSize: 40, //45,
      fontWeight: kcfregular,
    ),
    displaySmall: GoogleFonts.inter(
      color: kccWhite,
      fontSize: 36,
      fontWeight: kcfbold,
    ),
    headlineLarge: GoogleFonts.inter(
      color: kccWhite,
      fontSize: 32,
      fontWeight: kcfsemibold,
    ),
    headlineMedium: GoogleFonts.inter(
      color: kccWhite,
      fontSize: 28,
      fontWeight: kcfsemibold,
    ),
    headlineSmall: GoogleFonts.inter(
      color: kccWhite,
      fontSize: 24,
      fontWeight: kcfsemibold,
    ),
    titleLarge: GoogleFonts.inter(
      color: kccWhite,
      fontSize: 22,
      fontWeight: kcfbold,
    ),
    titleMedium: GoogleFonts.inter(
      color: kccWhite,
      fontSize: 20, //16,
      fontWeight: kcfbold,
    ),
    titleSmall: GoogleFonts.inter(
      color: kccWhite,
      fontSize: 18, //14,
      fontWeight: kcfbold,
    ),
    labelLarge: GoogleFonts.inter(
      color: kccWhite,
      fontSize: 14,
      fontWeight: kcfmedium,
    ),
    labelMedium: GoogleFonts.inter(
      color: kccWhite,
      fontSize: 12,
      fontWeight: kcfmedium,
    ),
    labelSmall: GoogleFonts.inter(
      color: kccWhite,
      fontSize: 11,
      fontWeight: kcfmedium,
    ),
    bodyLarge: GoogleFonts.inter(
      color: kccWhite,
      fontSize: 24, //16,
      fontWeight: kcfmedium,
    ),
    bodyMedium: GoogleFonts.inter(
      color: kccWhite,
      fontSize: 20, //14,
      fontWeight: kcfmedium,
    ),
    bodySmall: GoogleFonts.inter(
      color: kccWhite,
      fontSize: 18, //12,
      fontWeight: kcfmedium,
    ),
  );

  // final ThemeData _darkThemeCustom = ThemeData(
  //   primarySwatch: Colors.grey,
  //   brightness: Brightness.light,
  //   buttonTheme: const ButtonThemeData(
  //     buttonColor: kccBtnDark,
  //     disabledColor: kccBtnDisabled,
  //   ),
  // );
  // final ThemeData _lightThemeCustom = ThemeData(
  //   primarySwatch: kccPrimarySwatch,
  //   brightness: Brightness.light,
  //   buttonTheme: const ButtonThemeData(
  //     buttonColor: kccBtnLight,
  //     disabledColor: kccBtnDisabled,
  //   ),
  // );
}
