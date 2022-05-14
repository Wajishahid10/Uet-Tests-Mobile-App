import 'package:flutter/material.dart';
import 'package:uet_tests/components/default_button.dart';
import 'package:uet_tests/constants.dart';
import 'package:uet_tests/database/Product.dart';
import 'package:uet_tests/size_config.dart';

import 'package:expandable/expandable.dart';

import 'order_form.dart';
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
              ),
              SizedBox(height: getProportionateScreenWidth(10)),
              ExpandableNotifier(
                // <-- Provides ExpandableController to its children
                child: Column(
                  children: [
                    Expandable(
                      // <-- Driven by ExpandableController from ExpandableNotifier
                      collapsed: ExpandableButton(
                        // <-- Expands when tapped on the cover photo
                        child: DefaultButton(
                          text: "Book Test",
                        ),
                      ),
                      expanded: Column(children: [
                        OrderForm(
                          test: product,
                        ),
                      ]),
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
