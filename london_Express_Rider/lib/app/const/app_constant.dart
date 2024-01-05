import 'package:flutter/material.dart';

class AppColorsConst {
  static const mBackgroundColor = Color(0xFFFFFFFF);
  static const mBandColor = Color(0xFFEBEBEB);
  static const oPrimaryColor = Colors.teal;/*Color.fromARGB(255, 145, 180, 88);*/

  static const mBackgroundColor2 = Color(0xFFff1493);
  static const oPrimaryLightColor = Color(0xFFFFECDF);
  static const mBorderColor = Color(0xFFE8E8F3);
  static const orrange = Color.fromARGB(255, 180, 74, 3);
  static const red = Color.fromARGB(255, 205, 40, 3);
  static const white = Color.fromARGB(255, 255, 255, 255);
  static const oPrimaryGradientColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
  );
  static const oSecondaryColor = Color(0xFF979797);
  static const oTextColor = Color(0xFF757575);

  static const oAnimationDuration = Duration(milliseconds: 200);

  static const dPrimaryColor = Color(0xff151B54); /*Color.fromARGB(255, 82, 105, 44);*/

  static const dPrimaryLightColor = Color(0xFFFFECDF);
  static const dPrimaryGradientColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color.fromARGB(255, 242, 222, 200),
      Color.fromARGB(255, 248, 216, 240)
    ],
  );
  static const dSecondaryColor = Color(0xFF979797);
  static const dTextColor = Color(0xFF757575);
  static const darkGrey = Color.fromARGB(255, 42, 41, 41);

  static const dAnimationDuration = Duration(milliseconds: 200);

  static const headingStyle = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    height: 1.5,
  );

  static const defaultDuration = Duration(milliseconds: 250);

  static final RegExp emailValidatorRegExp =
      RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');
  static const String dEmailNullError = "Please Enter your email";
  static const String dInvalidEmailError = "Please Enter Valid Email";
  static const String dPassNullError = "Please Enter your password";
  static const String dShortPassError = "Password is too short";
  static const String dMatchPassError = "Passwords don't match";
  static const String dNamelNullError = "Please Enter your name";
  static const String dPhoneNumberNullError = "Please Enter your phone number";
  static const String dAddressNullError = "Please Enter your address";
}
