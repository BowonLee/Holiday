import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:holiday/model/consecutive_holidays/consecutive_holidays.dart';
import 'package:holiday/util/datetime_extentions.dart';
import 'package:intl/intl.dart';

class NextConsecutiveHolidays extends StatelessWidget {
  const NextConsecutiveHolidays({super.key, required this.consecutiveHolidays});

  final ConsecutiveHolidays consecutiveHolidays;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 70,
        ),
        Text(
          "d-day",
          style: GoogleFonts.sunflower(textStyle: TextStyle(fontSize: 18)),
        ),
        Text("${_getDiffOfNextHoliday()}",
            style: GoogleFonts.sriracha(
                textStyle:
                    TextStyle(color: Theme.of(context).primaryColor, letterSpacing: 4, fontSize: 120, shadows: <Shadow>[
              Shadow(
                offset: Offset(1.0, 1.0),
                blurRadius: 3.0,
                color: Theme.of(context).shadowColor,
              ),
              Shadow(
                offset: Offset(1.0, 1.0),
                blurRadius: 8.0,
                color: Theme.of(context).shadowColor,
              ),
            ]))),
        Text(
          consecutiveHolidays.title,
          style: GoogleFonts.sunflower(textStyle: TextStyle(fontSize: 25)),
        ),
        Text(
          DateFormat("M/d(E)").format(consecutiveHolidays.dateList.first.datetime),
          style: GoogleFonts.sunflower(textStyle: TextStyle(fontSize: 25)),
        )
      ],
    );
  }

  _getDiffOfNextHoliday() {
    return consecutiveHolidays.dateList[0].datetime.difference(DateTime.now().getNowDate()).inDays;
  }
}
