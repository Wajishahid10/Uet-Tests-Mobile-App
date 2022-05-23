import 'package:flutter/material.dart';
import 'package:uet_tests/components/shimmer.dart';
import 'package:uet_tests/main.dart';

import '../../../size_config.dart';
import 'categories.dart';
import 'promotion_banner.dart';
import 'home_header.dart';
import 'popular_tests.dart';
import 'previous_tests.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            HomeHeader(),
            SizedBox(height: getProportionateScreenWidth(10)),
            PromotionBanner(),
            //  RowShimmer(),
            Categories(),
            sharedPreferences.containsKey('user_ID')
                ? Column(
                    children: [
                      SizedBox(height: getProportionateScreenWidth(30)),
                      PreviousTests(),
                    ],
                  )
                : SizedBox.shrink(),
            SizedBox(height: getProportionateScreenWidth(30)),
            PopularTests(),
            SizedBox(height: getProportionateScreenWidth(30)),
          ],
        ),
      ),
    );
  }
}
