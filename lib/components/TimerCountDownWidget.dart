import 'dart:async';

import 'package:corrode/util/extensions/color_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimerCountDownWidget extends StatefulWidget {
  final Function onTimerFinish;

  TimerCountDownWidget({required this.onTimerFinish}) : super();

  @override
  State<StatefulWidget> createState() => TimerCountDownWidgetState();
}

class TimerCountDownWidgetState extends State<TimerCountDownWidget> {
  Timer? _timer;
  var countdownTime = 0.obs;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (countdownTime.value == 0) {
          countdownTime.value = 60;
          startCountdownTimer();
        }
      },
      child: Obx(() => Text(
            countdownTime > 0 ? '$countdownTime秒后获取' : "获取验证码",
            style: TextStyle(fontSize: 12),
          )),
      style: TextButton.styleFrom(
        backgroundColor: HexColor.fromHex("#03C19B"),
        primary: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(21),
          ),
        ),
      ),
    );
  }

  void startCountdownTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (countdownTime < 1) {
        widget.onTimerFinish();
        _timer?.cancel();
      } else {
        countdownTime = countdownTime - 1;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }
}
