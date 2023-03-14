import 'package:flutter/material.dart';
import 'package:holiday/model/ui/custom_theme_model.dart';
import 'package:holiday/theme/flex_theme.dart';

// runner
final CustomThemeModel springTheme = CustomThemeModel(
    name: "spring",
    iconAssetUrl: "assets/icon/runner.png",
    backgroundColor: Colors.green,
    themeLightData: dellGenoaGreenLight,
    themeDarkData: dellGenoaGreenDark,
    assetFilename: "spring.gif");

// surfer
final CustomThemeModel summerTheme = CustomThemeModel(
    name: "summer",
    iconAssetUrl: "assets/icon/surfing.png",
    backgroundColor: Colors.blue,
    themeLightData: aquaBlueLight,
    themeDarkData: aquaBlueDark,
    assetFilename: "summer_pool.gif");

// leaf
final CustomThemeModel autumnTheme = CustomThemeModel(
    name: "autumn",
    iconAssetUrl: "assets/icon/leaf-fall.png",
    backgroundColor: Colors.redAccent,
    themeLightData: redWineThemeLight,
    themeDarkData: redWineThemeDark,
    assetFilename: "autumn_dot.gif");

// snowboard
final CustomThemeModel winterTheme = CustomThemeModel(
    name: "winter",
    iconAssetUrl: "assets/icon/snowboard.png",
    backgroundColor: Colors.white,
    themeLightData: midNightThemeLight,
    themeDarkData: midNightThemeDark,
    assetFilename: "winter_snow.gif");
