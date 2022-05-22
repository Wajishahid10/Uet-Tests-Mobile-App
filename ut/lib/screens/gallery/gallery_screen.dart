import 'package:flutter/material.dart';

import '../../database/Product.dart';
import '../../../size_config.dart';
import 'components/body.dart';

class GalleryScreen extends StatelessWidget {
  static String routeName = "/gallery";

  @override
  Widget build(BuildContext context) {
    final TestFetchArguments agrs =
        ModalRoute.of(context)!.settings.arguments as TestFetchArguments;

    return Scaffold(
      /**
      PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: CustomAppBar(),
      ),
      */
      body: Body(
        DepartmentID: agrs.DepartmentID,
      ),
    );
  }
}

class TestFetchArguments {
  final int DepartmentID;

  TestFetchArguments({required this.DepartmentID});
}
