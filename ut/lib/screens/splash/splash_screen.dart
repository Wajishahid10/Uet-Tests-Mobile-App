import 'package:flutter/material.dart';
import 'package:uet_tests/screens/splash/components/body.dart';
import 'package:uet_tests/size_config.dart';
import 'package:uet_tests/components/background.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return Scaffold(
      body: Background(
        child: Body(),
      ),
    );
  }
}
