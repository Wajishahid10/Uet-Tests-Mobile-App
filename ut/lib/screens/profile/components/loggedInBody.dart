import 'package:flutter/material.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:uet_tests/main.dart';
import 'package:uet_tests/screens/cart/cart_screen.dart';
import 'package:uet_tests/screens/results/results.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';

class LoggedInBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
            text: "My Account",
            icon: "assets/icons/User Icon.svg",
            press: () => {},
          ),
          ProfileMenu(
            text: "My Orders",
            icon: "assets/icons/Cart Icon.svg",
            press: () {
              Navigator.pushReplacementNamed(context, CartScreen.routeName);
            },
          ),
          ProfileMenu(
            text: "Results",
            icon: "assets/icons/Bell.svg",
            press: () {
              Navigator.pushReplacementNamed(context, ResultsScreen.routeName);
            },
          ),
          /**
          ProfileMenu(
            text: "Settings",
            icon: "assets/icons/Settings.svg",
            press: () {},
          ),
          */
          ProfileMenu(
            text: "Help Center",
            icon: "assets/icons/Question mark.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            press: () async {
              final GoogleSignIn _googleSignIn = GoogleSignIn();
              if (await _googleSignIn.isSignedIn()) {
                await _googleSignIn.signOut();
              }
              await auth.signOut();
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
