import 'dart:convert';

import '../models/btc_exchange_rate_response.dart';
import 'package:http/http.dart' as http;

class BTCExchangeService {
  static Future<void> fetchExchangeRate({required Function(ExchangeRateResponse?) onSuccess, required Function(String) onError}) async {
    final response = await http.get(Uri.parse('https://api.coindesk.com/v1/bpi/currentprice.json'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      final ExchangeRateResponse result = ExchangeRateResponse.fromJson(json);
      onSuccess(result);
    } else {
      onError('Failed to fetch exchange rate');
    }
  }
}
