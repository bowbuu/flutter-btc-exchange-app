import 'package:btc_exchange_app/enums/currency_enum.dart';
import 'package:flutter/material.dart';

import '../../../themes/theme_texts.dart';

class PriceHistoryHeaderWidget extends StatelessWidget {
  final Currency currency;

  const PriceHistoryHeaderWidget({super.key, required this.currency});

  @override
  Widget build(BuildContext context) {
    TextStyle style = ThemeTexts.regular(size: 12);
    final String currencyName = currency.name.toUpperCase();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 24),
      child: Row(
        children: [
          Text("TIME", style: style),
          Expanded(
            child: Text(
              "PRICE ($currencyName)",
              style: style,
              textAlign: TextAlign.end,
            ),
          ),
          SizedBox(
            width: 100,
            child: Text(
              "%CHANGE",
              style: style,
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
