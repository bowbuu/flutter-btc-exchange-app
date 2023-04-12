import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../themes/theme_colors.dart';
import '../themes/theme_texts.dart';

class TextInputWidget extends StatelessWidget {
  final TextEditingController controller;
  final Function(String)? onChanged;

  const TextInputWidget({super.key, required this.controller, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: ThemeTexts.regular(size: 16),
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,10}')),
      ],
      decoration: InputDecoration(
        counter: const Offstage(),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: ThemeColors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: ThemeColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: ThemeColors.border),
        ),
      ),
      onChanged: (value) {
        if (onChanged != null) onChanged!(value);
      },
    );
  }
}
