import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holiday/bloc/app_init/app_init_bloc.dart';

class AppInitBuilder extends StatelessWidget {
  const AppInitBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppInitBloc, AppInitBlocState>(
      builder: (context, state) {
        if (state is AppInitBlocLoading) {}
        if (state is AppInitBlocComplete) {}
        return Container();
      },
    );
  }
}
