// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:btc_exchange_app/enums/currency_enum.dart';
import 'package:btc_exchange_app/pages/btc%20exchange/models/btc_exchange_rate_viewmodel.dart';
import 'package:btc_exchange_app/pages/btc%20exchange/widgets/currency_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Currency Widget', () {
    testWidgets('renders currency information correctly', (WidgetTester tester) async {
      // Create a mock currency view model
      final mockViewModel = CurrencyViewModel(
        updateTime: null,
        code: 'USD',
        symbol: '\$',
        rate: '50,000',
        description: 'US Dollar',
        rateFloat: null,
        btcExchangeRate: '0.00123',
        currency: Currency.usd,
        percentChange: 0,
      );

      // Build the CurrencyWidget with the mock view model
      await tester.pumpWidget(
        MaterialApp(
          home: CurrencyWidget(
            currencyViewModel: mockViewModel,
          ),
        ),
      );

      // Verify that the CurrencyWidget renders the correct currency information
      expect(find.text('USD'), findsOneWidget);
      expect(find.text('US Dollar'), findsOneWidget);
      expect(find.text('\$ 50,000'), findsOneWidget);
      expect(find.text('0.00123'), findsOneWidget);
    });
  });
}
