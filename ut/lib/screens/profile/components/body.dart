import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uet_tests/constants.dart';
import 'package:uet_tests/screens/admin/admin_dasboard.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: kPrimaryColor.withOpacity(0.5),
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            ProfilePic(),
            SizedBox(height: 20),
            ProfileMenu(
                text: "My Account",
                icon: "assets/icons/User Icon.svg",
                press: () => {
                      Get.toNamed(dashboard.routeName),
                    }
                //  {
                //   Get.toNamed(dashboard.routeName),
                // },
                ),
            // ProfileMenu(
            //   text: "Notifications",
            //   icon: "assets/icons/Bell.svg",
            //   press: () {},
            // ),
            // ProfileMenu(
            //   text: "Settings",
            //   icon: "assets/icons/Settings.svg",
            //   press: () {},
            // ),
            // ProfileMenu(
            //   text: "Help Center",
            //   icon: "assets/icons/Question mark.svg",
            //   press: () {},
            // ),
            // ProfileMenu(
            //   text: "Log Out",
            //   icon: "assets/icons/Log out.svg",
            //   press: () {},
            // ),
          ],
        ),
      ),
    );
  }
}
