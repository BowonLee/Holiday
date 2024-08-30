import 'dart:async';

import 'package:flutter/cupertino.dart';

class RemainingTimer extends StatefulWidget {
  final DateTime targetDateTime;

  const RemainingTimer({super.key, required this.targetDateTime});

  @override
  State<RemainingTimer> createState() => _RemainingTimerState();
}

class _RemainingTimerState extends State<RemainingTimer> {
  int count = 0;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(
      Duration(seconds: 1),
      (Timer timer) {
        setState(() {
          count++;
        });
      },
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(getRemainingText(widget.targetDateTime.add(Duration(days: 1, seconds: -1))));
  }

  String getRemainingText(DateTime targetDatetime) {
    /// 시간을 일 / 시 / 분 / 초로 분리
    Duration difference = targetDatetime.difference(DateTime.now());
    int days = difference.inDays;
    int hours = difference.inHours % 24;
    int minutes = difference.inMinutes % 60;
    int seconds = difference.inSeconds % 60;
    String timeStr = "$days일 $hours시간 $minutes분 $seconds초 남았습니다.";

    return timeStr;
  }
}
