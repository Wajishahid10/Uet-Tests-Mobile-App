import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:uet_tests/main.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn();

late UserCredential credential;

Future<void> signInGmail(BuildContext context) async {
  GoogleSignInAccount? gmailUser = await _googleSignIn.signIn();
  GoogleSignInAuthentication googleSignInAuthentication =
      await gmailUser!.authentication;
  final AuthCredential authCredential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken);
  credential =
      await auth.signInWithCredential(authCredential).catchError((onError) {
    print('Google Error Received: ' + onError);
  });

  if (await _googleSignIn.isSignedIn()) {
    print('Google new login/signin');
  }

  ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text('Google Login Successfully')));

  sharedPreferences.setString('Email', gmailUser.email);
}
