part of '../yealy_info_view.dart';

typedef YearButtonCallback = void Function(int year);

class _YearlyButtons extends StatelessWidget {
  const _YearlyButtons(
      {super.key,
      required this.holidayList,
      required this.currentYear,
      required this.yearButtonCallback});

  final List<Holiday> holidayList;
  final int currentYear;
  final YearButtonCallback yearButtonCallback;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...holidayList.divideByYear().keys.map((e) => TextButton(
              onPressed: () {
                yearButtonCallback(e);
              },
              child: currentYear == e
                  ? Text(
                      e.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Theme.of(context).colorScheme.primary),
                    )
                  : Text(
                      e.toString(),
                      style: TextStyle(color: Theme.of(context).colorScheme.secondary),
                    ),
            ))
      ],
    );
  }
}
