import '/../core/presentation/resources/app_theme.dart';
import 'package:flutter/material.dart';

Future<TimeOfDay?> presentTimePicker(
  BuildContext context,
  TimeOfDay? initialTime,
) async {
  final newTime = await showTimePicker(
    builder: (context, widget) {
      return Theme(
        data: getDatePickerTheme(context),
        child: widget!,
      );
    },
    context: context,
    initialTime: initialTime ?? TimeOfDay.now(),
  );

  return newTime;
}
