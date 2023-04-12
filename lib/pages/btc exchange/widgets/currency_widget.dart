import 'package:btc_exchange_app/pages/btc%20exchange/models/btc_exchange_rate_viewmodel.dart';
import 'package:btc_exchange_app/pages/btc%20exchange/screens/price_history_screen.dart';
import 'package:btc_exchange_app/themes/theme_colors.dart';
import 'package:btc_exchange_app/themes/theme_texts.dart';
import 'package:flutter/material.dart';

class CurrencyWidget extends StatelessWidget {
  final CurrencyViewModel? currencyViewModel;
  final EdgeInsetsGeometry? padding;
  final bool clickable;

  const CurrencyWidget({super.key, this.padding, this.clickable = true, required this.currencyViewModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (clickable) _routeToPriceHistory(context);
      },
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: padding ?? const EdgeInsets.symmetric(vertical: 24, horizontal: 0),
              child: Row(
                children: [
                  _buildLeadingView(),
                  _buildTrailingView(),
                  if (clickable) _buildNextIcon(),
                ],
              ),
            ),
            Divider(color: ThemeColors.border, height: 0.5, thickness: 0.5),
          ],
        ),
      ),
    );
  }

  Widget _buildLeadingView() {
    final String code = currencyViewModel?.code ?? '-';
    final String description = currencyViewModel?.description ?? '-';

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(code, style: ThemeTexts.semiBold(size: 24)),
          Text(description, style: ThemeTexts.regular(size: 14, color: ThemeColors.grey)),
        ],
      ),
    );
  }

  Widget _buildTrailingView() {
    final String price = "${currencyViewModel?.symbol} ${currencyViewModel?.rate}";
    final String btcExchangeRate = currencyViewModel?.btcExchangeRate ?? '-';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(price, style: ThemeTexts.semiBold(size: 24, color: ThemeColors.primary)),
        Text(btcExchangeRate, style: ThemeTexts.regular(size: 14, color: ThemeColors.grey)),
      ],
    );
  }

  Widget _buildNextIcon() {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Icon(Icons.arrow_forward_ios_rounded, size: 18, color: ThemeColors.grey),
    );
  }

  void _routeToPriceHistory(BuildContext context) {
    if (currencyViewModel?.currency == null) throw ("Can not route : Currency can not be null");

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => PriceHistoryScreen(
          currency: currencyViewModel!.currency,
        ),
      ),
    );
  }
}
