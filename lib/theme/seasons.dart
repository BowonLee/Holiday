import 'package:flutter/material.dart';
import 'package:holiday/model/ui/custom_theme_model.dart';
import 'package:holiday/theme/flex_theme.dart';

// runner
final CustomThemeModel springTheme = CustomThemeModel(
    name: "spring",
    emoji: "\u{1F3C3}",
    backgroundColor: Colors.green,
    themeLightData: dellGenoaGreenLight,
    themeDarkData: dellGenoaGreenDark,
    assetFilename: "spring.gif");

// surfer
final CustomThemeModel summerTheme = CustomThemeModel(
    name: "summer",
    emoji: "\u{1F3C4}",
    backgroundColor: Colors.blue,
    themeLightData: aquaBlueLight,
    themeDarkData: aquaBlueDark,
    assetFilename: "summer_pool.gif");

// leaf
final CustomThemeModel autumnTheme = CustomThemeModel(
    name: "autumn",
    emoji: "\u{1F342}",
    backgroundColor: Colors.redAccent,
    themeLightData: redWineThemeLight,
    themeDarkData: redWineThemeDark,
    assetFilename: "autumn_dot.gif");

// snowboard
final CustomThemeModel winterTheme = CustomThemeModel(
    name: "winter",
    emoji: "\u{1F3C2}",
    backgroundColor: Colors.white,
    themeLightData: midNightThemeLight,
    themeDarkData: midNightThemeDark,
    assetFilename: "winter_snow.gif");
