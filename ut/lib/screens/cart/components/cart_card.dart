import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:uet_tests/database/Cart.dart';
import 'package:uet_tests/database/models.dart';
import 'package:uet_tests/screens/details/components/test_description.dart';
import 'package:uet_tests/screens/profile/components/profile_menu.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    Key? key,
    required this.totalorder,
  }) : super(key: key);

  final List<Object> totalorder;

  @override
  Widget build(BuildContext context) {
    Test test = totalorder[1] as Test;
    Order order = totalorder[0] as Order;
    return Row(
      children: [
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(10)),
              decoration: BoxDecoration(
                color: Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.memory(
                (base64Decode(
                  test.Image,
                )),
              ),
              //      child: Image.asset('assets/images/lpl1.jpg'),
              /** 
              child: Image.memory(
                (base64Decode(
                  json.decode(order.Image),
              )),
              ),
              */
            ),
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                test.testName,
                style: TextStyle(color: Colors.black, fontSize: 16),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Rs.${order.Total_Bill}",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                  Text(
                    order.Status,
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: kPrimaryLightColor),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Text('Expected Delivery: ' + '${test.Estimates_Testing_Time}'),
            ],
          ),
        ),
      ],
    );
  }
}
