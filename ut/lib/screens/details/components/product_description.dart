import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uet_tests/database/Product.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ProductDescription extends StatefulWidget {
  const ProductDescription({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  _ProductDescriptionState createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Text(
            widget.product.title,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: getProportionateScreenWidth(20),
            right: getProportionateScreenWidth(64),
          ),
          child: buildText(
            widget.product.description,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: 10,
          ),
          child: GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      // toggle the bool variable true or false
                      isReadmore = !isReadmore;
                    });
                  },
                  child: Text(
                    isReadmore ? 'See Less Detail' : 'See More Detail',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color:
                            !isReadmore ? kPrimaryColor : kPrimaryLightColor),
                  ),
                ),
                SizedBox(width: 5),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: kPrimaryColor,
                ),
              ],
            ),
          ),
        ),
        Divider(
          height: getProportionateScreenHeight(8),
          color: Colors.transparent,
        ),
      ],
    );
  }
}

bool isReadmore = false;

Widget buildText(String text) {
  // if read more is false then show only 3 lines from text
  // else show full text
  final lines = isReadmore ? null : 3;
  return Text(
    text, style: TextStyle(color: kTextColor),
    maxLines: lines,
    // overflow properties is used to show 3 dot in text widget
    // so that user can understand there are few more line to read.
    overflow: isReadmore ? TextOverflow.visible : TextOverflow.ellipsis,
  );
}
