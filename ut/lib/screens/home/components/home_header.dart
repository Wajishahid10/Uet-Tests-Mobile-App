import 'package:flutter/material.dart';
import 'package:uet_tests/screens/cart/cart_screen.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:uet_tests/screens/profile/profile_screen.dart';

import '../../../constants.dart';
import '../../../enums.dart';
import '../../../size_config.dart';
import 'search_field.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchField(),
          IconButton(
            iconSize: getProportionateScreenWidth(16),
            onPressed: () => Navigator.pushNamed(context, CartScreen.routeName),
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.grey,
            ),
          ),
          IconButton(
            iconSize: getProportionateScreenWidth(16),
            onPressed: () =>
                Navigator.pushNamed(context, ProfileScreen.routeName),
            icon: Icon(
              Icons.person,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
