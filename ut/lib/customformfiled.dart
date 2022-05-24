import 'package:flutter/material.dart';
import 'package:uet_tests/constants.dart';

import 'components/custom_surfix_icon.dart';

class CustomTextFormField extends StatefulWidget {
  // final String initialValue;
  final String labelText;
  final String hintText;
  // final IconData prefixIcon;
  final String IconAdress;
  // List<String?> errors = [];
  final TextEditingController controller;

  // final Function onTap;
  // final Function empty;
  final String? Function(String?)? validator;
  // final void Function(String?)? check;
  const CustomTextFormField(
      @required this.controller,
      @required this.validator,
      @required this.hintText,
      @required this.labelText,
      @required this.IconAdress,
      {Key? key})
      : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: widget.hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 2.0),
        ),
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: widget.IconAdress),
      ),
    );
  }
}
