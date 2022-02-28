import 'package:flutter/material.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';

class noLoginBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          NoProfileMenu(
            text: "Login/SignIn",
            icon: Icons.login,
            press: () => {},
          ),
          NoProfileMenu(
            text: "Create Account",
            icon: Icons.manage_accounts,
            press: () {},
          ),
        ],
      ),
    );
  }
}
