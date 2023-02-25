import 'package:flutter/material.dart';

class ThemeModel {
  final String emoji;
  final String backgroundColor;
  final ThemeData? themeData;

  ThemeModel(
      {required this.emoji, required this.backgroundColor, this.themeData});
}
