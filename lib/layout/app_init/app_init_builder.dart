import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holiday/bloc/app_init/app_init_bloc.dart';
import 'package:holiday/repository/holiday_repository.dart';
import 'package:holiday/repository/metadata_repository.dart';

class AppInitBuilder extends StatelessWidget {
  const AppInitBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    BlocListener<AppInitBloc, AppInitBlocState>(
      listener: (BuildContext context, AppInitBlocState state) {
        if (state is AppInitBlocLoading) {
          /// 로딩일 경우 indicator 정도만
        }
      },
    );

    // BlocProvider<AppInitBloc>();
    return BlocProvider(
      create: (_) =>
          AppInitBloc(metadataRepository: metadataRepositoryProvider(), holidayRepository: holidayRepositoryProvider()),
      child: const _AppInitBlocBuilder(),
    );
  }
}

class _AppInitBlocBuilder extends StatelessWidget {
  const _AppInitBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AppInitBloc>(context).add(GetMetaDataEvent());

    return BlocBuilder<AppInitBloc, AppInitBlocState>(
      builder: (context, state) {
        return Container();
      },
    );
  }
}
