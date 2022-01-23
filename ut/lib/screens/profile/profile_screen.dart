import 'package:flutter/material.dart';
import 'package:uet_tests/enums.dart';
import 'package:uet_tests/components/background.dart';

import 'components/body.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Background(
        child: Body(),
      ),
    );
  }
}
