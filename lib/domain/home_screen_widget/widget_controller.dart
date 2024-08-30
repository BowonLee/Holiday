import 'package:home_widget/home_widget.dart';
import 'package:logger/logger.dart';

import '../holiday/model/consecutive_holidays.dart';

const androidWidgetName = "SingleDueDateWidget";

WidgetController widgetControllerProvider() {
  WidgetController widgetController = WidgetController();
  return widgetController;
}

class WidgetController {
  void updateSingleDueDateWidget(ConsecutiveHolidays holidays) {
    HomeWidget.saveWidgetData<String>('title', holidays.title);
    HomeWidget.saveWidgetData<String>('date', holidays.dateList.first.datetime.toIso8601String());

    Logger().i(holidays.dateList.first.datetime.toString());
    HomeWidget.updateWidget(androidName: androidWidgetName);
  }
}
