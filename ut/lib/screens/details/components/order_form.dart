import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:uet_tests/components/custom_surfix_icon.dart';
import 'package:uet_tests/components/default_button.dart';
import 'package:uet_tests/components/form_error.dart';
import 'package:uet_tests/database/Product.dart';
import 'package:uet_tests/database/apis.dart';
import 'package:uet_tests/database/models.dart';
import 'package:uet_tests/screens/login_success/login_success_screen.dart';
import 'package:uet_tests/main.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class OrderForm extends StatefulWidget {
  final Product test;

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
            height: getProportionateScreenHeight(30),
          ),
          SizedBox(
            height: getProportionateScreenHeight(40),
          ),
          DefaultButton(
            text: "Continue",
            press: () async {
              if (_formKey.currentState!.validate()) {
                /**
                Map completeMap = {
                  "UserID": auth.currentUser!.uid,
                  "userName": firstName,
                  "Company": companyName,
                  "Contact_Number": phoneNumber,
                  "Address": address,
                  "Email_Address": auth.currentUser!.email,
                };
                
                completeSignup(completeMap, context);
 */
              }
            },
          ),
        ],
      ),
    );
  }

  Widget buildAttributesFormField(Product test) {
    //int nOfAttribute=test.Test_Sample_Attributes!.length;
    int nOfAttribute = 3;
    return nOfAttribute == 0
        ? const Text('Please Enter Number of Attributes First')
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
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(8.0)),
                      border: Border.all(width: 2.0, color: Colors.blueGrey),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2),
                          child: Text('Attribute Number '),
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
