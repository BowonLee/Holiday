import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/consecutive_holidays.dart';

class ConsecutiveHolidaysTitle extends StatelessWidget {
  const ConsecutiveHolidaysTitle({
    super.key,
    required this.consecutiveHolidays,
  });

  final ConsecutiveHolidays consecutiveHolidays;

  @override
  Widget build(BuildContext context) {
    return Text(
      consecutiveHolidays.title,
      style: GoogleFonts.sunflower(textStyle: TextStyle(fontSize: 25)),
    );
  }
}
