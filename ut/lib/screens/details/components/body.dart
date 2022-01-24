import 'package:flutter/material.dart';
import 'package:uet_tests/components/default_button.dart';
import 'package:uet_tests/constants.dart';
import 'package:uet_tests/models/Product.dart';
import 'package:uet_tests/size_config.dart';

//  import 'color_dots.dart';
import 'product_description.dart';
import 'rounded_container.dart';
import 'product_images.dart';

class Body extends StatelessWidget {
  final Product product;

  const Body({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ProductImages(product: product),
        RoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              ProductDescription(
                product: product,
                pressOnSeeMore: () {},
              ),
              // TopRoundedContainer(
              Container(
                color: Color(0xFFF6F7F9),
                child: Column(
                  children: [
                    //  ColorDots(product: product),
                    Divider(
                      color: Colors.transparent,
                    ),
                    RoundedContainer(
                      color: kSecondaryLightColor.withOpacity(0.3),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.15,
                          right: SizeConfig.screenWidth * 0.15,
                          bottom: getProportionateScreenWidth(40),
                          top: getProportionateScreenWidth(15),
                        ),
                        child: DefaultButton(
                          text: "Add To Cart",
                          press: () {},
                        ),
                      ),
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
