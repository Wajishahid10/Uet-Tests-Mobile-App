import 'package:flutter/material.dart';

import '../constants.dart';

class Background extends StatelessWidget {
  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kPrimaryLightColor.withOpacity(0.43),
      ),
      child: child,
    );
  }
}
