import 'dart:js';

import 'package:flutter/widgets.dart';
import 'package:uet_tests/screens/admin/add_test.dart';
import 'package:uet_tests/screens/admin/admin_dasboard.dart';
import 'package:uet_tests/screens/admin/new_order.dart';
import 'package:uet_tests/screens/cart/cart_screen.dart';
import 'package:uet_tests/screens/complete_profile/complete_profile_screen.dart';
import 'package:uet_tests/screens/details/details_screen.dart';
import 'package:uet_tests/screens/forgot_password/forgot_password_screen.dart';
import 'package:uet_tests/screens/home/home_screen.dart';
import 'package:uet_tests/screens/login_success/login_success_screen.dart';
import 'package:uet_tests/screens/otp/otp_screen.dart';
import 'package:uet_tests/screens/profile/profile_screen.dart';
import 'package:uet_tests/screens/sign_in/sign_in_screen.dart';
import 'package:uet_tests/screens/splash/splash_screen.dart';

import 'screens/sign_up/sign_up_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  dashboard.routeName: (context) => dashboard(),
  add_test.routeName: (context) => add_test(),
  new_order.routeName: (context) => new_order(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
};
