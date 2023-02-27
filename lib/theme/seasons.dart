import 'package:flutter/material.dart';
import 'package:holiday/model/ui/custom_theme_model.dart';
import 'package:holiday/theme/flex_theme.dart';

// snowboard
final CustomThemeModel winterTheme = CustomThemeModel(
    name: "winter",
    emoji: "1F3C2",
    backgroundColor: Colors.blue,
    themeDarkData: midNightThemeLight,
    themeLightData: midNightThemeDark);

// runner
final springTheme = CustomThemeModel(
    name: "spring",
    emoji: "1F3C3",
    backgroundColor: Colors.green,
    themeLightData: dellGenoaGreenLight,
    themeDarkData: dellGenoaGreenDark);

// surfer
final summerTheme = CustomThemeModel(
    name: "summer",
    emoji: "1F3C4",
    backgroundColor: Colors.blue,
    themeDarkData: aquaBlueLight,
    themeLightData: aquaBlueDark);

// leaf
final autumnTheme = CustomThemeModel(
    name: "autumn",
    emoji: "1F342",
    backgroundColor: Colors.redAccent,
    themeLightData: redWineThemeLight,
    themeDarkData: redWineThemeDark);
