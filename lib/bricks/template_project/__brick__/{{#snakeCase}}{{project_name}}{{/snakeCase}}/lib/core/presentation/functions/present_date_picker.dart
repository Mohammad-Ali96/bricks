import '/../core/presentation/resources/app_theme.dart';
import 'package:flutter/material.dart';

Future<DateTime?> presentDatePicker(
  BuildContext context,
  DateTime? oldDate, {
  DateTime? lastDate,
  DateTime? firstDate,
  String? label,
}) async {
  final newDate = await showDatePicker(
    builder: (context, widget) {
      return Theme(
        data: getDatePickerTheme(context),
        child: widget!,
      );
    },
    context: context,
    initialDate: oldDate ?? DateTime.now(),
    firstDate: firstDate ?? DateTime(1900),
    lastDate: lastDate ?? DateTime.now(),
    fieldLabelText: label,
    helpText: label,
  );

  return newDate;
}
