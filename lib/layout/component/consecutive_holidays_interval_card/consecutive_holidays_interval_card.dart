import 'package:flutter/material.dart';
import 'package:holiday/model/consecutive_holidays/consecutive_holidays.dart';
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

    Logger().i("$full $current ${current / full}");

    return current / full;
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
          SizedBox(
            height: 10,
          ),
          Container(
            color: Colors.black,
            width: MediaQuery.of(context).size.width,
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(lastHolidaysName),
                  Text("${lastDate.year} ${lastDate.day}")
                ],
              ),
              Column(
                children: [
                  Text(nextHolidaysName),
                  Text("${nextDate.month} ${nextDate.day}")
                ],
              )
            ],
          )
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
  )..repeat();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return buildAnimatedBuilder();
  }

  AnimatedContainer buildAnimatedContainer() {
    bool trigger = false;

    final goal = MediaQuery.of(context).size.width * widget.percentage;
    // Logger().i(MediaQuery.of(context).size.width, goal);
    return AnimatedContainer(
      duration: Duration(seconds: 3),
      child: Container(
          decoration: BoxDecoration(color: Colors.red),
          alignment: AlignmentDirectional.topEnd,
          child: Text("\u{1f60e}", style: TextStyle(fontSize: 30))),
      onEnd: () {
        // trigger = !trigger;
      },
      width: trigger ? goal : 0,
    );
  }

  AnimatedBuilder buildAnimatedBuilder() {
    return AnimatedBuilder(
      animation: _controller,
      child: Container(
          decoration: BoxDecoration(color: Colors.red),
          child: Text("\u{1f60e}", style: TextStyle(fontSize: 30))),
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(
              _controller.value *
                  MediaQuery.of(context).size.width *
                  widget.percentage,
              0),
          child: child,
        );
      },
    );
  }
}
