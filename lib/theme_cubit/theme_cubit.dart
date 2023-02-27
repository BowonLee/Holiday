import 'package:bloc/bloc.dart';
import 'package:holiday/theme/seasons.dart';

import '../model/ui/custom_theme_model.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());

  void themeChange(CustomThemeModel themeModel) {
    emit(ThemeChange(themeModel: themeModel));
  }
}
