import 'package:flutter/material.dart';

extension AppExtension on BuildContext {
  //size
  double get mediaQueryHeight => MediaQuery.sizeOf(this).height;
  double get mediaQueryWidth => MediaQuery.sizeOf(this).width;
  double dynamicHeight(double value) => mediaQueryHeight * value;
  double dynamicWidth(double value) => mediaQueryWidth * value;

  //color
  Color get primaryColor => const Color(0xFF29B674);
  //textstyle
  TextStyle get smallTextStyle => const TextStyle(
        fontSize: 16,
      );
  TextStyle get mediumTextStyle => const TextStyle(
        fontSize: 18,
      );
  TextStyle get largeTextStyle => const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
      );
  TextStyle get largerTextStyle => const TextStyle(
        fontSize: 22,
      );
  TextStyle get headerTitleStyle => const TextStyle(
        color: Colors.white,
        fontSize: 48,
        fontWeight: FontWeight.w500,
      );
}
