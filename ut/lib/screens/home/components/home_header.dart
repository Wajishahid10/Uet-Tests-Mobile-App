import 'package:flutter/material.dart';
import 'package:shop_app/screens/cart/cart_screen.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/screens/profile/profile_screen.dart';

import '../../../constants.dart';
import '../../../enums.dart';
import '../../../size_config.dart';
import 'icon_btn_with_counter.dart';
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
          IconBtnWithCounter(
            svgSrc: "assets/icons/Cart Icon.svg",
            press: () => Navigator.pushNamed(context, CartScreen.routeName),
          ),
          IconButton(
            icon: SvgPicture.asset("assets/icons/User Icon.svg",
                color: kPrimaryColor),
            onPressed: () =>
                Navigator.pushNamed(context, ProfileScreen.routeName),
          ),
        ],
      ),
    );
  }
}
