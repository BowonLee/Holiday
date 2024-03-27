import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holiday/bloc/holiday_bloc/holiday_event.dart';

import 'package:holiday/repository/holiday_repository.dart';

import '../../../bloc/holiday_bloc/holiday_bloc.dart';
import '../../../bloc/holiday_bloc/holiday_state.dart';
import 'home_view.dart';

class HomeBuilder extends StatelessWidget {
  final bool isNeedUpdateHoliday;

  const HomeBuilder({super.key, required this.isNeedUpdateHoliday});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HolidayBloc(
        holidayRepository: holidayRepositoryProvider(),
      ),
      child: _HomeBuilder(
        isNeedUpdateHoliday: isNeedUpdateHoliday,
      ),
    );
  }
}

class _HomeBuilder extends StatefulWidget {
  final bool isNeedUpdateHoliday;

  const _HomeBuilder({super.key, required this.isNeedUpdateHoliday});

  @override
  State<_HomeBuilder> createState() => _HomeBuilderState();
}

class _HomeBuilderState extends State<_HomeBuilder> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<HolidayBloc>(context).add(GetHolidayFromLocalEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HolidayBloc, HolidayBlocState>(
        builder: (_, state) {
          if (state is HolidayBlocError) {
            /// 모든 수단을 실패 error state
            return const Center(
              child: Text("오류"),
            );
          }
          if (state is HolidayEmpty) {
            /// equal state loading
            return const Center(
              child: Text("오류2 empty"),
            );
          }
          if (state is HolidayBlocLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is HolidayBlocLoaded) {
            return HomeView();
          }
          return Container();
        },
      ),
    );
  }
}
