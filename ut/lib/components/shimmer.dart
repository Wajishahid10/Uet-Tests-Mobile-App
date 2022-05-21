import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../size_config.dart';

class SearchBarRowShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenHeight(59),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: SizedBox(
            width: getProportionateScreenWidth(258),
          ),
        ),
      ),
    );
  }
}

class CategoriesRowShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenHeight(145),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Card(
                margin: EdgeInsets.only(
                    left: getProportionateScreenWidth(28),
                    bottom: getProportionateScreenWidth(18)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: SizedBox(
                  width: getProportionateScreenWidth(118),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: ListView.builder(
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 3.0,
                    margin: EdgeInsets.only(
                        left: getProportionateScreenWidth(19),
                        right: getProportionateScreenWidth(17)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: SizedBox(
                      width: getProportionateScreenWidth(242),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TestsRowShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenHeight(175),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Card(
                margin: EdgeInsets.only(
                    left: getProportionateScreenWidth(28),
                    bottom: getProportionateScreenWidth(10)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: SizedBox(
                  width: getProportionateScreenWidth(148),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: ListView.builder(
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 3.0,
                    margin: EdgeInsets.only(
                        left: getProportionateScreenWidth(19),
                        right: getProportionateScreenWidth(8)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: SizedBox(
                      width: getProportionateScreenWidth(155),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RowShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: ListView.builder(
          itemCount: 3,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Card(
              elevation: 2.0,
              margin: EdgeInsets.all(getProportionateScreenWidth(8)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: SizedBox(
                width: getProportionateScreenWidth(260),
              ),
            );
          },
        ),
      ),
    );
  }
}

class GridShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.0,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:
                  (MediaQuery.of(context).orientation == Orientation.portrait)
                      ? 2
                      : 3),
          itemCount: 6,
          itemBuilder: (context, index) {
            return Card(
              elevation: 1.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: SizedBox(height: getProportionateScreenHeight(80)),
            );
          },
        ),
      ),
    );
  }
}
