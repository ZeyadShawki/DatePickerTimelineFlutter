/// ***
/// This class consists of the DateWidget that is used in the ListView.builder
///
/// Author: Vivek Kaushik <me@vivekkasuhik.com>
/// github: https://github.com/iamvivekkaushik/
/// ***

import 'package:date_picker_timeline/extra/extensions/string_extensions.dart';
import 'package:date_picker_timeline/gestures/tap.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateWidget extends StatelessWidget {
  final double? width;
  final DateTime date;
  final TextStyle? monthTextStyle, dayTextStyle, dateTextStyle;
  final Color selectionColor;
  final DateSelectionCallback? onDateSelected;
  final String? locale;

  DateWidget({
    required this.date,
    required this.monthTextStyle,
    required this.dayTextStyle,
    required this.dateTextStyle,
    required this.selectionColor,
    this.width,
    this.onDateSelected,
    this.locale,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: width,
        margin: const EdgeInsets.all(3.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          color: selectionColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              DateFormat("MMM", locale)
                  .format(date)
                  .toUpperCase()
                  .toSubTitle(style: monthTextStyle), // Month

              date.day.toString().toSubTitle(style: dateTextStyle),

              DateFormat("E", locale)
                  .format(date)
                  .toUpperCase()
                  .toSubTitle(style: dayTextStyle)
            ],
          ),
        ),
      ),
      onTap: () {
        onDateSelected?.call(this.date);
      },
    );
  }
}
