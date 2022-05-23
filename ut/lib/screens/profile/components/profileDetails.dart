import 'package:flutter/material.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uet_tests/database/models.dart';
import 'package:uet_tests/main.dart';
import 'package:uet_tests/screens/cart/cart_screen.dart';
import 'package:uet_tests/screens/profile/components/profile_pic.dart';
import 'package:uet_tests/screens/results/results.dart';
import 'profile_menu.dart';

class ProfileDetailsBody extends StatefulWidget {
  static String routeName = "/profileDetails";
  @override
  _ProfileDetailsBodyState createState() => _ProfileDetailsBodyState();
}

class UserDetailsArguments {
  final Users user;

  UserDetailsArguments({required this.user});
}

class _ProfileDetailsBodyState extends State<ProfileDetailsBody> {
  @override
  Widget build(BuildContext context) {
    final UserDetailsArguments agrs =
        ModalRoute.of(context)!.settings.arguments as UserDetailsArguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ProfilePic(image: agrs.user.Display_Picture),
            SizedBox(height: 20),
            ProfileDetailsTile(
              title: 'Name',
              value: agrs.user.userName,
            ),
            SizedBox(height: 20),
            ProfileDetailsTile(
              title: 'Company',
              value: agrs.user.Company,
            ),
            SizedBox(height: 20),
            ProfileDetailsTile(
              title: 'Phone Number',
              value: agrs.user.Contact_Number,
            ),
            SizedBox(height: 20),
            ProfileDetailsTile(
              title: 'E-Mail',
              value: agrs.user.Email_Address,
            ),
            SizedBox(height: 20),
            ProfileDetailsTile(
              title: 'Address',
              value: agrs.user.Address,
            ),
          ],
        ),
      ),
    );
  }
}
