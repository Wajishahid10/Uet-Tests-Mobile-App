import 'package:flutter/material.dart';
import 'package:uet_tests/constants.dart';
import 'package:uet_tests/enums.dart';
import 'package:uet_tests/components/background.dart';

import 'components/body.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor.withOpacity(0.5),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text("Profile"),
          ],
        ),
      ),
      body: Body(),
    );
  }
}
