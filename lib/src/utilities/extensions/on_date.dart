import 'package:intl/intl.dart';

extension DateFormatExtensions on String {
  String day() {
    return DateFormat('dd').format(DateTime.parse(this));
  }

  String hour() {
    return DateFormat('hh').format(DateTime.parse(this));
  }

  String minute() {
    return DateFormat('mm').format(DateTime.parse(this));
  }

  String readableWithTimestamp() {
    return DateFormat('dd MMM yyyy hh:mm a').format(DateTime.parse(this));
  }

  String readableDate() {
    return DateFormat('dd MMM, yyyy').format(DateTime.parse(this));
  }

  String hourWithMinute() {
    return DateFormat('hh:mm a').format(DateTime.parse(this));
  }

  String utcToStringDate() {
    return DateFormat(
      'dd MMM, yyyy',
    ).format(DateTime.fromMillisecondsSinceEpoch(int.parse(this)));
  }

  String utcToStringTime() {
    return DateFormat(
      'hh:mm a',
    ).format(DateTime.fromMillisecondsSinceEpoch(int.parse(this)));
  }

  int stringDateToUtc() {
    DateTime parsedDate = DateFormat("dd MMM, yyyy").parse(this);
    return parsedDate.toUtc().millisecondsSinceEpoch;
  }

  int stringTimeToUtc() {
    // Assume today's date as the reference date
    DateTime now = DateTime.now();
    String referenceDate = DateFormat("yyyy-MM-dd").format(now);

    // Combine reference date with the time string
    String fullDateTimeString = "$referenceDate $this";
    // Parse the combined date and time
    DateTime parsedDateTime = DateFormat(
      "yyyy-MM-dd hh:mm a",
    ).parse(fullDateTimeString);

    return parsedDateTime.toUtc().millisecondsSinceEpoch;
  }

  String? notifiationsTimeStamp() {
    DateTime timestamp = DateTime.parse(this);
    DateTime now = DateTime.now().toUtc();
    Duration difference = now.difference(timestamp);
    String? formattedTimestamp;

    if (difference.inSeconds < 60) {
      formattedTimestamp =
          '${difference.inSeconds} ${difference.inDays > 1 ? 'secs' : 'sec'} ago';
    } else if (difference.inMinutes < 60) {
      formattedTimestamp =
          '${difference.inMinutes} ${difference.inMinutes > 1 ? 'mins' : 'min'} ago';
    } else if (difference.inHours < 24) {
      formattedTimestamp =
          '${difference.inHours} ${difference.inHours > 1 ? 'hrs' : 'hr'} ago';
    } else {
      formattedTimestamp = DateFormat.yMMMd().format(timestamp);
    }

    return formattedTimestamp;
  }
}
