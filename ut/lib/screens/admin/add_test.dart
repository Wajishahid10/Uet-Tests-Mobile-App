import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uet_tests/constants.dart';

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
  //controleer variables

  final _formKey = GlobalKey<FormState>();
  TextEditingController _controllerTitle = TextEditingController();
  TextEditingController _controllerPrice = TextEditingController();
  TextEditingController _controllerQuantity = TextEditingController();
  TextEditingController _controllerDescription = TextEditingController();
  TextEditingController _controllerCatagory = TextEditingController();
  TextEditingController _controllerDate = TextEditingController();
  String warning_image = '';

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
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Add Products',
                style: TextStyle(fontSize: 20, color: Colors.white),
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
            padding: const EdgeInsets.all(28.0),
            child: Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    topLeft: Radius.circular(30)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // const Padding(
                      //   padding: EdgeInsets.all(15),
                      //   child: TextField(
                      //     decoration: InputDecoration(
                      //       border: OutlineInputBorder(),
                      //       labelText: 'User Name',
                      //       hintText: 'Enter Your Name',
                      //     ),
                      //   ),
                      // ),
                      //title field
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: _controllerTitle,
                          decoration: const InputDecoration(
                            icon: Icon(
                              Icons.person,
                              color: kPrimaryLightColor,
                            ),
                            hintText: 'Enter the product title',
                            focusColor: kPrimaryLightColor,
                            labelText: 'Title',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter product title';
                            }
                            return null;
                          },
                        ),
                      ),
                      //price field
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: _controllerPrice,
                          // obscureText: true,
                          decoration: const InputDecoration(
                            icon: Icon(
                              Icons.lock,
                              color: kPrimaryLightColor,
                            ),
                            hintText: 'Enter the price for one item',
                            labelText: 'Price',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter price for one item';
                            } else if (_isNumeric(value) == false) {
                              return 'Please enter only numbers';
                            }
                            return null;
                          },
                        ),
                      ),
                      //quatity field
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: _controllerQuantity,
                          decoration: const InputDecoration(
                            icon: Icon(
                              Icons.person,
                              color: kPrimaryLightColor,
                            ),
                            hintText: 'Product quantity in digits',
                            focusColor: kPrimaryLightColor,
                            labelText: 'Quantity',
                          ),
                          // validator: (value) {
                          //   if (value!.isEmpty) {
                          //     return 'Please enter some numbers';
                          //   } else if (_isNumeric(value) == false) {
                          //     return 'please enter some numbers';
                          //   }
                          //   return null;
                          // },
                        ),
                      ),
                      //description field
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: _controllerDescription,
                          keyboardType: TextInputType.multiline,
                          decoration: const InputDecoration(
                            icon: Icon(
                              Icons.person,
                              color: kPrimaryLightColor,
                            ),
                            hintText: 'Enter the product description',
                            focusColor: kPrimaryLightColor,
                            labelText: 'Description',
                          ),
                          // validator: (value) {
                          //   if (value!.isEmpty) {
                          //     return 'Please enter some description';
                          //   }
                          //   return null;
                          // },
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(40.0, 0, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                            IconButton(
                              onPressed: () {
                                chooseFile();
                                setState(() {
                                  warning_image = '';
                                });
                              },
                              icon: Image.asset('assets/icons/img.png'),
                              iconSize: 50,
                            ),
                          ],
                        ),
                      ),
                      //image picking warning
                      Padding(
                        padding: const EdgeInsets.only(left: 150.0, top: 0),
                        child: Text(
                          warning_image,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 150.0, top: 40.0),
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                            color: kPrimaryColor.withOpacity(0.7),
                            child: const Text(
                              'Upload',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              // if (_image == null) {
                              //   setState(() {
                              //     warning_image = 'kindly choose an image';
                              //   });
                              // }
                              // // It returns true if the form is valid, otherwise returns false
                              // if (_formKey.currentState!.validate() &&
                              //     _image != null) {
                              //   uploadFile();
                              //   //upload image to firebase storage
                              //   Navigator.push(
                              //       context,
                              //       MaterialPageRoute(
                              //           builder: (context) => dashboard()));
                              // }
                            }),
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
}
