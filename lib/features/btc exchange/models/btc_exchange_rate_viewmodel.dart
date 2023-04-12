import '../../../enums/currency_enum.dart';

class ExchangeRateViewModel {
  CurrencyViewModel? usd;
  CurrencyViewModel? gbp;
  CurrencyViewModel? eur;

  ExchangeRateViewModel({
    required this.usd,
    required this.gbp,
    required this.eur,
  });
}

class CurrencyViewModel {
  final String? updateTime;
  final String? code;
  final String? symbol;
  final String? rate;
  final String? description;
  final num? rateFloat;
  final String? btcExchangeRate;
  final Currency currency;
  final num percentChange;

  CurrencyViewModel({
    required this.updateTime,
    required this.code,
    required this.symbol,
    required this.rate,
    required this.description,
    required this.rateFloat,
    required this.btcExchangeRate,
    required this.currency,
    required this.percentChange,
  });
}
