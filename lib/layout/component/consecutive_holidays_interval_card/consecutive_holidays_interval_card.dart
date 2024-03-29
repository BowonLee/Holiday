import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holiday/model/consecutive_holidays/consecutive_holidays.dart';
import 'package:holiday/theme_cubit/theme_cubit.dart';
import 'package:logger/logger.dart';

class ConsecutiveHolidaysIntervalCard extends StatelessWidget {
  const ConsecutiveHolidaysIntervalCard({
    Key? key,
    required this.lastDate,
    required this.lastHolidaysName,
    required this.nextDate,
    required this.nextHolidaysName,
  }) : super(key: key);

  factory ConsecutiveHolidaysIntervalCard.fromConsecutiveHolidays(
      {required ConsecutiveHolidays last, required ConsecutiveHolidays next}) {
    return ConsecutiveHolidaysIntervalCard(
        lastDate: last.dateList.last.datetime,
        lastHolidaysName: last.title,
        nextDate: next.dateList.first.datetime,
        nextHolidaysName: next.title);
  }

  final DateTime lastDate;
  final String lastHolidaysName;
  final DateTime nextDate;
  final String nextHolidaysName;

  double _getPercentage() {
    final startDateTime = lastDate;
    final endDateTime = nextDate;
    final now = DateTime.now();

    final full = startDateTime.difference(endDateTime).inDays;
    final current = startDateTime.difference(now).inDays;

    final result = current / full;

    if (result < 0.1) {
      return 0.1;
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    bool isStart = true;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 아이콘
          //
          _AnimateProgressBar(
            percentage: _getPercentage(),
          ),
          const SizedBox(
            height: 10,
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Column(
          //       children: [
          //         Text(lastHolidaysName),
          //         Text("${lastDate.year} ${lastDate.day}")
          //       ],
          //     ),
          //     Column(
          //       children: [
          //         Text(nextHolidaysName),
          //         Text("${nextDate.month} ${nextDate.day}")
          //       ],
          //     )
          //   ],
          // )
        ],
      ),
    );
  }
}

class _AnimateProgressBar extends StatefulWidget {
  const _AnimateProgressBar({
    Key? key,
    required this.percentage,
  }) : super(key: key);
  final double percentage;

  @override
  State<_AnimateProgressBar> createState() => _State();
}

class _State extends State<_AnimateProgressBar> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    upperBound: widget.percentage,
    vsync: this,
  )..forward();

  bool trigger = false;

  @override
  void initState() {
    super.initState();
  }

  initTrigger() async {
    Future.delayed(
      Duration(milliseconds: 500),
      () {
        setState(() {
          trigger = true;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        final emoji = state.currentThemeModel.iconAssetUrl;
        final color = state.currentThemeModel.themeDarkData.primaryColor;
        return buildAnimatedContainer(emoji, color);
      },
    );
  }

  Widget buildAnimatedContainer(String assetUrl, Color color) {
    final goal = MediaQuery.of(context).size.width * widget.percentage;
    initTrigger();
    // Logger().i(MediaQuery.of(context).size.width, goal);
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: color, width: 2),
          ),
        ),
        AnimatedContainer(
          curve: Curves.bounceOut,
          duration: Duration(seconds: 2),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: color,
            ),
            alignment: AlignmentDirectional.centerEnd,
            child: Container(),
          ),
          onEnd: () {
            // trigger = !trigger;
          },
          width: trigger ? goal : 0,
          height: 50,
        ),
      ],
    );
  }

  AnimatedBuilder buildAnimatedBuilder() {
    return AnimatedBuilder(
      animation: _controller,
      child: Container(child: Text("\u{1F3C2}", style: TextStyle(fontSize: 30))),
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(_controller.value * MediaQuery.of(context).size.width * widget.percentage, 0),
          child: child,
        );
      },
    );
  }
}
