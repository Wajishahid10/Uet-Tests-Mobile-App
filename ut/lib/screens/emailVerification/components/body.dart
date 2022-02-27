import 'package:flutter/material.dart';
import 'package:uet_tests/components/default_button.dart';
import 'package:uet_tests/constants.dart';
import 'package:uet_tests/size_config.dart';

import 'emailVerification_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.05),
              Text(
                "E-Mail Verification",
                style: headingStyle,
              ),
              Text("We sent your cverfication link to your Mail"),
              //  buildTimer(),
              //  OtpForm(),
              SizedBox(height: SizeConfig.screenHeight * 0.1),
              DefaultButton(text: "Continue", press: () async {}),
              GestureDetector(
                onTap: () {
                  // OTP code resend
                },
                child: Text(
                  "Resend Verification Email",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("This code will expired in "),
        TweenAnimationBuilder(
          tween: Tween(begin: 30.0, end: 0.0),
          duration: Duration(seconds: 30),
          builder: (_, dynamic value, child) => Text(
            "00:${value.toInt()}",
            style: TextStyle(color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
