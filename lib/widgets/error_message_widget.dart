import 'package:btc_exchange_app/themes/theme_texts.dart';
import 'package:flutter/material.dart';

class ErrorMessageWidget extends StatelessWidget {
  final String? message;
  const ErrorMessageWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message ?? "Not Found",
        style: ThemeTexts.regular(),
      ),
    );
  }
}
