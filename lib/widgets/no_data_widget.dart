import 'package:btc_exchange_app/themes/theme_texts.dart';
import 'package:flutter/material.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "No Data",
        style: ThemeTexts.regular(),
      ),
    );
  }
}
