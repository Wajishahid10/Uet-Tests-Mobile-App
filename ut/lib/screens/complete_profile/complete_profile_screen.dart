import 'package:flutter/material.dart';

import 'components/body.dart';

class CompleteProfileScreen extends StatelessWidget {
  static String routeName = "/complete_profile";
  @override
  Widget build(BuildContext context) {
    final UserIDforGoogleSignInArguments agrs = ModalRoute.of(context)!
        .settings
        .arguments as UserIDforGoogleSignInArguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Body(
        UserID: agrs.UserID,
      ),
    );
  }
}

class UserIDforGoogleSignInArguments {
  final int UserID;

  UserIDforGoogleSignInArguments({required this.UserID});
}
