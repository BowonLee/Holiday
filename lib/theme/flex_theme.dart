import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

// 가을
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
);

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
);

// 봄
final ThemeData dellGenoaGreenLight = FlexThemeData.light(
  scheme: FlexScheme.dellGenoa,
  surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
  blendLevel: 20,
  appBarStyle: FlexAppBarStyle.surface,
  appBarOpacity: 0.95,
  appBarElevation: 10.5,
  subThemesData: const FlexSubThemesData(
    blendOnLevel: 20,
    blendOnColors: false,
    cardRadius: 11.0,
  ),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
);
final ThemeData dellGenoaGreenDark = FlexThemeData.dark(
  scheme: FlexScheme.dellGenoa,
  surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
  blendLevel: 15,
  appBarStyle: FlexAppBarStyle.background,
  appBarOpacity: 0.90,
  subThemesData: const FlexSubThemesData(
    blendOnLevel: 30,
    cardRadius: 11.0,
  ),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
);

final ThemeData aquaBlueLight = FlexThemeData.light(
  scheme: FlexScheme.aquaBlue,
  surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
  blendLevel: 20,
  appBarStyle: FlexAppBarStyle.surface,
  appBarOpacity: 0.95,
  appBarElevation: 10.5,
  subThemesData: const FlexSubThemesData(
    blendOnLevel: 20,
    blendOnColors: false,
    cardRadius: 11.0,
  ),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
);

final ThemeData aquaBlueDark = FlexThemeData.dark(
  scheme: FlexScheme.aquaBlue,
  surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
  blendLevel: 15,
  appBarStyle: FlexAppBarStyle.background,
  appBarOpacity: 0.90,
  subThemesData: const FlexSubThemesData(
    blendOnLevel: 30,
    cardRadius: 11.0,
  ),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
);
