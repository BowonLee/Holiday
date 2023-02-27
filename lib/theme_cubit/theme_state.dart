part of 'theme_cubit.dart';

abstract class ThemeState {}

class ThemeInitial extends ThemeState {
  late final CustomThemeModel themeModel;

  ThemeInitial() {
    final now = DateTime.now();

    if (now.month == 3 || now.month == 4 || now.month == 5) {
      themeModel = springTheme;
    }
    if (now.month == 6 || now.month == 7 || now.month == 8) {
      themeModel = summerTheme;
    }
    if (now.month == 9 || now.month == 10 || now.month == 11) {
      themeModel = autumnTheme;
    }
    if (now.month == 12 || now.month == 1 || now.month == 2) {
      themeModel = winterTheme;
    }
  }
}

class ThemeChange extends ThemeState {
  final CustomThemeModel themeModel;

  ThemeChange({required this.themeModel});
}
