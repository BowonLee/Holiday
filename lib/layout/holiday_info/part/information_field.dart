part of '../holiday_info_layout.dart';

class _InformationField extends StatelessWidget {
  final ConsecutiveHolidays consecutiveHolidays;

  const _InformationField({super.key, required this.consecutiveHolidays});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [Text("${consecutiveHolidays.title}는 ${consecutiveHolidays.dateList.length} 동안 이어집니다.")],
    );
  }
}
