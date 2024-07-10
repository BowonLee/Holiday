part of '../holiday_info_layout.dart';

class MoveDateButtonFiled extends StatefulWidget {
  final ConsecutiveHolidays? prev;
  final ConsecutiveHolidays? next;
  final VoidCallback onClickPrevButton;
  final VoidCallback onClickNextButton;

  const MoveDateButtonFiled(
      {super.key, required this.next, required this.onClickNextButton, this.prev, required this.onClickPrevButton});

  @override
  State<MoveDateButtonFiled> createState() => MoveDateButtonFiledState();
}

class MoveDateButtonFiledState extends State<MoveDateButtonFiled> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
                onPressed: widget.prev == null ? null : widget.onClickPrevButton,
                child: const Row(
                  children: [
                    Icon(
                      Icons.keyboard_arrow_left,
                      size: 30,
                    ),
                    Text(
                      "Prev",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                )),
            Text(widget.prev == null ? "" : widget.prev!.title)
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextButton(
                onPressed: widget.next == null ? null : widget.onClickNextButton,
                child: const Row(
                  children: [
                    Text(
                      "Next",
                      style: TextStyle(fontSize: 20),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      size: 30,
                    ),
                  ],
                )),
            Text(widget.next == null ? "" : widget.next!.title)
          ],
        ),
      ],
    );
  }
}
