import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

typedef TimerCountDownBuilder = Widget Function(
    TimerCountDownController controller);

class TimerCountDownWidget extends StatelessWidget {
  final VoidCallback? onTimerFinish;
  final TimerCountDownBuilder builder;

  TimerCountDownWidget({this.onTimerFinish, required this.builder});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(TimerCountDownController());
    c.onTimerFinish = onTimerFinish;
    return builder(c);
  }
}

class TimerCountDownController extends GetxController {
  Timer? _timer;
  var countdownTime = 0.obs;
  VoidCallback? onTimerFinish;

  void startCountdownTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (countdownTime < 1) {
        if (onTimerFinish != null) {
          onTimerFinish!();
        }
        _timer?.cancel();
      } else {
        countdownTime = countdownTime - 1;
      }
    });
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
