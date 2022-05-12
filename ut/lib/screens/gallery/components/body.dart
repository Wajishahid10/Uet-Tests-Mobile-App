import 'package:flutter/material.dart';
import 'package:uet_tests/constants.dart';
import 'package:uet_tests/screens/home/components/home_header.dart';
import 'package:uet_tests/size_config.dart';

import 'package:uet_tests/components/gallery_test_card.dart';
import 'package:uet_tests/database/Product.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /*
    final List<Map> myProducts = List.generate(
        100000, (index) => {"id": index, "name": "Product $index"}).toList();
  */

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            HomeHeader(),
            SizedBox(height: getProportionateScreenHeight(20)),
            SafeArea(
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 20,
                ),
                itemCount: demoProducts.length,
                itemBuilder: (BuildContext ctx, index) {
                  return GalleryTestCard(product: demoProducts[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
