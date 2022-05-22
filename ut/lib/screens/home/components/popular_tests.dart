import 'package:flutter/material.dart';
import 'package:uet_tests/screens/home/components/home_test_card.dart';
import 'package:uet_tests/components/shimmer.dart';
import 'package:uet_tests/database/Product.dart';
import 'package:uet_tests/database/apis.dart';
import 'package:uet_tests/database/models.dart';
import 'package:uet_tests/screens/gallery/gallery_screen.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class PopularTests extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    late Future<List<Test>> popularTests = homePopularTests();
    return FutureBuilder(
      future: popularTests,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          List<Test> popularTestsData = snapshot.data as List<Test>;

          return Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: SectionTitle(
                  title: "Popular Tests",
                  press: () {
                    Navigator.pushReplacementNamed(
                        context, GalleryScreen.routeName,
                        arguments: TestFetchArguments(DepartmentID: -1));
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
                      popularTestsData.length,
                      (index) {
                        return HomeTestCard(test: popularTestsData[index]);
                      },
                    ),
                    SizedBox(width: getProportionateScreenWidth(20)),
                  ],
                ),
              )
            ],
          );
        }
        return TestsRowShimmer();
      },
    );
  }
}
