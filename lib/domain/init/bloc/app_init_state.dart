part of 'app_init_bloc.dart';

@immutable
abstract class AppInitBlocState {}

class AppInitBlocInitial extends AppInitBlocState {}

class AppInitBlocLoading extends AppInitBlocState {}

class AppInitBlocError extends AppInitBlocState {
  AppInitBlocError({required Exception exception});
}

class AppInitBlocComplete extends AppInitBlocState {
  final bool needUpdateHolidayList;

  AppInitBlocComplete({required this.needUpdateHolidayList});
}
