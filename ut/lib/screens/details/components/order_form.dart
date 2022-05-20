import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:uet_tests/components/custom_surfix_icon.dart';
import 'package:uet_tests/components/default_button.dart';
import 'package:uet_tests/components/form_error.dart';
import 'package:uet_tests/database/Product.dart';
import 'package:uet_tests/database/apis.dart';
import 'package:uet_tests/database/models.dart';
import 'package:uet_tests/screens/details/components/rounded_container.dart';
import 'package:uet_tests/screens/login_success/login_success_screen.dart';
import 'package:uet_tests/components/form_error.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class OrderForm extends StatefulWidget {
  final Test test;

  const OrderForm({Key? key, required this.test}) : super(key: key);
  @override
  _OrderFormState createState() => _OrderFormState();
}

class _OrderFormState extends State<OrderForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String?> errors = [];
  List<TextEditingController> attributesValueList = <TextEditingController>[];

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildAttributesFormField(widget.test),
          SizedBox(
            height: getProportionateScreenHeight(10),
          ),
          FormError(errors: errors),
          Container(
            color: kSecondaryColor.withOpacity(0.3),
            child: Column(
              children: [
                RoundedContainer(
                  color: kSecondaryColor.withOpacity(0.3),
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: SizeConfig.screenWidth * 0.15,
                      right: SizeConfig.screenWidth * 0.15,
                      bottom: getProportionateScreenWidth(40),
                      top: getProportionateScreenWidth(15),
                    ),
                    child: DefaultButton(
                      text: "Order Test",
                      press: () {
                        if (_formKey.currentState!.validate()) {}
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildAttributesFormField(Test test) {
    int nOfAttribute = test.Test_Sample_Attributes.length;
    // int nOfAttribute = 3;
    return nOfAttribute == 0
        ? const Text('No Need Attributes Needed')
        : ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: nOfAttribute,
            shrinkWrap: true,
            reverse: true,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              TextEditingController newController = TextEditingController();
              attributesValueList.add(newController);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    /**
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(8.0)),
                      border: Border.all(width: 2.0, color: kPrimaryColor),
                    ),
                     */
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2),
                          child: Text(
                              '${test.Test_Sample_Attributes.keys.elementAt(nOfAttribute - index - 1)}'),
                        ),
                        TextFormField(
                          controller: attributesValueList[index],
                          keyboardType: TextInputType.text,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              removeError(error: kValueNullError);
                            }
                            return null;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              addError(error: kValueNullError);
                              return "";
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                ],
              );
            },
          );
  }
}
