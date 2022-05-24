import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:uet_tests/constants.dart';
import 'package:uet_tests/customformfiled.dart';

import 'package:uet_tests/screens/department_admin/admin_dasboard.dart';
import '../../components/custom_surfix_icon.dart';
import '../../components/default_button.dart';
import '../../components/form_error.dart';
import '../../helper/keyboard.dart';
import '../../size_config.dart';
import 'package:image_picker/image_picker.dart';

class add_test extends StatefulWidget {
  static String routeName = "/add_test";
  add_test({Key? key}) : super(key: key);

  @override
  State<add_test> createState() => _add_testState();
}

class _add_testState extends State<add_test> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: add_test_form(),
    );
  }
}

class add_test_form extends StatefulWidget {
  add_test_form({Key? key}) : super(key: key);

  @override
  State<add_test_form> createState() => _add_test_formState();
}

class _add_test_formState extends State<add_test_form> {
  final List<String?> errors = [];
  late String password;

  String? customValidtaor(String? fieldContent) {
    if (fieldContent!.isEmpty) {
      return "This field is required";
    }
    return null;
  }

  String? customNumericValidtaor(String? fieldContent) {
    if (fieldContent!.isEmpty) {
      return "This field is required";
    } else if (!_isNumeric(fieldContent)) {
      return "Only digits are allow";
    }
    return null;
  }

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

  //controleer variables

  final _formKey = GlobalKey<FormState>();
  // TextEditingController _controllerTitle = TextEditingController();
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerDescription = TextEditingController();
  TextEditingController _controllerEstimateTestTime = TextEditingController();
  // TextEditingController _controllerEstimateTestTiming = TextEditingController();
  TextEditingController _controllerSampleTestAttribute =
      TextEditingController();
  TextEditingController _controllerPrice = TextEditingController();
  TextEditingController _controllerTestCount = TextEditingController();
  String warning_image = '';

  Client client = http.Client();
  var createUrl = Uri.parse('https://uet-tests.herokuapp.com/api/test');

  //for drop down menu

  var _currency = ['Civil', 'Electrical', 'Geology', 'Mechanical'];
  var _currentItemSelected = 'Civil';

  //function to check that a string contains only numberic or not
  bool _isNumeric(String result) {
    if (result == null) {
      return false;
    }
    return double.tryParse(result) != null;
  }

  // image picker code
  File? _image;
  Future<void> chooseFile() async {
    var _imageFile =
        await ImagePicker.platform.pickImage(source: ImageSource.gallery);
    // var _imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      var path = _imageFile!.path;
      _image = File(path);
    });
  }

  @override
  final ImagePicker _picker = ImagePicker();
  XFile? image;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor.withOpacity(0.5),
        elevation: 0,
        title: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              // padding: const EdgeInsets.all(8.0),
              padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
              child: Text(
                'Add Test',
                // style: headingStyle,
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(30),
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: kPrimaryColor.withOpacity(0.5),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(38, 30, 38, 38),
            child: Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    topLeft: Radius.circular(30)),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(18, 30, 18, 18),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      //Department Name field
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomTextFormField(
                              _controllerName,
                              customValidtaor,
                              "Test Title",
                              "Title",
                              "assets/icons/Mail.svg")),
                      //Contact number field
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomTextFormField(
                              _controllerEstimateTestTime,
                              customValidtaor,
                              "Test Estimate Time",
                              "Test Estimate Time",
                              "assets/icons/Mail.svg")),
                      //Email field
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomTextFormField(
                              _controllerSampleTestAttribute,
                              customValidtaor,
                              "Test Attributes",
                              "Test Attributes",
                              "assets/icons/Mail.svg")),
                      // //description field
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomTextFormField(
                            _controllerPrice,
                            customNumericValidtaor,
                            "Enter Price",
                            "Test Price",
                            "assets/icons/Mail.svg"),
                      ),
                      // //price
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomTextFormField(
                              _controllerTestCount,
                              customNumericValidtaor,
                              "Enter Count",
                              "Test Count",
                              "assets/icons/Mail.svg")),

                      // // description
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: buildDescriptionFormField(),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          DropdownButton<String>(
                            items: _currency.map((String dropDownStringItem) {
                              return DropdownMenuItem<String>(
                                value: dropDownStringItem,
                                child: Text(dropDownStringItem),
                              );
                            }).toList(),
                            onChanged: (String? newValueSelected) {
                              setState(() {
                                this._currentItemSelected = newValueSelected!;
                              });
                            },
                            value: _currentItemSelected,
                          ),
                        ],
                      ),
                      //image picking warning
                      Padding(
                        padding: const EdgeInsets.only(left: 150.0, top: 0),
                        child: Text(
                          warning_image,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          PopupMenuButton(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFF5F6F9),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.camera_alt,
                                size: 60,
                              ),
                            ),
                            elevation: 20,
                            itemBuilder: (context) => [
                              PopupMenuItem(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.camera,
                                    ),
                                    Text("Camera"),
                                  ],
                                ),
                                value: 1,
                                onTap: () async {
                                  image = await _picker.pickImage(
                                      source: ImageSource.camera);
                                },
                              ),
                              PopupMenuItem(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.photo_album,
                                    ),
                                    Text("Gallery"),
                                  ],
                                ),
                                value: 2,
                                onTap: () async {
                                  image = await _picker.pickImage(
                                      source: ImageSource.gallery);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),

                      // FormError(errors: errors,),
                      SizedBox(height: 10),
                      DefaultButton(
                        text: "Upload",
                        press: () async {
                          if (_formKey.currentState!.validate()) {
                            final x = base64Encode(await image!.readAsBytes());
                            int index = _currency.indexOf(_currentItemSelected);
                            index = index + 12;
                            String sindex = index.toString();
                            client.post(createUrl,
                                headers: {"Content-Type": "application/json"},
                                body: jsonEncode({
                                  "Test_ID": "1",
                                  "Name": _controllerName.text,
                                  "Description": _controllerDescription.text,
                                  "Estimates_Testing_Time":
                                      _controllerEstimateTestTime.text,
                                  "Test_Sample_Attributes": {
                                    "name": _controllerSampleTestAttribute.text
                                  },
                                  "Image": x,
                                  "Price": _controllerPrice.text,
                                  "Test_Counts": _controllerTestCount.text,
                                  "TestCreated": "2022-04-29T11:19:33.658919Z",
                                  "Department_ID": sindex
                                }));
                            // if all are valid then go to success screen
                            KeyboardUtil.hideKeyboard(context);
                            Get.toNamed(dashboard.routeName);
                            // Navigator.pushNamed(context, LoginSuccessScreen.routeName);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      // drawer: MyAdminDrawer(),
    );
  }

  TextFormField buildDescriptionFormField() {
    return TextFormField(
      // obscureText: true,
      controller: _controllerDescription,
      maxLines: 5,
      validator: (value) {
        if (value!.isEmpty) {
          return "This Filed is required";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Description",
        hintText: "Enter the description",
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 2.0),
        ),
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/description.svg"),
      ),
    );
  }
}
