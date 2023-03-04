import 'package:flutter/material.dart';

class CustomThemeModel {
  final String name;
  final String emoji;
  final Color backgroundColor;
  final ThemeData themeLightData;
  final ThemeData themeDarkData;
  final String? assetFilename;

  CustomThemeModel(
      {required this.name,
      required this.emoji,
      required this.backgroundColor,
      required this.themeLightData,
      required this.themeDarkData,
      this.assetFilename});
}
