class ExchangeRateResponse {
  final DateTime updated;
  final String disclaimer;
  final String chartName;
  final Map<String, CurrencyData> bpi;

  ExchangeRateResponse({
    required this.updated,
    required this.disclaimer,
    required this.chartName,
    required this.bpi,
  });

  factory ExchangeRateResponse.fromJson(Map<String, dynamic> json) {
    return ExchangeRateResponse(
      updated: DateTime.parse(json['time']['updatedISO']),
      disclaimer: json['disclaimer'],
      chartName: json['chartName'],
      bpi: Map.from(json['bpi']).map(
        (key, value) => MapEntry(
          key,
          CurrencyData.fromJson(Map<String, dynamic>.from(value)),
        ),
      ),
    );
  }
}

class CurrencyData {
  final String code;
  final String symbol;
  final String rate;
  final String description;
  final num rateFloat;

  CurrencyData({
    required this.code,
    required this.symbol,
    required this.rate,
    required this.description,
    required this.rateFloat,
  });

  factory CurrencyData.fromJson(Map<String, dynamic> json) {
    return CurrencyData(
      code: json['code'],
      symbol: json['symbol'],
      rate: json['rate'],
      description: json['description'],
      rateFloat: json['rate_float'].toDouble(),
    );
  }
}
