import 'dart:convert';
import 'dart:io' as Io;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:uet_tests/database/apis.dart';
import 'package:uet_tests/screens/department_admin/admin_dasboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uet_tests/constants.dart';
import 'package:uet_tests/customformfiled.dart';

import '../../components/custom_surfix_icon.dart';
import '../../components/default_button.dart';
import '../../components/form_error.dart';
import '../../helper/keyboard.dart';
import '../../main.dart';
import '../../size_config.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class add_dept_admin extends StatefulWidget {
  static String routeName = "/add_dept_admin";
  add_dept_admin({Key? key}) : super(key: key);

  @override
  State<add_dept_admin> createState() => _add_dept_adminState();
}

class _add_dept_adminState extends State<add_dept_admin> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: add_dept_admin_form(),
    );
  }
}

class add_dept_admin_form extends StatefulWidget {
  add_dept_admin_form({Key? key}) : super(key: key);

  @override
  State<add_dept_admin_form> createState() => _add_dept_admin_formState();
}

class _add_dept_admin_formState extends State<add_dept_admin_form> {
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
  TextEditingController _controllerDeptAdminName = TextEditingController();
  TextEditingController _controllerRole = TextEditingController();
  TextEditingController _controllerContactNumber = TextEditingController();
  TextEditingController _controllerAddress = TextEditingController();
  TextEditingController _controllerEmailAddress = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();
  TextEditingController _controllerConfirmPassword = TextEditingController();
  String warning_image = '';
  Client client = http.Client();
  var createUrl = Uri.parse('https://uet-tests.herokuapp.com/api/admin');
  //for drop down menu

  var _currency = ['Perfumes', 'Makeup', 'Soaps & Shampo', 'others'];
  var _currentItemSelected = 'Makeup';

  //function to check that a string contains only numberic or not
  bool _isNumeric(String result) {
    if (result == null) {
      return false;
    }
    return double.tryParse(result) != null;
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
              child: Text('Add Dept Admin',
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
                                      _controllerDeptAdminName,
                                      customValidtaor,
                                      "Dept Admin Name",
                                      "Dept Admin Name",
                                      "assets/icons/Mail.svg")),
                              //Contact number field
                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CustomTextFormField(
                                      _controllerRole,
                                      customValidtaor,
                                      "Role",
                                      "Role",
                                      "assets/icons/Mail.svg")),
                              //Email field
                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CustomTextFormField(
                                      _controllerContactNumber,
                                      customValidtaor,
                                      "Contact Number",
                                      "Contact Number",
                                      "assets/icons/Mail.svg")),

                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CustomTextFormField(
                                      _controllerAddress,
                                      customValidtaor,
                                      "Address",
                                      "Address",
                                      "assets/icons/Mail.svg")),

                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CustomTextFormField(
                                      _controllerEmailAddress,
                                      customValidtaor,
                                      "Email Address",
                                      "Email Address",
                                      "assets/icons/Mail.svg")),

                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CustomTextFormField(
                                      _controllerPassword,
                                      customValidtaor,
                                      "Password",
                                      "Password",
                                      "assets/icons/Mail.svg")),
                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CustomTextFormField(
                                      _controllerConfirmPassword,
                                      customValidtaor,
                                      "Confirm Password",
                                      "Confirm Password",
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
                                  // press: () async {
                                  //   if (_formKey.currentState!.validate()) {
                                  //     final x = base64Encode(
                                  //         await image!.readAsBytes());
                                  //     client.post(createUrl, body: {
                                  //       "AdminID": "4",
                                  //       "adminName":
                                  //           _controllerDeptAdminName.text,
                                  //       "Display_Picture": x,
                                  //       "Role": _controllerRole.text,
                                  //       "Contact_Number":
                                  //           _controllerContactNumber.text,
                                  //       "Address": _controllerAddress.text,
                                  //       "Email_Address":
                                  //           _controllerEmailAddress.text
                                  //     });

                                  //     // _formKey.currentState!.save();
                                  //     // if all are valid then go to success screen
                                  //     KeyboardUtil.hideKeyboard(context);
                                  //     Get.toNamed(dashboard.routeName);
                                  //     // Navigator.pushNamed(context, LoginSuccessScreen.routeName);
                                  //   }
                                  // },
                                  press: () async {
                                    if (_formKey.currentState!.validate() &&
                                        image != null) {
                                      _formKey.currentState!.save();

                                      // if all are valid then go to success screen
                                      UserCredential userCredential;
                                      try {
                                        userCredential = await auth
                                            .createUserWithEmailAndPassword(
                                                email: _controllerEmailAddress
                                                    .text,
                                                password:
                                                    _controllerPassword.text);

                                        await userCredential.user!
                                            .sendEmailVerification();

                                        Map credMap = {
                                          "GoogleSiginUID":
                                              auth.currentUser!.uid,
                                          "Account_Type": "2"
                                        };

                                        Map completeMap = {
                                          // "AdminID": 1,
                                          "adminName":
                                              _controllerDeptAdminName.text,
                                          "Role": _controllerRole.text,
                                          // "Display_Picture": x,
                                          "Contact_Number":
                                              _controllerContactNumber.text,
                                          "Address": _controllerAddress.text,
                                          "Email_Address":
                                              _controllerEmailAddress.text,
                                        };

                                        signupAdmin(credMap, completeMap, image,
                                            context);

                                        //        return userCredential.user;
                                      } on FirebaseAuthException catch (e) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(e.message!),
                                          ),
                                        );
                                        print(
                                            "An error occured while trying to send Email Verification");
                                        print(e.toString());
                                      }
                                    }
                                  }),
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
