part of 'app_init_bloc.dart';

@immutable
abstract class AppInitBlocState {}

class AppInitInitial extends AppInitBlocState {}

class AppInitLoading extends AppInitBlocState {}

class AppInitError extends AppInitBlocState {
  AppInitError({required Exception exception});
}

class AppInitComplete extends AppInitBlocState {}
