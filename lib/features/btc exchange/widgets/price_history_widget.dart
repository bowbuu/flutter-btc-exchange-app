import 'package:flutter/material.dart';

import '../../../themes/theme_colors.dart';
import '../../../themes/theme_texts.dart';
import '../models/btc_exchange_rate_viewmodel.dart';

class PriceHistoryWidget extends StatelessWidget {
  final int index;
  final CurrencyViewModel? history;

  const PriceHistoryWidget({super.key, required this.index, this.history});

  @override
  Widget build(BuildContext context) {
    if (history == null) return const SizedBox();

    final backgroundColor = index % 2 == 0 ? ThemeColors.lightGrey : Colors.white;

    return Container(
      color: backgroundColor,
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 24),
      child: Row(
        children: [
          _buildTimeView(),
          _buildPriceView(),
          _buildPercentChangeView(),
        ],
      ),
    );
  }

  Widget _buildTimeView() {
    final String updateTime = history!.updateTime ?? '-';
    return Text(updateTime, style: ThemeTexts.regular(size: 14));
  }

  Widget _buildPriceView() {
    final String rate = history!.rate ?? '-';
    return Expanded(
      child: Text(
        rate,
        style: ThemeTexts.medium(size: 14),
        textAlign: TextAlign.end,
      ),
    );
  }

  Widget _buildPercentChangeView() {
    final num percentChange = history!.percentChange;
    final Color percentChangeColor = percentChange < 0 ? ThemeColors.red : ThemeColors.plus;

    return SizedBox(
      width: 100,
      child: Text(
        "${percentChange.toStringAsFixed(4)}%",
        style: ThemeTexts.regular(size: 14, color: percentChangeColor),
        textAlign: TextAlign.end,
      ),
    );
  }
}
