import 'package:btc_exchange_app/helpers/btc_converter_helper.dart';
import 'package:btc_exchange_app/helpers/date_helper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

void main() {
  group('Helper Functions', () {
    test('Test convertCurrencyToBTC function with valid input', () {
      expect(convertCurrencyToBTC(100.0, 50000), equals(0.002));
    });

    test('Test convertCurrencyToBTC function with zero input', () {
      expect(convertCurrencyToBTC(0, 50000), equals(0));
    });

    test('Test convertCurrencyToBTC function with null exchange rate', () {
      expect(convertCurrencyToBTC(100.0, null), equals(0));
    });

    test('Test getPercentChange function with null input', () {
      expect(() => getPercentChange(null, 100), throwsA(isA<String>()));
      expect(() => getPercentChange(100, null), throwsA(isA<String>()));
    });

    test('Test getPercentChange function with positive change', () {
      expect(getPercentChange(100, 50), equals(100));
    });

    test('Test getPercentChange function with negative change', () {
      expect(getPercentChange(50, 100), equals(-50));
    });

    test('Test convertDateToString function with valid date', () {
      final dateTime = DateTime(2022, 4, 12, 10, 0, 0);
      final expectedOutput = DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime.add(const Duration(hours: 7)));
      expect(convertDateToString(dateTime), equals(expectedOutput));
    });

    test('Test convertDateToString function with null date', () {
      expect(convertDateToString(null), equals(""));
    });
  });
}
