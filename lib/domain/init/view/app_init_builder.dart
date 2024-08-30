import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holiday/domain/init/bloc/app_init_bloc.dart';
import 'package:holiday/domain/holiday/repository/holiday_repository.dart';
import 'package:holiday/domain/init/client/metadata_repository.dart';
import 'package:logger/logger.dart';

import '../../home/view/home_builder.dart';

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

    return BlocProvider(
      create: (_) => AppInitBloc(
          metadataRepository: metadataRepositoryProvider(),
          holidayRepository: holidayRepositoryProvider()),
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
      buildWhen: (previous, current) {
        return (current is AppInitBlocComplete) || (current is AppInitBlocError);
      },
      builder: (context, state) {
        Logger().i(state);
        if (state is AppInitBlocComplete) {
          return HomeBuilder(isNeedUpdateHoliday: state.needUpdateHolidayList);
        }

        if (state is AppInitBlocError) {
          return const HomeBuilder(isNeedUpdateHoliday: false);
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
