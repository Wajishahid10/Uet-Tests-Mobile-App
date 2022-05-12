import 'package:flutter/material.dart';

import '../../database/Product.dart';
import 'components/body.dart';

class GalleryScreen extends StatelessWidget {
  static String routeName = "/gallery";

  @override
  Widget build(BuildContext context) {
    // final ProductDetailsArguments agrs =ModalRoute.of(context)!.settings.arguments as ProductDetailsArguments;
    return Scaffold(
      /**
      PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: CustomAppBar(),
      ),
      */
      body: Body(),
    );
  }
}

class ProductDetailsArguments {
  final Product product;

  ProductDetailsArguments({required this.product});
}
