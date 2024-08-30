import 'package:bloc/bloc.dart';

import '../const/seasons.dart';
import '../model/custom_theme_model.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());

  void themeChange(CustomThemeModel themeModel) {
    emit(ThemeChange(themeModel: themeModel));
  }
}
