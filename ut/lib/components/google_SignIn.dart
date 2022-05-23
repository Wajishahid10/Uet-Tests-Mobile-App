import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:uet_tests/database/apis.dart';
import 'package:uet_tests/database/models.dart';

import 'package:uet_tests/screens/login_success/login_success_screen.dart';
import 'package:uet_tests/main.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn();

late UserCredential userCredential;

Future<void> signInGmail(BuildContext context) async {
  GoogleSignInAccount? gmailUser = await _googleSignIn.signIn();
  GoogleSignInAuthentication googleSignInAuthentication =
      await gmailUser!.authentication;

  final AuthCredential authCredential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken);

  userCredential = await auth.signInWithCredential(authCredential).catchError(
    (onError) {
      print('Google Error Received: ' + onError);
    },
  );

  if (userCredential.additionalUserInfo!.isNewUser) {
    Map credMap = {
      "GoogleSiginUID": auth.currentUser!.uid,
      "Account_Type": "1"
    };

    signupwithGoogle(credMap, context);
  } else {
    /**
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Google Login Successfully')));
    */

    Login_Manager login_manager = await getLoginManagerfromUID();

    await sharedPreferences.setInt("user_ID", login_manager.LoginID);

    Navigator.pushReplacementNamed(context, LoginSuccessScreen.routeName);
  }
}
