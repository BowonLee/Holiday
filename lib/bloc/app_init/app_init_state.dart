part of 'app_init_bloc.dart';

@immutable
abstract class AppInitState {}

class AppInitInitial extends AppInitState {}

class AppInitLoading extends AppInitState {}

class AppInitError extends AppInitState {
  AppInitError({required Exception exception});
}

class AppInitComplete extends AppInitState {}
