import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class MacroWidget extends StatelessWidget {
  final String label;
  final int value;
  final Color progressColor;
  final Color backgroundColor;

  const MacroWidget({
    required this.label,
    required this.value,
    required this.progressColor,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      animation: true,
      animationDuration: 1000,
      radius: 50,
      lineWidth: 10,
      percent: value / 300,
      progressColor: progressColor,
      backgroundColor: backgroundColor,
      circularStrokeCap: CircularStrokeCap.round,
      center: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0),
        child: Column(
          children: [
            Text(
              value.toString(),
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              label,
              style: const TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
