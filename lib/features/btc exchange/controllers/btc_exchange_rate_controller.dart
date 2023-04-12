import 'dart:async';

import 'package:btc_exchange_app/pages/btc%20exchange/models/btc_exchange_rate_viewmodel.dart';
import 'package:btc_exchange_app/pages/btc%20exchange/service/btc_exchange_service.dart';
import 'package:btc_exchange_app/enums/currency_enum.dart';
import 'package:btc_exchange_app/helpers/date_helper.dart';
import 'package:flutter/foundation.dart';

import '../../../helpers/btc_converter_helper.dart';
import '../models/btc_exchange_rate_response.dart';

enum DataState {
  loading,
  loaded,
  noData,
  error,
}

class BTCExchangeRateController extends ChangeNotifier {
  final List<ExchangeRateViewModel> _exchangeRates = [];
  String? _errorMessage;
  DataState _state = DataState.loading;
  late Timer _timer;

  // Getter
  List<ExchangeRateViewModel> get exchangeRates => _exchangeRates;
  String? get errorMessage => _errorMessage;
  DataState? get state => _state;

  void startTimerToLoadData() {
    _timer = Timer.periodic(const Duration(minutes: 1), (_) => loadData());
  }

  void stopTimerToLoadData() {
    _timer.cancel();
  }

  List<CurrencyViewModel?> getHistories(Currency currency) {
    switch (currency) {
      case Currency.usd:
        return _exchangeRates.map((element) => element.usd).toList();
      case Currency.gbp:
        return _exchangeRates.map((element) => element.gbp).toList();
      case Currency.eur:
        return _exchangeRates.map((element) => element.eur).toList();
      default:
        return [];
    }
  }

  void loadData() {
    BTCExchangeService.fetchExchangeRate(
      onSuccess: (result) {
        _addExchangeRages(result);
        _state = _exchangeRates.isEmpty ? DataState.noData : DataState.loaded;
        notifyListeners();
      },
      onError: (message) {
        _state = DataState.error;
        _errorMessage = message;
        notifyListeners();
      },
    );
  }

  void _addExchangeRages(ExchangeRateResponse? result) {
    final viewModel = ExchangeRateViewModel(
      usd: _getViewModel(
        currency: Currency.usd,
        data: result?.bpi["USD"],
        updateTime: convertDateToString(result?.updated),
        previousRate: (_exchangeRates.isEmpty) ? null : _exchangeRates.last.usd?.rateFloat,
      ),
      gbp: _getViewModel(
        currency: Currency.gbp,
        data: result?.bpi["GBP"],
        updateTime: convertDateToString(result?.updated),
        previousRate: (_exchangeRates.isEmpty) ? null : _exchangeRates.last.gbp?.rateFloat,
      ),
      eur: _getViewModel(
        currency: Currency.eur,
        data: result?.bpi["EUR"],
        updateTime: convertDateToString(result?.updated),
        previousRate: (_exchangeRates.isEmpty) ? null : _exchangeRates.last.eur?.rateFloat,
      ),
    );

    _exchangeRates.add(viewModel);
  }

  CurrencyViewModel _getViewModel({required Currency currency, CurrencyData? data, String? updateTime, num? previousRate}) {
    final num? currentRateFloat = data?.rateFloat;
    final num? btcExchangeRate = (currentRateFloat == null || currentRateFloat == 0) ? null : 1 / currentRateFloat;
    final num? previousRateFloat = previousRate ?? currentRateFloat;
    final num percentChange = getPercentChange(currentRateFloat, previousRateFloat);

    final String? symbol = data?.symbol.replaceAll("&pound;", "£").replaceAll("&#36;", "\$").replaceAll("&euro;", "€");

    return CurrencyViewModel(
      updateTime: updateTime,
      code: data?.code,
      symbol: symbol,
      rate: data?.rate,
      description: data?.description,
      rateFloat: data?.rateFloat,
      btcExchangeRate: "1 $symbol = ${btcExchangeRate?.toStringAsFixed(5)} BTC",
      currency: currency,
      percentChange: percentChange,
    );
  }
}
