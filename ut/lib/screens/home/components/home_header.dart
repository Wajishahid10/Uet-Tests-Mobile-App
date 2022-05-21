import 'package:flutter/material.dart';
import 'package:uet_tests/components/shimmer.dart';
import 'package:uet_tests/constants.dart';
import 'package:uet_tests/database/apis.dart';
import 'package:uet_tests/screens/cart/cart_screen.dart';

import 'package:uet_tests/screens/profile/profile_screen.dart';

import '../../../size_config.dart';
import 'icon_btn_with_counter.dart';
import 'search_field.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<List<Object>> suggestions = searchBarSuggesstions();
    return FutureBuilder(
      future: suggestions,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          List<Object> fetchedDataData = snapshot.data as List<Object>;

          Map<String, String> suggestionsMap =
              fetchedDataData[0] as Map<String, String>;

          List<String> list_of_testNames_searchbar =
              fetchedDataData[1] as List<String>;

          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SearchField(
                      suggestionsMap: suggestionsMap,
                      list_of_testNames_searchbar: list_of_testNames_searchbar,
                    ),
                    /*
              IconBtnWithCounter(
                press: () => Navigator.pushNamed(context, CartScreen.routeName),
                icon: Icon(
                  Icons.shopping_cart,
                  color: kPrimaryColor.withOpacity(0.75),
                  size: getProportionateScreenWidth(32),
                ),
              ),
              */
                    IconButton(
                      iconSize: getProportionateScreenWidth(32),
                      onPressed: () =>
                          Navigator.pushNamed(context, ProfileScreen.routeName),
                      icon: Icon(
                        Icons.person,
                        color: kPrimaryColor.withOpacity(0.75),
                        size: getProportionateScreenWidth(32),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }
        return SearchBarRowShimmer();
      },
    );
  }
}
