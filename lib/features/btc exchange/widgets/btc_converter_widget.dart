import 'package:btc_exchange_app/features/btc%20exchange/models/btc_exchange_rate_viewmodel.dart';
import 'package:btc_exchange_app/enums/currency_enum.dart';
import 'package:btc_exchange_app/helpers/btc_converter_helper.dart';
import 'package:btc_exchange_app/themes/theme_colors.dart';
import 'package:btc_exchange_app/themes/theme_texts.dart';
import 'package:btc_exchange_app/widgets/text_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:btc_exchange_app/extensions/num_extension.dart';

class BTCConverterWidget extends StatefulWidget {
  final ExchangeRateViewModel? exchangeRateViewModel;

  const BTCConverterWidget({super.key, required this.exchangeRateViewModel});

  @override
  State<BTCConverterWidget> createState() => _BTCConverterWidgetState();
}

class _BTCConverterWidgetState extends State<BTCConverterWidget> {
  final String _initialValue = "1";
  final TextEditingController _textEditingController = TextEditingController();

  ExchangeRateViewModel? _exchangeRateViewModel;
  List<Currency> currencies = [Currency.usd, Currency.gbp, Currency.eur];
  Currency _currencyValue = Currency.usd;
  String btcPrice = "";

  @override
  void initState() {
    super.initState();
    _exchangeRateViewModel = widget.exchangeRateViewModel;
    _textEditingController.text = _initialValue;
    _onPriceChanged(_initialValue);
  }

  @override
  void didUpdateWidget(covariant BTCConverterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    setState(() {
      _exchangeRateViewModel = widget.exchangeRateViewModel;
      _onPriceChanged(_textEditingController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: ThemeColors.border, width: 0.5),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: HexColor("#214A72").withOpacity(0.16),
            offset: const Offset(0, 4),
            blurRadius: 12,
          )
        ],
      ),
      child: Column(
        children: [
          _buildCurrencyInput(),
          const SizedBox(height: 24),
          _buildBTCDisplay(),
        ],
      ),
    );
  }

  Widget _buildCurrencyInput() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildCurrencyDropDownView(),
        Expanded(
          child: TextInputWidget(
            controller: _textEditingController,
            onChanged: _onPriceChanged,
          ),
        ),
      ],
    );
  }

  Widget _buildCurrencyDropDownView() {
    return Container(
      width: 80,
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: ThemeColors.lightGrey,
        borderRadius: BorderRadius.circular(4),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          icon: Icon(Icons.keyboard_arrow_down_rounded, size: 20, color: ThemeColors.bodyText),
          items: _getCurrencyDropdownItems(),
          onChanged: _onCurrencyChange,
          value: _currencyValue,
        ),
      ),
    );
  }

  Widget _buildBTCDisplay() {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(text: "BTC = ", style: ThemeTexts.regular(size: 20)),
          TextSpan(text: btcPrice, style: ThemeTexts.semiBold(size: 20, color: ThemeColors.red)),
        ],
      ),
    );
  }

  void _onPriceChanged(String value) {
    num? exchangeRate;

    switch (_currencyValue) {
      case Currency.usd:
        exchangeRate = _exchangeRateViewModel?.usd?.rateFloat ?? 0;
        break;
      case Currency.gbp:
        exchangeRate = _exchangeRateViewModel?.gbp?.rateFloat ?? 0;
        break;
      case Currency.eur:
        exchangeRate = _exchangeRateViewModel?.eur?.rateFloat ?? 0;
        break;
      default:
        break;
    }

    setState(() {
      final double amount = value.isEmpty ? 0 : double.parse(value);
      final num btcValue = convertCurrencyToBTC(amount, _currencyValue, exchangeRate);
      btcPrice = btcValue.formatWithCommas(decimalPlaces: 10);
    });
  }

  void _onCurrencyChange(Currency? value) {
    if (value == null) return;

    setState(() {
      _currencyValue = value;
      _onPriceChanged(_textEditingController.text);
    });
  }

  List<DropdownMenuItem<Currency>> _getCurrencyDropdownItems() {
    return currencies.map<DropdownMenuItem<Currency>>(
      (Currency value) {
        return DropdownMenuItem(
          value: value,
          child: Text(
            value.name.toUpperCase(),
            style: ThemeTexts.regular(size: 16),
          ),
        );
      },
    ).toList();
  }
}
