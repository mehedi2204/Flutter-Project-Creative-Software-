import 'package:flutter/material.dart';

TextStyle _getTextStyle(
    {required double fontSize,
    required FontWeight fontWeight,
    required Color color}) {
  return TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color);
}

TextStyle getLightStyle(
    {double fontSize = 12,
    required Color color,
    TextDecoration textDecoration = TextDecoration.none})
{
  return _getTextStyle(
      fontSize: fontSize, fontWeight: FontWeight.w200, color: color);
}

TextStyle getBoldStyle(
    {double fontSize = 12,
      required Color color,
      TextDecoration textDecoration = TextDecoration.none})
{
  return _getTextStyle(
      fontSize: fontSize, fontWeight: FontWeight.bold, color: color);
}

TextStyle getSemiBoldStyle(
    {double fontSize = 12,
      required Color color,
      TextDecoration textDecoration = TextDecoration.none})
{
  return _getTextStyle(
      fontSize: fontSize, fontWeight: FontWeight.w400, color: color);
}