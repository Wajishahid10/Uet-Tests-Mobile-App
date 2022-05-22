import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:uet_tests/database/models.dart';

import '../../../size_config.dart';

/**
class GalleryCategories extends StatelessWidget {
  const GalleryCategories({
    Key? key,
    required this.department,
  }) : super(key: key);

  final Department department;

  @override
  Widget build(BuildContext context) {
    return CategoryGalleryCard(
      department: department,
      press: () {},
    );
  }
}

 */

class CategoryGalleryCard extends StatelessWidget {
  const CategoryGalleryCard({
    Key? key,
    required this.department,
    required this.press,
  }) : super(key: key);

  final Department department;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(10)),
      child: GestureDetector(
        onTap: press,
        child: Container(
          width: getProportionateScreenWidth(202),
          height: getProportionateScreenHeight(50),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Image.memory(
                  (base64Decode(
                    department.Display_Picture,
                  )),
                  //fit: BoxFit.cover,
                  fit: BoxFit.fill,
                  width: getProportionateScreenWidth(242),
                  height: getProportionateScreenWidth(170),
                ),
                //      child: Image.asset('assets/images/lpl1.jpg'),
                /** 
              child: Image.memory(
                (base64Decode(
                  json.decode(order.Image),
              )),
              ),
              */
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF343434).withOpacity(0.4),
                        Color(0xFF343434).withOpacity(0.35),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(15.0),
                    vertical: getProportionateScreenHeight(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${department.departmentName}\n",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: getProportionateScreenWidth(18),
                          fontWeight: FontWeight.bold,
                          shadows: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "Contact us: ${department.Contact_Number_toDisplay}",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
