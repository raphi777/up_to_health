import 'package:timezone/timezone.dart' as tz;

// show notification 10 minutes
tz.TZDateTime nextInstanceOf1Minutes() {
  final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
  tz.TZDateTime scheduledDate =
  tz.TZDateTime(tz.local, now.year, now.month, now.day, now.hour, now.minute + 1);
  if (scheduledDate.isBefore(now)) {
    scheduledDate = scheduledDate.add(const Duration(minutes: 1));
  }
  return scheduledDate;
}
// show notification 10 minutes
tz.TZDateTime nextInstanceOf10Minutes() {
  final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
  tz.TZDateTime scheduledDate =
  tz.TZDateTime(tz.local, now.year, now.month, now.day, now.hour, now.minute + 10);
  if (scheduledDate.isBefore(now)) {
    scheduledDate = scheduledDate.add(const Duration(minutes: 10));
  }
  return scheduledDate;
}
// show notification every hour
tz.TZDateTime nextInstanceOf1Hour() {
  final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
  tz.TZDateTime scheduledDate =
  tz.TZDateTime(tz.local, now.year, now.month, now.day, now.hour + 1);
  if (scheduledDate.isBefore(now)) {
    scheduledDate = scheduledDate.add(const Duration(hours: 1));
  }
  return scheduledDate;
}
// show notification every 2 hours
tz.TZDateTime nextInstanceOf2Hours() {
  final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
  tz.TZDateTime scheduledDate =
  tz.TZDateTime(tz.local, now.year, now.month, now.day, now.hour + 2);
  if (scheduledDate.isBefore(now)) {
    scheduledDate = scheduledDate.add(const Duration(hours: 2));
  }
  return scheduledDate;
}
// show notification every day at 8:00 (or weekly 18:00 with DateTimeComponents.dayOfWeekAndTime)
tz.TZDateTime nextInstanceOf8() {
  final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
  tz.TZDateTime scheduledDate =
  tz.TZDateTime(tz.local, now.year, now.month, now.day, 8);
  if (scheduledDate.isBefore(now)) {
    scheduledDate = scheduledDate.add(const Duration(days: 1));
  }
  return scheduledDate;
}
// show notification every day at 18:00 (or weekly 18:00 with DateTimeComponents.dayOfWeekAndTime)
tz.TZDateTime nextInstanceOf10() {
  final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
  tz.TZDateTime scheduledDate =
  tz.TZDateTime(tz.local, now.year, now.month, now.day, 18);
  if (scheduledDate.isBefore(now)) {
    scheduledDate = scheduledDate.add(const Duration(days: 1));
  }
  return scheduledDate;
}
// show notification every day at 20:00 (or weekly 20:00 with DateTimeComponents.dayOfWeekAndTime)
tz.TZDateTime _nextInstanceOf20() {
  final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
  tz.TZDateTime scheduledDate =
  tz.TZDateTime(tz.local, now.year, now.month, now.day, 20);
  if (scheduledDate.isBefore(now)) {
    scheduledDate = scheduledDate.add(const Duration(days: 1));
  }
  return scheduledDate;
}
// show notification every sunday at 20:00
tz.TZDateTime nextInstanceOfSunday20() {
  tz.TZDateTime scheduledDate = _nextInstanceOf20();
  while (scheduledDate.weekday != DateTime.sunday) {
    scheduledDate = scheduledDate.add(const Duration(days: 1));
  }
  return scheduledDate;
}
tz.TZDateTime nextInstanceOfYear() {
  final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
  return tz.TZDateTime(tz.local, now.year+1, now.month, now.day, 20);
}
tz.TZDateTime nextInstanceOf2Year() {
  final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
  return tz.TZDateTime(tz.local, now.year+2, now.month, now.day, 20);
}
tz.TZDateTime nextInstanceOf3Year() {
  final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
  return tz.TZDateTime(tz.local, now.year+3, now.month, now.day, 20);
}
tz.TZDateTime nextInstanceOf5Year() {
  final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
  return tz.TZDateTime(tz.local, now.year+5, now.month, now.day, 20);
}