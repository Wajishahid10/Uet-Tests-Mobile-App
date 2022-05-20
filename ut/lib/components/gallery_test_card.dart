import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:uet_tests/database/Product.dart';
import 'package:uet_tests/database/models.dart';
import 'package:uet_tests/screens/details/details_screen.dart';

import '../constants.dart';
import '../size_config.dart';

class GalleryTestCard extends StatelessWidget {
  const GalleryTestCard({
    Key? key,
    this.width = 150,
    this.aspectRetio = 1.02,
    required this.test,
  }) : super(key: key);

  final double width, aspectRetio;
  final Test test;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: SizedBox(
        width: getProportionateScreenWidth(width),
        child: GestureDetector(
          onTap: () => Navigator.pushNamed(
            context,
            DetailsScreen.routeName,
            arguments: TestDetailsArguments(test: test),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1.25,
                  child: Container(
                    padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                    decoration: BoxDecoration(
                      color: kSecondaryColor.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Hero(
                      tag: test.testID.toString(),
                      child: Image.memory(
                        (base64Decode(
                          test.Image,
                        )),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                test.testName,
                style: TextStyle(color: Colors.black),
                maxLines: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\Rs. ${test.Price}",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(18),
                      fontWeight: FontWeight.w600,
                      color: kPrimaryColor,
                    ),
                  ),
                  /*  Favourite Button
                  InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                      height: getProportionateScreenWidth(28),
                      width: getProportionateScreenWidth(28),
                      decoration: BoxDecoration(
                        color: product.isFavourite
                            ? kPrimaryColor.withOpacity(0.15)
                            : kSecondaryColor.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(
                        "assets/icons/Heart Icon_2.svg",
                        color: product.isFavourite
                            ? Color(0xFFFF4848)
                            : Color(0xFFDBDEE4),
                      ),
                    ),
                  ),
                  */
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
