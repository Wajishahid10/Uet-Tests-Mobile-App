import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:uet_tests/database/apis.dart';
import 'package:uet_tests/database/models.dart';
import 'package:uet_tests/main.dart';
import 'package:uet_tests/screens/cart/cart_screen.dart';
import 'package:uet_tests/screens/profile/components/profileDetails.dart';
import 'package:uet_tests/screens/results/results.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';

class LoggedInBody extends StatelessWidget {
  final Future<Users> fetchUser = getUser();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchUser,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          Users fetchedUserData = snapshot.data as Users;

          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                ProfilePic(
                  image: fetchedUserData.Display_Picture,
                ),
                SizedBox(height: 20),
                ProfileMenu(
                  text: "My Account",
                  icon: "assets/icons/User Icon.svg",
                  press: () {
                    Navigator.pushReplacementNamed(
                        context, ProfileDetailsBody.routeName,
                        arguments: UserDetailsArguments(user: fetchedUserData));
                  },
                ),
                ProfileMenu(
                  text: "My Orders",
                  icon: "assets/icons/Cart Icon.svg",
                  press: () {
                    Navigator.pushReplacementNamed(
                        context, CartScreen.routeName);
                  },
                ),
                ProfileMenu(
                  text: "Results",
                  icon: "assets/icons/Bell.svg",
                  press: () {
                    Navigator.pushReplacementNamed(
                        context, ResultsScreen.routeName);
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
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Center(
                          child: Column(
                            children: [
                              Text(
                                  'For Any Quries and Help. Contact System Admin.'),
                              ProfileDetailsTile(
                                title: 'M. Wajahat Shahid',
                                value: '0332-7487274',
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
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
                    sharedPreferences.remove('user_ID');

                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
