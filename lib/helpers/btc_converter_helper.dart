num convertCurrencyToBTC(double amount, num? exchangeRate) {
  if (exchangeRate == null || exchangeRate == 0) return 0;

  return amount / exchangeRate;
}

num getPercentChange(num? current, num? previous) {
  if (current == null || previous == null) {
    throw ("Current or previous is null");
  }

  final num percentChange = ((current * 100) / previous) - 100;

  return percentChange;
}
