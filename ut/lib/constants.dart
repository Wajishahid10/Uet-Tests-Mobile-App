import 'package:flutter/material.dart';
import 'package:uet_tests/size_config.dart';

const kPrimaryColor = Color.fromRGBO(10, 44, 115, 1);
const kPrimaryLightColor = Color.fromRGBO(120, 190, 216, 1);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color.fromRGBO(10, 44, 115, 1), Color.fromRGBO(242, 231, 64, 1)],
);
// const kSecondaryColor = Color.fromRGBO(242, 231, 64, 1);
const kSecondaryColor = kPrimaryLightColor;
const kSecondaryLightColor = Color.fromRGBO(241, 236, 144, 1);

const kTextColor = Color(0xFF757575);

const kBackgroundColor = Color.fromRGBO(197, 227, 238, 1);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your Email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your Password";
const String kShortPassError = "Password is too Short";
const String kMatchPassError = "Passwords don't Match";
const String kNamelNullError = "Please Enter your Name";
const String kPhoneNumberNullError = "Please Enter your Phone Number";
const String kAddressNullError = "Please Enter your Address";
const String kValueNullError = "Please Enter Required Value";

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: kTextColor),
  );
}
