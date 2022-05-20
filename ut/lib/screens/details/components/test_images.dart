import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:uet_tests/database/product.dart';
import 'package:uet_tests/database/models.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class TestImages extends StatefulWidget {
  const TestImages({
    Key? key,
    required this.test,
  }) : super(key: key);

  final Test test;

  @override
  _TestImagesState createState() => _TestImagesState();
}

class _TestImagesState extends State<TestImages> {
  int selectedImage = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(238),
          child: AspectRatio(
            aspectRatio: 1,
            child: Hero(
              tag: widget.test.testID.toString(),
              child: Image.memory(
                (base64Decode(
                  widget.test.Image,
                )),
              ),
            ),
          ),
        ),
        // SizedBox(height: getProportionateScreenWidth(20)),

        /**
        
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(widget.test.images.length,
                (index) => buildSmallTestPreview(index)),
          ],
        ),

       */
      ],
    );
  }

  GestureDetector buildSmallTestPreview(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImage = index;
        });
      },
      child: AnimatedContainer(
        duration: defaultDuration,
        margin: EdgeInsets.only(right: 15),
        padding: EdgeInsets.all(8),
        height: getProportionateScreenWidth(48),
        width: getProportionateScreenWidth(48),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: kPrimaryColor.withOpacity(selectedImage == index ? 1 : 0)),
        ),
        //    child: Image.asset(widget.test.images[index]),
      ),
    );
  }
}
