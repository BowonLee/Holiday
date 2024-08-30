import 'package:flutter/material.dart';

import '../../../core/util/datetime_extentions.dart';
import '../model/consecutive_holidays.dart';
import 'consecutive_holidays_card.dart';

typedef ConsecutiveHolidaysItemCallback = void Function(ConsecutiveHolidays);

class ConsecutiveHolidaysListComponent extends StatelessWidget {
  const ConsecutiveHolidaysListComponent(
      {super.key,
      required this.consecutiveHolidaysList,
      required this.onTapItem,
      this.scrollController,
      this.focusedIndex});

  final List<ConsecutiveHolidays> consecutiveHolidaysList;
  final ScrollController? scrollController;
  final ConsecutiveHolidaysItemCallback onTapItem;
  final int? focusedIndex;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      shrinkWrap: true,
      itemBuilder: (_, index) {
        return ConsecutiveHolidaysCardComponent(
            onTapItem: () {
              onTapItem(consecutiveHolidaysList[index]);
            },
            consecutiveHolidays: consecutiveHolidaysList[index],
            highLight: (focusedIndex == null) ? false : index == focusedIndex,
            isPast: consecutiveHolidaysList[index].state == DateState.past);
      },
      itemCount: consecutiveHolidaysList.length,
    );
  }
}
