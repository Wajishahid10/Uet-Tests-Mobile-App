import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uet_tests/components/default_button.dart';
import 'package:uet_tests/constants.dart';
import 'package:uet_tests/database/Product.dart';
import 'package:uet_tests/database/models.dart';
import 'package:uet_tests/main.dart';
import 'package:uet_tests/screens/profile/components/profile_menu.dart';
import 'package:uet_tests/screens/sign_in/sign_in_screen.dart';
import 'package:uet_tests/screens/sign_up/sign_up_screen.dart';
import 'package:uet_tests/size_config.dart';

import 'package:expandable/expandable.dart';

import 'order_form.dart';
import 'test_description.dart';
import 'rounded_container.dart';
import 'test_images.dart';

class Body extends StatelessWidget {
  final Test test;
  Body({Key? key, required this.test}) : super(key: key);
//  late Future<List<Test>> demoTests = loadTest();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TestImages(test: test),
        RoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              TestDescription(
                test: test,
              ),
              SizedBox(height: getProportionateScreenWidth(10)),
              ExpandableNotifier(
                // <-- Provides ExpandableController to its children
                child: Column(
                  children: [
                    Expandable(
                      // <-- Driven by ExpandableController from ExpandableNotifier
                      collapsed: ExpandableButton(
                        // <-- Expands when tapped on the cover photo
                        child: DefaultButton(
                          text: "Book Test",
                        ),
                      ),
                      expanded: Column(
                        children: [
                          OrderForm(
                            test: test,

                            //   test: product,
                          ),
                        ],
                      ),
                      /**
                      expanded: sharedPreferences.containsKey('user_ID')
                          ? Column(
                              children: [
                                OrderForm(
                                  test: test,

                                  //   test: product,
                                ),
                              ],
                            )
                          : Center(
                              child: Column(
                                children: [
                                  Text(
                                      'You have to LogIn first to Book a Test.'),
                                  NoProfileMenu(
                                    text: "Login/SignIn",
                                    icon: Icons.login,
                                    press: () {
                                      Navigator.pushReplacementNamed(
                                          context, SignInScreen.routeName);
                                    },
                                  ),
                                  NoProfileMenu(
                                    text: "Create Account",
                                    icon: Icons.manage_accounts,
                                    press: () {
                                      Navigator.pushReplacementNamed(
                                          context, SignUpScreen.routeName);
                                    },
                                  ),
                                ],
                              ),
                            ),
                             */
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}


/**
class Body extends StatefulWidget {
  final Test test;
  const Body({Key? key, required this.test}) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}
Future<List<Test>> loadTest() async {
  List<Test> demoTests;
  ByteData image1 = await rootBundle.load('assets/images/sv1.jpg');
  String convertedImage1 = base64Encode(
      image1.buffer.asUint8List(image1.offsetInBytes, image1.lengthInBytes));
  ByteData image2 = await rootBundle.load('assets/images/lpl1.jpg');
  String convertedImage2 = base64Encode(
      image2.buffer.asUint8List(image2.offsetInBytes, image2.lengthInBytes));
  ByteData image3 = await rootBundle.load('assets/images/mc1.jpg');
  String convertedImage3 = base64Encode(
      image3.buffer.asUint8List(image3.offsetInBytes, image3.lengthInBytes));
  ByteData image4 = await rootBundle.load('assets/images/glap.png');
  String convertedImage4 = base64Encode(
      image4.buffer.asUint8List(image4.offsetInBytes, image4.lengthInBytes));
  demoTests = [
    Test(
      testID: 1,
      departmentID: 1,
      Test_Counts: 34,
      TestCreated: '30-01-2023',
      Image: convertedImage1,
      testName: "Sieve Analysis",
      Price: 764,
      Description:
          "A sieve analysis is an analytical technique used to determine the particle size distribution of a granular material with macroscopic granular sizes. The sieve analysis technique involves several layers of sieves with different grades of sieve opening sizes.",
      Estimates_Testing_Time: '48 hours',
      Test_Sample_Attributes: {
        'Attribute1': 'Diameter',
        'Attribute2': 'Width',
        'Attribute3': 'Weight',
      },
    ),
    Test(
      testID: 2,
      departmentID: 1,
      Test_Counts: 34,
      TestCreated: '30-01-2023',
      Image: convertedImage2,
      testName: "Liquid Limit and Plastic Limit Test",
      Price: 650,
      Description:
          "Liquid Limit (LL) is the water content at which soil changes from a plastic to a liquid state when the soil specimen is just fluid enough for a groove to close when jarred in a specified manner. Plastic Limit (PL) is the water content at the change from a plastic to a semi-solid state.",
      Estimates_Testing_Time: '48 hours',
      Test_Sample_Attributes: {
        'Attribute1': 'Diameter',
        'Attribute2': 'Width',
        'Attribute3': 'Weight',
      },
    ),
    Test(
      testID: 3,
      departmentID: 1,
      Test_Counts: 34,
      TestCreated: '30-01-2023',
      Image: convertedImage3,
      testName: "Moisture Content (Oven Dry Method)",
      Price: 684,
      Description:
          "Moisture content is expressed as a percentage of the oven-dry weight of the soil. For example, if a 212-gram moist soil sample weighs 197 grams after drying, the percentage of moisture is calculated by dividing 197 into 15, which gives 7.6 percent.",
      Estimates_Testing_Time: '76 hours',
      Test_Sample_Attributes: {
        'Attribute1': 'Diameter',
        'Attribute2': 'Width',
        'Attribute3': 'Weight',
      },
    ),
    Test(
      testID: 4,
      departmentID: 1,
      Test_Counts: 34,
      TestCreated: '30-01-2023',
      Image: convertedImage4,
      testName: "Sieve",
      Price: 960,
      Description:
          "Moisture content is expressed as a percentage of the oven-dry weight of the soil. For example, if a 212-gram moist soil sample weighs 197 grams after drying, the percentage of moisture is calculated by dividing 197 into 15, which gives 7.6 percent.",
      Estimates_Testing_Time: '36 hours',
      Test_Sample_Attributes: {
        'Attribute1': 'Diameter',
        'Attribute2': 'Width',
        'Attribute3': 'Weight',
      },
    ),
  ];
  return demoTests;
}
*/

