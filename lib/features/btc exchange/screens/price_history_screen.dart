import 'package:btc_exchange_app/features/btc%20exchange/widgets/currency_widget.dart';
import 'package:btc_exchange_app/features/btc%20exchange/widgets/price_history_header_widget.dart';
import 'package:btc_exchange_app/features/btc%20exchange/widgets/price_history_widget.dart';
import 'package:btc_exchange_app/enums/currency_enum.dart';
import 'package:btc_exchange_app/themes/theme_colors.dart';
import 'package:btc_exchange_app/themes/theme_texts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/btc_exchange_rate_controller.dart';
import '../models/btc_exchange_rate_viewmodel.dart';

class PriceHistoryScreen extends StatefulWidget {
  final Currency currency;

  const PriceHistoryScreen({super.key, required this.currency});

  @override
  State<PriceHistoryScreen> createState() => _PriceHistoryScreenState();
}

class _PriceHistoryScreenState extends State<PriceHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("BTC/USD History", style: ThemeTexts.medium(size: 20)),
        backgroundColor: Colors.white,
        foregroundColor: ThemeColors.bodyText,
        centerTitle: true,
      ),
      body: _buildHistoryView(),
    );
  }

  Widget _buildHistoryView() {
    return Consumer<BTCExchangeRateController>(
      builder: (context, exchangeRateController, _) {
        List<CurrencyViewModel?> histories = exchangeRateController.getHistories(widget.currency).reversed.toList();

        return Column(
          children: [
            CurrencyWidget(
              currencyViewModel: histories.last,
              clickable: false,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            ),
            PriceHistoryHeaderWidget(currency: widget.currency),
            _buildPriceHistoryListView(histories),
          ],
        );
      },
    );
  }

  Widget _buildPriceHistoryListView(List<CurrencyViewModel?> histories) {
    return Expanded(
      child: ListView.builder(
        itemCount: histories.length,
        itemBuilder: (context, index) {
          return PriceHistoryWidget(
            index: index,
            history: histories[index],
          );
        },
      ),
    );
  }
}
