import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF7193F3);
const kSecondaryColor = Color(0xFFFE9901);
const kContentColorLightTheme = Color(0xFF1D1D35);
const kContentColorDarkTheme = Color(0xFFF5FCF9);
const kWarninngColor = Color(0xFFF3BB1C);
const kErrorColor = Color(0xFFF03738);

const kDefaultPadding = 20.0;

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
const String kEmailNullError = 'Please enter your email';
const String kInvalidEmailError = 'Email invalid, please try again';
const String kPassNullError = 'Please enter your password';
const String kShortPassError = 'Password is too short';
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = 'Please enter your name';
const String kPhoneNumberNullError = 'Please enter your phone number';
const String kAddressNullError = 'Please enter your address';
