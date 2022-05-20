import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:uet_tests/database/Cart.dart';
import 'package:uet_tests/database/models.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ResultCard extends StatelessWidget {
  const ResultCard({
    Key? key,
    required this.totalResult,
  }) : super(key: key);

  final List<Object> totalResult;

  @override
  Widget build(BuildContext context) {
    Test test = totalResult[0] as Test;
    Result result = totalResult[1] as Result;
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
                  json.decode(Result.Image),
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
                    "\$${test.Price}",
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
              Text('Expected Delivery: ' + '${test.Estimates_Testing_Time}'),
            ],
          ),
        ),
      ],
    );
  }
}
