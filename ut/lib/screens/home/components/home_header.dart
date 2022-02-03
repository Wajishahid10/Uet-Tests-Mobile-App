import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uet_tests/screens/admin/admin_dasboard.dart';
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SearchField(),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: kPrimaryColor.withOpacity(0.5),
                        shape: BoxShape.circle),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: IconButton(
                        iconSize: getProportionateScreenWidth(18),
                        onPressed: () => Get.toNamed(CartScreen.routeName),
                        // onPressed: () => Get.toNamed(dashboard.routeName),
                        // Navigator.pushNamed(context, CartScreen.routeName),
                        icon: Icon(
                          Icons.shopping_cart,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  // Spacer(),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: kPrimaryColor.withOpacity(0.8),
                        shape: BoxShape.circle),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: IconButton(
                        iconSize: getProportionateScreenWidth(18),
                        onPressed: () => Get.toNamed(ProfileScreen.routeName),
                        // Navigator.pushNamed(context, ProfileScreen.routeName),
                        icon: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
