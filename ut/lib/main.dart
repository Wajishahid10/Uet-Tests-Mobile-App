import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:uet_tests/routes.dart';
import 'package:uet_tests/screens/home/home_screen.dart';
import 'package:uet_tests/screens/sign_in/sign_in_screen.dart';
import 'package:uet_tests/size_config.dart';
import 'package:uet_tests/screens/profile/profile_screen.dart';
import 'package:uet_tests/screens/splash/splash_screen.dart';
import 'package:uet_tests/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UET Tests',
      theme: theme(),
      // home: SplashScreen(),
      // We use routeName so that we dont need to remember the name
      initialRoute: HomeScreen.routeName,
      // initialRoute: SignInScreen.routeName,
      routes: routes,
    );
  }
}
