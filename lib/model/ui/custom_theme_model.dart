import 'package:flutter/material.dart';

class CustomThemeModel {
  final String name;
  final String emoji;
  final Color backgroundColor;
  final ThemeData? themeLightData;
  final ThemeData? themeDarkData;

  CustomThemeModel(
      {required this.name,
      required this.emoji,
      required this.backgroundColor,
      this.themeLightData,
      this.themeDarkData});
}
