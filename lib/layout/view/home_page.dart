import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holiday/holiday_bloc/holiday_bloc.dart';
import 'package:holiday/holiday_bloc/holiday_state.dart';
import 'package:holiday/layout/component/consecutive_holidays_card.dart';
import 'package:holiday/layout/component/consecutive_holidays_interval_card/consecutive_holidays_interval_card.dart';
import 'package:holiday/layout/component/next_consecutive_holidays.dart';
import 'package:holiday/model/consecutive_holidays/consecutive_holidays.dart';
import 'package:holiday/model/event_date/event_date_extension.dart';
import 'package:holiday/model/holiday/holiday.dart';
import 'package:holiday/model/holiday/holiday_extention.dart';
import 'package:holiday/repository/holiday_repository.dart';
import 'package:holiday/util/datetime_extentions.dart';
import 'package:logger/logger.dart';

import '../../client/rest_client.dart';
import '../../holiday_bloc/holiday_event.dart';
import '../../theme_cubit/theme_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Dio dio = Dio();
    dio.options = BaseOptions(connectTimeout: 100);

    RestClient _client = RestClient(dio);
    HolidayRepository holidayRepository = HolidayRepository(client: _client);

    return BlocProvider(
      create: (_) => HolidayBloc(
        repository: holidayRepository,
      ),
      child: const _HomeBuilder(),
    );
  }
}

class _HomeBuilder extends StatefulWidget {
  const _HomeBuilder({Key? key}) : super(key: key);

  @override
  State<_HomeBuilder> createState() => _HomeBuilderState();
}

class _HomeBuilderState extends State<_HomeBuilder> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HolidayBloc>(context)
        .add(ListHolidayEvent(holidayList: []));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HolidayBloc, GetHolidayState>(
        builder: (_, state) {
          if (state is GetHolidayError) {
            return Container();
          }
          if (state is HolidayEmpty) {
            return Container();
          }
          if (state is GetHolidayLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is GetHolidayLoaded) {
            return _HomeView(holidayList: state.holidayList);
          }
          return Container();
        },
      ),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView({Key? key, required this.holidayList}) : super(key: key);

  final List<Holiday> holidayList;

  @override
  Widget build(BuildContext context) {
    final consecutiveHolidaysList = holidayList
        .toWithoutWeekend()
        .toEventDateList()
        .toConsecutiveHolidaysList();

    final current = consecutiveHolidaysList
        .firstWhereOrNull((element) => element.state == DateState.now);

    Logger().i(consecutiveHolidaysList);

    final prev = consecutiveHolidaysList
        .lastWhere((element) => element.state == DateState.before);

    final next = consecutiveHolidaysList
        .firstWhere((element) => element.state == DateState.after);

    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      'assets/img/${state.currentThemeModel.assetFilename}'),
                  fit: BoxFit.cover,
                  opacity: 0.7)),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: ThemeChangeButtons(),
                  ),
                  SliverToBoxAdapter(
                    child: current == null
                        ? _WaitingHolidayScreen(
                            prev: prev,
                            next: next,
                          )
                        : _OnHolidayScreen(
                            current: current,
                          ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _OnHolidayScreen extends StatelessWidget {
  const _OnHolidayScreen({Key? key, required this.current}) : super(key: key);

  final ConsecutiveHolidays current;

  @override
  Widget build(BuildContext context) {
    return ConsecutiveHolidaysCardComponent(
        consecutiveHolidays: current, highLight: true);
  }
}

class _WaitingHolidayScreen extends StatelessWidget {
  const _WaitingHolidayScreen(
      {Key? key, required this.prev, required this.next})
      : super(key: key);

  final ConsecutiveHolidays prev;
  final ConsecutiveHolidays next;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            "${DateTime.now().year}년 ${DateTime.now().month}월 ${DateTime.now().day}일",
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontWeight: FontWeight.w700),
          ),
        ),
        ConsecutiveHolidaysIntervalCard.fromConsecutiveHolidays(
            last: prev, next: next),
        NextConsecutiveHolidays(consecutiveHolidays: next),
        ConsecutiveHolidaysCardComponent(
          consecutiveHolidays: next,
          highLight: true,
        )
      ],
    );
  }
}

class ThemeChangeButtons extends StatelessWidget {
  const ThemeChangeButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          ...state.themeModelList
              .map((themeModel) => Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: ClipOval(
                      child: Material(
                        color: themeModel.themeDarkData.primaryColor,
                        // Button color
                        child: InkWell(
                          splashColor: Colors.black, // Splash color
                          onTap: () {
                            context.read<ThemeCubit>().themeChange(themeModel);
                          },
                          child: SizedBox(
                              width: 40,
                              height: 40,
                              child: Center(
                                  child: Text(
                                "${themeModel.emoji}",
                                style: TextStyle(fontSize: 20),
                              ))),
                        ),
                      ),
                    ),
                  ))
              .toList()
        ]);
      },
    );
  }
}
