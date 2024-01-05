import 'package:flutter/material.dart';

class CustomColor {
  static Color darkGrey = HexColor.fromHex('#525252');
  static Color grey = HexColor.fromHex('#737477');
  static Color lightGrey = HexColor.fromHex('#9E9E9E');

  static const dPrimary = Color(0xff13414D);
  static const primary = Color(0xff5E2DD8);
  static const lPrimary = Color(0xffF5F6FA);
  static const white = Colors.white;
  static const black = Colors.black;
  static const lGreen = Color(0xffC4F44C);
  static const dGreen = Color(0xff61D485);


  static const GradientColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Colors.blue,
      Colors.red,
    ],
  );
}
extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = 'FF$hexColorString';
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}