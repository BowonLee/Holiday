part of 'theme_cubit.dart';

abstract class ThemeStateBase {}

class ThemeState {
  late CustomThemeModel currentThemeModel;
  List<CustomThemeModel> themeModelList = [
    springTheme,
    summerTheme,
    autumnTheme,
    winterTheme
  ];

  ThemeState({required this.currentThemeModel});
}

class ThemeInitial extends ThemeState {
  ThemeInitial() : super(currentThemeModel: springTheme) {
    final now = DateTime.now();

    if (now.month == 3 || now.month == 4 || now.month == 5) {
      currentThemeModel = springTheme;
    }
    if (now.month == 6 || now.month == 7 || now.month == 8) {
      currentThemeModel = summerTheme;
    }
    if (now.month == 9 || now.month == 10 || now.month == 11) {
      currentThemeModel = autumnTheme;
    }
    if (now.month == 12 || now.month == 1 || now.month == 2) {
      currentThemeModel = winterTheme;
    }
  }
}

class ThemeChange extends ThemeState {
  ThemeChange({required CustomThemeModel themeModel})
      : super(currentThemeModel: themeModel);
}
