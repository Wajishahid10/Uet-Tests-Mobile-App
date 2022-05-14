import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:uet_tests/database/Cart.dart';
import 'package:uet_tests/database/models.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    Key? key,
    required this.order,
  }) : super(key: key);

  final Test order;

  @override
  Widget build(BuildContext context) {
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
                  order.Image,
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
                order.testName,
                style: TextStyle(color: Colors.black, fontSize: 16),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$${order.Price}",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: kPrimaryColor),
                  ),
                  Text(
                    "Pending",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: kPrimaryLightColor),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Text('Expected Delivery: ' + '${order.Estimates_Testing_Time}'),
            ],
          ),
        ),
      ],
    );
  }
}
