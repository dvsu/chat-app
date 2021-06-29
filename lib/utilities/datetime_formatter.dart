import 'package:intl/intl.dart';

class DateTimeParser {
  final DateFormat timeFormatter = DateFormat('HH:mm');
  final DateFormat dateFormatter = DateFormat('dd MMMM yyyy, HH:mm:ss');
  final DateFormat datetimeFormatter = DateFormat('dd MMMM yyyy, HH:mm:ss');

  String datetimeToStringTime(DateTime datetime) {
    return timeFormatter.format(datetime);
  }
}
