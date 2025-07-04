import '../export.dart';

Future<String?> datePicker(BuildContext context,
    {DateTime? lastDate, DateTime? firstDate, DateTime? initialDate}) async {
  final date = await showDatePicker(
    context: context,
    firstDate:
        firstDate ?? DateTime.now().subtract(const Duration(days: 365 * 20)),
    // firstDate: DateTime.now(),
    lastDate: lastDate ?? DateTime.now().add(const Duration(days: 365 * 15)),
    initialDate: initialDate ?? DateTime.now(),
  ).then((v) {
    if (v == null) return null;
    final now = DateTime.now();
    return DateTime(v.year, v.month, v.day, now.hour, now.minute, now.second);
  });

  return date!.toString().readableDate();
}

Future<String?> timePicker(BuildContext context, TimeOfDay? initialTime) async {
  final time = await showTimePicker(
    context: context,
    initialTime: initialTime ?? TimeOfDay.now(),
  );
  final now = DateTime.now();
  final date = DateTime(now.year, now.month, now.day, time!.hour, time.minute);
  return date.toString().hourWithMinute();
}

int getUnixDateTime() {
  DateTime now = DateTime.now().toUtc(); // Current UTC time
  int unixTimestamp = now.millisecondsSinceEpoch;
  return unixTimestamp;
}

int getUnixDate() {
  DateTime now = DateTime.now(); // Current UTC time
  DateTime date = DateTime(now.year, now.month, now.day).toUtc();
  int unixTimestamp = date.millisecondsSinceEpoch;
  return unixTimestamp;
}
