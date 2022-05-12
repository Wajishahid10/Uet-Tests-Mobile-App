import 'package:flutter/material.dart';
import 'package:uet_tests/components/google_SignIn.dart';
import 'package:uet_tests/screens/gallery/gallery_screen.dart';
import 'package:uet_tests/screens/home/home_screen.dart';
import 'package:uet_tests/screens/profile/profile_screen.dart';
import 'package:uet_tests/screens/splash/splash_screen.dart';

import 'package:uet_tests/routes.dart';
import 'package:uet_tests/size_config.dart';
import 'package:uet_tests/theme.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

late SharedPreferences sharedPreferences;

late FirebaseApp firebaseApp;
FirebaseAuth auth = FirebaseAuth.instanceFor(app: firebaseApp);

Future<void> init() async {
  sharedPreferences = await SharedPreferences.getInstance();
}

Future<void> isFirstTimeExecution() async {
  if (!sharedPreferences.containsKey("isFirstTime")) {
    _isFirstTime = await sharedPreferences.setBool("isFirstTime", true);
    await sharedPreferences.setBool("isCustomer", true);
  }
  if (sharedPreferences.containsKey("isCustomer")) {
    _isUserCustomer = (await sharedPreferences.getBool("isCustomer"))!;
  }
}

bool _isFirstTime = false;
bool _isUserCustomer = true;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  firebaseApp = await Firebase.initializeApp();
  init().whenComplete(
    () {
      isFirstTimeExecution().whenComplete(
        () {
          runApp(
            MyApp(),
          );
        },
      );
    },
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UET Tests',
      theme: theme(),
      initialRoute: _isFirstTime
          ? SplashScreen.routeName
          : _isUserCustomer
              ? GalleryScreen.routeName
              : HomeScreen.routeName,
      routes: routes,
    );
  }
}
