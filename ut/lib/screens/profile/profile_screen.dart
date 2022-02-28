import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uet_tests/components/background.dart';

import 'package:uet_tests/main.dart';

import 'components/loggedInBody.dart';
import 'components/noLoginBody.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    User? user = auth.currentUser;
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: user == null ? noLoginBody() : LoggedInBody(),
    );
  }
}
