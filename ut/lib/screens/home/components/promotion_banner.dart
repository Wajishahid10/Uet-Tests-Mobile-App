import 'package:flutter/material.dart';

import '../../../size_config.dart';
import '../../../constants.dart';

class PromotionBanner extends StatelessWidget {
  const PromotionBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 90,
      width: double.infinity,
      margin: EdgeInsets.all(getProportionateScreenWidth(20)),
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
        vertical: getProportionateScreenWidth(15),
      ),
      decoration: BoxDecoration(
        color: kPrimaryLightColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(13),
            child: Image.asset(
              'assets/transparent logo.png',
              height: getProportionateScreenWidth(75),
              width: getProportionateScreenWidth(75),
            ),
          ),
          Text.rich(
            TextSpan(
              style: TextStyle(color: Colors.white),
              children: [
                TextSpan(
                  text: "Manage All Tests Online\n",
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(15),
                  ),
                ),
                TextSpan(
                  text: "Digitalizing Testing",
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(24),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
