import 'package:flutter/material.dart';
import 'package:uet_tests/screens/sign_in/sign_in_screen.dart';
import 'package:uet_tests/screens/sign_up/sign_up_screen.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';

class noLoginBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          //  ProfilePic(),
          SizedBox(height: 70),
          NoProfileMenu(
            text: "Login/SignIn",
            icon: Icons.login,
            press: () {
              Navigator.pushReplacementNamed(context, SignInScreen.routeName);
            },
          ),
          NoProfileMenu(
            text: "Create Account",
            icon: Icons.manage_accounts,
            press: () {
              Navigator.pushReplacementNamed(context, SignUpScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
