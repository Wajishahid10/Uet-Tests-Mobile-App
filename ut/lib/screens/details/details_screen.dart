import 'package:flutter/material.dart';
import 'package:uet_tests/database/models.dart';

import '../../database/Product.dart';
import 'components/body.dart';
import 'components/custom_app_bar.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";

  @override
  Widget build(BuildContext context) {
    final TestDetailsArguments agrs =
        ModalRoute.of(context)!.settings.arguments as TestDetailsArguments;
    return Scaffold(
      appBar: AppBar(),
      /**
      PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: CustomAppBar(),
      ),
       */
      body: Body(test: agrs.test),
    );
  }
}

class TestDetailsArguments {
  final Test test;

  TestDetailsArguments({required this.test});
}
