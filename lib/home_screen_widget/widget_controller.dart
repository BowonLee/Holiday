import 'package:holiday/model/consecutive_holidays/consecutive_holidays.dart';
import 'package:home_widget/home_widget.dart';

const androidWidgetName = "SingleDueDateWidget";

WidgetController widgetControllerProvider() {
  WidgetController widgetController = WidgetController();
  return widgetController;
}

// const String appGroupId = '<YOUR APP GROUP>';
// const String iOSWidgetName = 'NewsWidgets';
class WidgetController {
  void updateSingleDueDateWidget(ConsecutiveHolidays holidays) {
    HomeWidget.saveWidgetData<String>('title', holidays.title);
    // HomeWidget.saveWidgetData<String>('date', "");
    HomeWidget.updateWidget(androidName: androidWidgetName);
  }
}
