import 'dart:async';
import 'dart:convert';
import 'dart:io' as Io;

import 'package:uet_tests/database/models.dart';
import 'package:uet_tests/screens/department_admin/admin_dasboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uet_tests/constants.dart';
import 'package:uet_tests/customformfiled.dart';
import 'package:uet_tests/screens/department_admin/show_dept_admin.dart';

import '../../components/custom_surfix_icon.dart';
import '../../components/default_button.dart';
import '../../components/form_error.dart';
import '../../helper/keyboard.dart';
import '../../size_config.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class add_department extends StatefulWidget {
  static String routeName = "/add_department";
  // List<String> lis;
  // SecondScreen({Key key, @required this.text}) : super(key: key);
  add_department({Key? key}) : super(key: key);

  @override
  State<add_department> createState() => _add_departmentState();
}

class _add_departmentState extends State<add_department> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: add_department_form(),
    );
  }
}

class add_department_form extends StatefulWidget {
  add_department_form({Key? key}) : super(key: key);

  @override
  State<add_department_form> createState() => _add_department_formState();
}

class _add_department_formState extends State<add_department_form> {
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
  TextEditingController _controllerDepartmentName = TextEditingController();
  TextEditingController _controllerDepartmentContact = TextEditingController();
  TextEditingController _controllerDepartmentEmail = TextEditingController();
  String warning_image = '';
  Client client = http.Client();
  var createUrl = Uri.parse('https://uet-tests.herokuapp.com/api/department');
  //for drop down menu

  var _currency = ['Nabeel', 'Wajahat', 'Gufran', 'Shuaib'];
  var _currentItemSelected = 'Nabeel';

  //function to check that a string contains only numberic or not
  bool _isNumeric(String result) {
    if (result == null) {
      return false;
    }
    return double.tryParse(result) != null;
  }

  // Client client = http.Client();

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
              child: Text('Add Departments',
                  style: TextStyle(
                      fontSize: getProportionateScreenWidth(30),
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: kPrimaryColor.withOpacity(0.5),
          child: Column(
            children: [
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.fromLTRB(38, 30, 38, 38),
                child: Column(
                  children: [
                    SizedBox(height: getProportionateScreenHeight(95)),
                    Card(
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
                                      _controllerDepartmentName,
                                      customValidtaor,
                                      "Department Name",
                                      "Name",
                                      "assets/icons/Mail.svg")),
                              //Contact number field
                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CustomTextFormField(
                                      _controllerDepartmentContact,
                                      customValidtaor,
                                      "Department Contact",
                                      "Department Contact",
                                      "assets/icons/Mail.svg")),
                              //Email field
                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CustomTextFormField(
                                      _controllerDepartmentEmail,
                                      customValidtaor,
                                      "Department Email",
                                      "Department Email",
                                      "assets/icons/Mail.svg")),

                              //image picking warning
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 150.0, top: 0),
                                child: Text(
                                  warning_image,
                                  style: const TextStyle(color: Colors.red),
                                ),
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  DropdownButton<String>(
                                    items: _currency
                                        .map((String dropDownStringItem) {
                                      return DropdownMenuItem<String>(
                                        value: dropDownStringItem,
                                        child: Text(dropDownStringItem),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValueSelected) {
                                      setState(() {
                                        this._currentItemSelected =
                                            newValueSelected!;
                                      });
                                    },
                                    value: _currentItemSelected,
                                  ),
                                ],
                              ),

                              SizedBox(
                                height: 8,
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
                                    final x = base64Encode(
                                        await image!.readAsBytes());
                                    int index =
                                        _currency.indexOf(_currentItemSelected);
                                    index = index + 18;
                                    String sindex = index.toString();
                                    print(index);
                                    client.post(createUrl, body: {
                                      "Department_ID": "1",
                                      "Name": _controllerDepartmentName.text,
                                      "Display_Picture": x,
                                      "Contact_Number_toDisplay":
                                          _controllerDepartmentContact.text,
                                      "Email_Address":
                                          _controllerDepartmentEmail.text,
                                      "DepartmentCreated":
                                          "2022-04-29T11:19:33.658919Z",
                                      "Admin_ID": sindex
                                    });

                                    // _formKey.currentState!.save();
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
