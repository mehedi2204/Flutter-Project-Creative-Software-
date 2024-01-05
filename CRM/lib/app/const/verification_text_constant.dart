import 'package:flutter/material.dart';

class VerificationConst{
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