import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    required this.icon,
    this.press,
  }) : super(key: key);

  final String text, icon;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: kPrimaryColor,
          padding: EdgeInsets.all(20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: Color(0xFFF5F6F9),
        ),
        onPressed: press,
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              color: kPrimaryColor,
              width: 22,
            ),
            SizedBox(width: 20),
            Expanded(
              child: Text(
                text,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
            ),
          ],
        ),
      ),
    );
  }
}

class NoProfileMenu extends StatelessWidget {
  const NoProfileMenu({
    Key? key,
    required this.text,
    required this.icon,
    this.press,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: kPrimaryColor,
          padding: EdgeInsets.all(20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: Color(0xFFF5F6F9),
        ),
        onPressed: press,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: kPrimaryColor,
              size: 22,
            ),
            SizedBox(width: 20),
            Expanded(
              child: Text(
                text,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileDetailsTile extends StatelessWidget {
  const ProfileDetailsTile({
    Key? key,
    required this.value,
    required this.title,
  }) : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Card(
        color: Color(0xFFF5F6F9),
        shadowColor: kPrimaryColor,
        elevation: 20,
        clipBehavior: Clip.hardEdge,
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 20),
            ),
            Divider(),
            SizedBox(width: 12),
            Text(
              value,
              style: TextStyle(fontSize: 18, color: kPrimaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
