import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uet_tests/database/apis.dart';
import 'package:uet_tests/screens/gallery/components/gallery_test_card.dart';
import 'package:uet_tests/components/shimmer.dart';
import 'package:uet_tests/database/Product.dart';
import 'package:uet_tests/database/models.dart';
import 'package:uet_tests/screens/gallery/gallery_screen.dart';
import 'package:uet_tests/screens/home/components/home_test_card.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class PreviousTests extends StatefulWidget {
  const PreviousTests({Key? key}) : super(key: key);
  @override
  _PreviousTestsState createState() => _PreviousTestsState();
}

class _PreviousTestsState extends State<PreviousTests> {
  late Future<List<Test>> previousTestData = previousTests();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: previousTestData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          List<Test> previousTestsData = snapshot.data as List<Test>;
          if (previousTestsData.length == 0) {
            return Container();
          } else {
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20)),
                  child: SectionTitle(
                    title: "Previous Tests",
                    press: () {
                      Navigator.pushReplacementNamed(
                          context, GalleryScreen.routeName,
                          arguments: TestFetchArguments(DepartmentID: -2));
                    },
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenWidth(20),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(
                        previousTestsData.length,
                        (index) {
                          return HomeTestCard(test: previousTestsData[index]);
                        },
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(20),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
        }
        return TestsRowShimmer();
      },
    );
  }
}
