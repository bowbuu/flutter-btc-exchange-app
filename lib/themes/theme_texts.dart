import 'package:btc_exchange_app/themes/theme_colors.dart';
import 'package:flutter/material.dart';

class ThemeTexts {
  static TextStyle light({Color? color, double? size, TextDecoration? decoration, double? height}) {
    //300
    return TextStyle(
      fontSize: size ?? 16,
      fontFamily: 'Kanit-Light',
      color: color ?? ThemeColors.bodyText,
      decoration: decoration,
      height: height,
    );
  }

  static TextStyle regular({Color? color, double? size, TextDecoration? decoration, double? height}) {
    //400
    return TextStyle(
      fontSize: size ?? 16,
      fontFamily: 'Kanit-Regular',
      color: color ?? ThemeColors.bodyText,
      decoration: decoration,
      height: height,
    );
  }

  static TextStyle medium({Color? color, double? size, TextDecoration? decoration}) {
    //500
    return TextStyle(
      fontSize: size ?? 16,
      fontFamily: 'Kanit-Medium',
      color: color ?? ThemeColors.bodyText,
      decoration: decoration,
    );
  }

  static TextStyle semiBold({Color? color, double? size, TextDecoration? decoration}) {
    //600
    return TextStyle(
      fontSize: size ?? 16,
      fontFamily: 'Kanit-SemiBold',
      color: color ?? ThemeColors.bodyText,
      decoration: decoration,
    );
  }

  static TextStyle bold({Color? color, double? size, TextDecoration? decoration}) {
    //700
    return TextStyle(
      fontSize: size ?? 16,
      fontFamily: 'Kanit-Bold',
      color: color ?? ThemeColors.bodyText,
      decoration: decoration,
    );
  }
}
