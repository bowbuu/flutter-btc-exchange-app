import 'package:btc_exchange_app/pages/btc%20exchange/widgets/btc_converter_widget.dart';
import 'package:btc_exchange_app/themes/theme_texts.dart';
import 'package:btc_exchange_app/widgets/error_message_widget.dart';
import 'package:btc_exchange_app/widgets/loading_widget.dart';
import 'package:btc_exchange_app/widgets/no_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/btc_exchange_rate_controller.dart';
import '../models/btc_exchange_rate_viewmodel.dart';
import '../widgets/currency_widget.dart';

class BTCExchangeScreen extends StatefulWidget {
  const BTCExchangeScreen({super.key});

  @override
  State<BTCExchangeScreen> createState() => _BTCExchangeScreenState();
}

class _BTCExchangeScreenState extends State<BTCExchangeScreen> {
  @override
  void initState() {
    super.initState();

    Provider.of<BTCExchangeRateController>(context, listen: false).startTimerToLoadData();
  }

  @override
  void dispose() {
    super.dispose();

    Provider.of<BTCExchangeRateController>(context, listen: false).stopTimerToLoadData();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAppNameView(),
            Expanded(child: _buildContentView()),
          ],
        ),
      ),
    );
  }

  Widget _buildContentView() {
    return Consumer<BTCExchangeRateController>(
      builder: (context, exchangeRateController, _) {
        final state = exchangeRateController.state;

        switch (state) {
          case DataState.loading:
            return const LoadingWidget();
          case DataState.error:
            return ErrorMessageWidget(message: exchangeRateController.errorMessage);
          case DataState.loaded:
            return _buildCurrencyListView(exchangeRateController.exchangeRates.last);
          case DataState.noData:
            return const NoDataWidget();
          default:
            return const SizedBox();
        }
      },
    );
  }

  Widget _buildAppNameView() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 48, 24, 16),
      child: Text(
        "BTC Exchange",
        style: ThemeTexts.semiBold(size: 32),
        textAlign: TextAlign.start,
      ),
    );
  }

  Widget _buildCurrencyListView(ExchangeRateViewModel viewModel) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
      children: [
        BTCConverterWidget(exchangeRateViewModel: viewModel),
        const SizedBox(height: 34),
        CurrencyWidget(currencyViewModel: viewModel.usd),
        CurrencyWidget(currencyViewModel: viewModel.gbp),
        CurrencyWidget(currencyViewModel: viewModel.eur),
      ],
    );
  }
}
