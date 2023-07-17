extension Datetimeoperations on DateTime {
  DateTime getCurrentSunday() {
    DateTime now = DateTime.now();
    int dayOfWeek = now.weekday;
    Duration oneDay = const Duration(days: 1);
    DateTime sunday = now.subtract(oneDay * dayOfWeek);
    return sunday;
  }
}
