import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

final ThemeData redWineThemeLight = FlexThemeData.light(
  scheme: FlexScheme.redWine,
  surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
  blendLevel: 9,

  appBarStyle: FlexAppBarStyle.material,
  subThemesData: const FlexSubThemesData(
    blendOnLevel: 10,
    blendOnColors: false,
    cardRadius: 5.0,
  ),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  swapLegacyOnMaterial3: true,
// To use the playground font, add GoogleFonts package and uncomment
// fontFamily: GoogleFonts.notoSans().fontFamily,
);

final ThemeData redWineThemeDark = FlexThemeData.dark(
  scheme: FlexScheme.redWine,
  surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
  blendLevel: 15,
  subThemesData: const FlexSubThemesData(
    blendOnLevel: 20,
    cardRadius: 5.0,
  ),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  swapLegacyOnMaterial3: true,
  // To use the Playground font, add GoogleFonts package and uncomment
  // fontFamily: GoogleFonts.notoSans().fontFamily,
);

// This theme was made for FlexColorScheme version 6.1.1. Make sure
// you use same or higher version, but still same major version. If
// you use a lower version, some properties may not be supported. In
// that case you can also remove them after copying the theme to your app.
final ThemeData midNightThemeLight = FlexThemeData.light(
  colors: const FlexSchemeColor(
    primary: Color(0xff00296b),
    primaryContainer: Color(0xffa0c2ed),
    secondary: Color(0xffd26900),
    secondaryContainer: Color(0xffffd270),
    tertiary: Color(0xff5c5c95),
    tertiaryContainer: Color(0xffc8dbf8),
    appBarColor: Color(0xffc8dcf8),
    error: null,
  ),
  surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
  blendLevel: 9,
  appBarStyle: FlexAppBarStyle.surface,
  appBarElevation: 10.5,
  subThemesData: const FlexSubThemesData(
    blendOnLevel: 10,
    blendOnColors: false,
    cardRadius: 11.0,
  ),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  swapLegacyOnMaterial3: true,
// To use the playground font, add GoogleFonts package and uncomment
// fontFamily: GoogleFonts.notoSans().fontFamily,
);

final ThemeData midNightThemeDark = FlexThemeData.dark(
  colors: const FlexSchemeColor(
    primary: Color(0xffb1cff5),
    primaryContainer: Color(0xff3873ba),
    secondary: Color(0xffffd270),
    secondaryContainer: Color(0xffd26900),
    tertiary: Color(0xffc9cbfc),
    tertiaryContainer: Color(0xff535393),
    appBarColor: Color(0xff00102b),
    error: null,
  ),
  surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
  blendLevel: 15,
  subThemesData: const FlexSubThemesData(
    blendOnLevel: 20,
    cardRadius: 11.0,
  ),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  swapLegacyOnMaterial3: true,
// To use the Playground font, add GoogleFonts package and uncomment
// fontFamily: GoogleFonts.notoSans().fontFamily,
);
// If you do not have a themeMode switch, uncomment this line
// to let the device system mode control the theme mode:
// themeMode: ThemeMode.system,
