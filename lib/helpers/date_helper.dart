import 'package:intl/intl.dart';

String convertDateToString(DateTime? dateTime) {
  if (dateTime == null) return "";

  final DateTime date = dateTime.add(const Duration(hours: 7));
  final formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
  final formattedDate = formatter.format(date);
  return formattedDate;
}
