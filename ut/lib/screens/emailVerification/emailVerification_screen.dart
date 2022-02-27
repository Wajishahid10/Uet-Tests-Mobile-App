import 'package:flutter/material.dart';
import 'package:uet_tests/size_config.dart';

import 'components/body.dart';

class emailVerificationScreen extends StatelessWidget {
  static String routeName = "/emailVerification";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("E-Mail Verification"),
      ),
      body: Body(),
    );
  }
}
