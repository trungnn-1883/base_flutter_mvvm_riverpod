import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PomodoroStepView extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isEnabled;

  const PomodoroStepView({
    super.key,
    required this.icon,
    required this.text,
    required this.isEnabled,
  });

  @override
  Widget build(BuildContext context) {
    final Color color = isEnabled ? Colors.blue : Colors.grey;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color),
        Gap(8),
        Text(
          text,
          style: TextStyle(color: color),
        ),
      ],
    );
  }
}
