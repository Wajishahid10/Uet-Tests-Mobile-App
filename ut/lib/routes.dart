import 'package:flutter/widgets.dart';
import 'package:uet_tests/screens/cart/cart_screen.dart';
import 'package:uet_tests/screens/department_gallery/department_gallery.dart';
import 'package:uet_tests/screens/gallery/gallery_screen.dart';
import 'package:uet_tests/screens/complete_profile/complete_profile_screen.dart';
import 'package:uet_tests/screens/details/details_screen.dart';
import 'package:uet_tests/screens/forgot_password/forgot_password_screen.dart';
import 'package:uet_tests/screens/home/home_screen.dart';
import 'package:uet_tests/screens/login_success/login_success_screen.dart';
import 'package:uet_tests/screens/emailVerification/emailVerification_screen.dart';
import 'package:uet_tests/screens/profile/components/profileDetails.dart';
import 'package:uet_tests/screens/profile/profile_screen.dart';
import 'package:uet_tests/screens/results/results.dart';
import 'package:uet_tests/screens/sign_in/sign_in_screen.dart';
import 'package:uet_tests/screens/splash/splash_screen.dart';

import 'screens/sign_up/sign_up_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => new LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  emailVerificationScreen.routeName: (context) => emailVerificationScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  GalleryScreen.routeName: (context) => GalleryScreen(),
  DepartmentGalleryScreen.routeName: (context) => DepartmentGalleryScreen(),
  ResultsScreen.routeName: (context) => ResultsScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  ProfileDetailsBody.routeName: (context) => ProfileDetailsBody(),
};
