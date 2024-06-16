import 'package:intl/intl.dart';

class Functions {
  String createEventId(String type, String name) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyyMMddHHmmss').format(now);
    String eventId = '$type-$name-$formattedDate';
    return eventId;
  }
}
