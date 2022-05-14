import 'package:flutter/material.dart';
import 'package:uet_tests/database/Cart.dart';

import 'components/body.dart';
import 'components/check_out_card.dart';

class ResultsScreen extends StatelessWidget {
  static String routeName = "/results";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      //    bottomNavigationBar: CheckoutCard(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            "Your Results",
            style: TextStyle(color: Colors.black),
          ),
          Text(
            "${demoCarts.length} results",
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}