import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uet_tests/components/custom_surfix_icon.dart';
import 'package:uet_tests/components/default_button.dart';
import 'package:uet_tests/components/form_error.dart';
import 'package:uet_tests/database/apis.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import 'package:uet_tests/main.dart';

import 'package:firebase_auth/firebase_auth.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String?> errors = [];
  late String email;
  late String password;
  late String? confirm_password;
  String? firstName;
//  String? lastName;
  String? companyName;
  String? phoneNumber;
  String? address;
  XFile? displayPicture;

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
    final ImagePicker _picker = ImagePicker();
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildFirstNameFormField(),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          /*
            buildLastNameFormField(),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),

          */
          buildCompanyFormField(),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          buildAddressFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPhoneNumberFormField(),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          buildEmailFormField(),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          buildPasswordFormField(),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          buildConfirmPassFormField(),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          buildProfilePic(),
          FormError(errors: errors),
          SizedBox(
            height: getProportionateScreenHeight(40),
          ),
          DefaultButton(
            text: "Continue",
            press: () async {
              if (displayPicture == null) {
                addError(error: "Display Picture Not Found");
              }
              if (_formKey.currentState!.validate() && displayPicture != null) {
                _formKey.currentState!.save();
                // if all are valid then go to success screen
                UserCredential userCredential;
                try {
                  userCredential = await auth.createUserWithEmailAndPassword(
                      email: email, password: password);

                  await userCredential.user!.sendEmailVerification();

                  Map credMap = {
                    "GoogleSiginUID": auth.currentUser!.uid,
                    "Account_Type": "1"
                  };

                  // 1 = User, 2 = Department Admin, 3 = System Admin

                  Map completeMap = {
                    "userName": firstName,
                    "Company": companyName,
                    "Contact_Number": phoneNumber,
                    "Address": address,
                    "Email_Address": email,
                  };

                  signup(credMap, completeMap, displayPicture, context);

                  //        return userCredential.user;
                } on FirebaseAuthException catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(e.message!),
                    ),
                  );
                  print(
                      "An error occured while trying to send Email Verification");
                  print(e.toString());
                }
              }
            },
          ),
        ],
      ),
    );
  }

  Widget buildProfilePic() {
    final ImagePicker _picker = ImagePicker();
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            backgroundImage: displayPicture != null
                ? FileImage(File(displayPicture!.path))
                : AssetImage("assets/images/Profile Image.png")
                    as ImageProvider,
          ),
          Positioned(
            right: -16,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              child: PopupMenuButton(
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F6F9),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.camera_alt),
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
                      displayPicture = await _picker.pickImage(
                          source: ImageSource.camera, imageQuality: 40);
                      setState(() {});
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
                      displayPicture =
                          await _picker.pickImage(source: ImageSource.gallery);
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );

    /**
          PopupMenuButton(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFF5F6F9),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Profile Picture',
                      style: TextStyle(fontSize: 22, fontFamily: 'bold'),
                    ),
                    Icon(Icons.camera_alt),
                  ],
                ),
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
                  displayPicture =
                      await _picker.pickImage(source: ImageSource.camera);
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
                  displayPicture =
                      await _picker.pickImage(source: ImageSource.gallery);
                },
              ),
            ],
          ),
           */
  }

  TextFormField buildConfirmPassFormField() {
    bool isHidden = true;
    return TextFormField(
      obscureText: isHidden,
      onSaved: (newValue) => confirm_password = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.isNotEmpty && password == confirm_password) {
          removeError(error: kMatchPassError);
        }
        confirm_password = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if ((password != value)) {
          addError(error: kMatchPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Confirm Password",
        hintText: "Re-Enter your Password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: isHidden
            ? GestureDetector(
                child: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
                onTap: () {
                  setState(() {
                    isHidden = !isHidden;
                  });
                },
              )
            : GestureDetector(
                child: Icon(Icons.hide_source),
                onTap: () {
                  setState(() {
                    isHidden = !isHidden;
                  });
                },
              ),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    bool isHidden = true;

    return TextFormField(
      obscureText: isHidden,
      onSaved: (newValue) => password = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        password = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your Password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: isHidden
            ? GestureDetector(
                child: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
                onTap: () {
                  setState(() {
                    isHidden = !isHidden;
                  });
                },
              )
            : GestureDetector(
                child: Icon(Icons.hide_source),
                onTap: () {
                  setState(() {
                    isHidden = !isHidden;
                  });
                },
              ),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your Email",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      onSaved: (newValue) => address = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kAddressNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kAddressNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Address",
        hintText: "Enter your Address",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:
            CustomSurffixIcon(svgIcon: "assets/icons/Location point.svg"),
      ),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => phoneNumber = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Phone Number",
        hintText: "Enter your Phone Number",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }

  TextFormField buildCompanyFormField() {
    return TextFormField(
      onSaved: (newValue) => companyName = newValue,
      decoration: InputDecoration(
        labelText: "Company Name",
        hintText: "Company's Name",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Conservation.svg"),
      ),
    );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      onSaved: (newValue) => firstName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNamelNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kNamelNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Name",
        hintText: "Enter your Name",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

/*
  TextFormField buildLastNameFormField() {
    return TextFormField(
      onSaved: (newValue) => lastName = newValue,
      decoration: InputDecoration(
        labelText: "Last Name",
        hintText: "Enter your Last name",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }
   */
}
