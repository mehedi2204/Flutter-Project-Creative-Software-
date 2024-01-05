import 'package:flutter/material.dart';


  class CustomColor{

    static Color darkGrey = HexColor.fromHex('#525252');
    static Color grey = HexColor.fromHex('#737477');
    static Color lightGrey = HexColor.fromHex('#9E9E9E');


    static const Color backgroundColor = Colors.orangeAccent;
    static const  textColor = Color(0xff000000);
    static const Color darkPrimary = Color(0xff146C94);
    static const Color lightPrimary = Color(0xff19A7CE);
    static final Color textColorLight = Color(0xff000000).withOpacity(0.5);

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