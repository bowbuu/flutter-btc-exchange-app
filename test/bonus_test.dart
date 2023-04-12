import 'package:btc_exchange_app/bonus/fibo.dart';
import 'package:btc_exchange_app/bonus/filter_array.dart';
import 'package:btc_exchange_app/bonus/prime.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('generatePrimes', () {
    test('returns an empty list when given n = 1', () {
      expect(generatePrimes(1), []);
    });

    test('returns the correct list of primes when given n = 10', () {
      expect(generatePrimes(10), [2, 3, 5, 7]);
    });

    test('returns the correct list of primes when given n = 20', () {
      expect(generatePrimes(20), [2, 3, 5, 7, 11, 13, 17, 19]);
    });

    test('returns the correct list of primes when given n = 100', () {
      expect(generatePrimes(100), [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]);
    });
  });

  group('generateFibonacciSequence', () {
    test('returns an empty list when given n = 0', () {
      expect(generateFibonacciSequence(0), []);
    });

    test('returns [0] when given n = 1', () {
      expect(generateFibonacciSequence(1), [0]);
    });

    test('returns the correct sequence when given n = 5', () {
      expect(generateFibonacciSequence(5), [0, 1, 1, 2, 3]);
    });

    test('returns the correct sequence when given n = 10', () {
      expect(generateFibonacciSequence(10), [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]);
    });
  });

  group('filterFromSecondArray', () {
    test('returns an empty list when given empty lists', () {
      expect(filterFromSecondArray([], []), []);
    });

    test('returns an empty list when listA has no matching elements in listB', () {
      expect(filterFromSecondArray([1, 2, 3], [4, 5, 6]), []);
    });

    test('returns a filtered list when listA has matching elements in listB', () {
      expect(filterFromSecondArray([1, 2, 3], [2, 3, 4]), [2, 3]);
    });

    test('returns a filtered list when listA has duplicate matching elements in listB', () {
      expect(filterFromSecondArray([1, 2, 2, 3], [2, 3, 3, 4]), [2, 2, 3]);
    });
  });
}
