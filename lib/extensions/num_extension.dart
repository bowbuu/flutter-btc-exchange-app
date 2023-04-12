import 'package:intl/intl.dart';

extension NumExtensions on num {
  String formatWithCommas({int decimalPlaces = 2}) {
    return NumberFormat('#,##0.${'0' * decimalPlaces}').format(this);
  }
}
