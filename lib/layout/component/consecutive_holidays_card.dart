import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:holiday/util/datetime_extentions.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

import '../../model/consecutive_holidays/consecutive_holidays.dart';
import '../../model/event_date/event_date.dart';

class ConsecutiveHolidaysCardComponent extends StatelessWidget {
  const ConsecutiveHolidaysCardComponent({Key? key, required this.consecutiveHolidays, required this.highLight})
      : super(key: key);

  final ConsecutiveHolidays consecutiveHolidays;
  final bool highLight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ConsecutiveHolidayTileField(
            consecutiveHolidays: consecutiveHolidays,
          ),
          const SizedBox(height: 10),
          FoldableConsecutiveHolidayCard(
            consecutiveHolidays: consecutiveHolidays,
          ),
        ],
      ),
    );
  }
}

class ConsecutiveHolidayTileField extends StatelessWidget {
  const ConsecutiveHolidayTileField({super.key, required this.consecutiveHolidays});

  final ConsecutiveHolidays consecutiveHolidays;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          consecutiveHolidays.title,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600, fontSize: 15),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          consecutiveHolidays.dateList.length.toString(),
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700, fontSize: 20),
        ),
        Text(
          " 일",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700, fontSize: 15),
        ),
      ],
    );
  }
}

class FoldableConsecutiveHolidayCard extends StatefulWidget {
  final ConsecutiveHolidays consecutiveHolidays;

  const FoldableConsecutiveHolidayCard({super.key, required this.consecutiveHolidays});

  @override
  State<FoldableConsecutiveHolidayCard> createState() => _FoldableConsecutiveHolidayCardState();
}

class _FoldableConsecutiveHolidayCardState extends State<FoldableConsecutiveHolidayCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool isFolded = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 1));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isFolded = !isFolded;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: isFolded ? 30 : 100,
        child: isFolded
            ? _FoldedCard(
                consecutiveHolidays: widget.consecutiveHolidays,
              )
            : _ExpandedCard(
                consecutiveHolidays: widget.consecutiveHolidays,
              ),
      ),
    );
  }
}

class _FoldedCard extends StatelessWidget {
  final ConsecutiveHolidays consecutiveHolidays;

  const _FoldedCard({super.key, required this.consecutiveHolidays});

  @override
  Widget build(BuildContext context) {
    String dateText = "";
    Logger().i(consecutiveHolidays.dateList);
    if (consecutiveHolidays.dateList.length == 1) {
      dateText = DateFormat("M/d").format(consecutiveHolidays.dateList.first.datetime);
    } else {
      dateText =
          "${DateFormat("M/d").format(consecutiveHolidays.dateList.first.datetime)} ~ ${DateFormat("M/d").format(consecutiveHolidays.dateList.last.datetime)}";
    }

    return Container(
        color: Colors.blue,
        height: 50,
        child: Text(
          dateText,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ));
  }
}

class _ExpandedCard extends StatelessWidget {
  final ConsecutiveHolidays consecutiveHolidays;

  const _ExpandedCard({super.key, required this.consecutiveHolidays});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.blue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("data"),
          Text("data"),
        ],
      ),
    );
  }
}
