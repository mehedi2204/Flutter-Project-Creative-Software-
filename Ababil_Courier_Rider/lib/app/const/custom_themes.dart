import 'package:amvines_rider_new/app/const/app_constant.dart';
import 'package:amvines_rider_new/app/const/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

const Color bluishClr = Color(0xFF4e5ae8);
const Color yellowClr = Color(0xFFFFB746);
const Color pinkClr = Color(0xFFff4667);
const Color white = Colors.white;
const primaryClr = bluishClr;
const Color darkGreyClr = Color(0xFF121212);
Color darkHeaderClr = const Color(0xFF424242);
Color get iconColor => Get.isDarkMode
    ? Colors.white.withOpacity(0.7)
    : Colors.black.withOpacity(0.7);

TextStyle _getTextStyle(
    {required double fontSize,
      //required String fontFamily,
      required FontWeight fontWeight,
      required Color color}) {
  return TextStyle(
      fontSize: fontSize,
     // fontFamily: fontFamily,
      fontWeight: fontWeight,
      color: color);
}

class CustomThemes {
  static final light = ThemeData(
      backgroundColor: Colors.white,
      primaryColor: primaryClr,
      brightness: Brightness.light);

  static final dark = ThemeData(
      backgroundColor: darkGreyClr,
      primaryColor: darkGreyClr,
      brightness: Brightness.dark);

  TextStyle subHeadingStyle(double? size) {
    return GoogleFonts.lato(
        textStyle: TextStyle(
            fontSize: size!,
            fontWeight: FontWeight.bold,
            color: Get.isDarkMode ? Colors.grey[400] : Colors.grey));
  }
  TextStyle getSemiBoldStyle(
      {double fontSize = 12, required Color color,TextDecoration textDecoration=TextDecoration.none}) {
    return _getTextStyle(
        fontSize: fontSize,
        //fontFamily: FontConstant.fontFamily,
        fontWeight: FontWeight.w600,
        color: color);
  }

  TextStyle cardTextStyle() {
    return GoogleFonts.lato(
        textStyle: const TextStyle(
            fontSize: 12, color: AppColorsConst.mBackgroundColor2));
  }

  TextStyle headingStyle(double? size) {
    return GoogleFonts.lato(
        textStyle: TextStyle(
            fontSize: size!,
            fontWeight: FontWeight.bold,
            color: Get.isDarkMode ? Colors.white : Colors.black));
  }

  TextStyle get titleStyle {
    return GoogleFonts.lato(
        textStyle: TextStyle(
            fontSize: getProportionateScreenWidth(16),
            fontWeight: FontWeight.w400,
            color: Get.isDarkMode ? Colors.white : Colors.black));
  }

  TextStyle get titleTextStyle {
    return GoogleFonts.lato(
        textStyle: TextStyle(
            fontSize: getProportionateScreenWidth(16),
            fontWeight: FontWeight.w400,
            color: Colors.black));
  }

  TextStyle get textTitleStyle {
    return GoogleFonts.lato(
        textStyle: TextStyle(
            fontSize: getProportionateScreenWidth(12),
            fontWeight: FontWeight.w400,
            color: Get.isDarkMode
                ? Colors.white.withOpacity(0.7)
                : Colors.black.withOpacity(0.7)));
  }

  TextStyle get subTitleStyle {
    return GoogleFonts.lato(
        textStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Get.isDarkMode ? Colors.grey[100] : Colors.grey[600]));
  }

  TextStyle get adminMenuTitleStyle {
    return GoogleFonts.lato(
        textStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Get.isDarkMode ? Colors.grey[800] : Colors.grey[100]));
  }

  TextStyle get detailsTextTitleStyle {
    return GoogleFonts.lato(
        textStyle: TextStyle(
            fontSize: getProportionateScreenWidth(16),
            fontWeight: FontWeight.w400,
            color:
                Get.isDarkMode ? Colors.white.withOpacity(0.6) : Colors.black));
  }

  TextStyle get detailsTextStyle {
    return GoogleFonts.lato(
        textStyle: TextStyle(
            fontSize: getProportionateScreenWidth(13),
            fontWeight: FontWeight.normal,
            color: Get.isDarkMode
                ? Colors.white.withOpacity(0.7)
                : Colors.grey[800]));
  }

  TextStyle get accountTextStyle {
    return GoogleFonts.lato(
        textStyle: TextStyle(
            fontSize: getProportionateScreenWidth(13),
            fontWeight: FontWeight.normal,
            color: Get.isDarkMode ? Colors.grey[300] : Colors.grey[800]));
  }
}
