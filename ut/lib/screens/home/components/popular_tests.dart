import 'package:flutter/material.dart';
import 'package:uet_tests/components/product_card.dart';
import 'package:uet_tests/database/Product.dart';
import 'package:uet_tests/screens/gallery/gallery_screen.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class PopularTests extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(
              title: "Popular Tests",
              press: () {
                Navigator.pushReplacementNamed(
                    context, GalleryScreen.routeName);
              }),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                demoProducts.length,
                (index) {
                  if (demoProducts[index].isPopular)
                    return ProductCard(product: demoProducts[index]);

                  return SizedBox
                      .shrink(); // here by default width and height is 0
                },
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        )
      ],
    );
  }
}
