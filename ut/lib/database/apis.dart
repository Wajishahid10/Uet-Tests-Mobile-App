import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import 'package:uet_tests/main.dart';
import 'package:uet_tests/database/models.dart';
import 'package:uet_tests/screens/emailVerification/emailVerification_screen.dart';
import 'package:uet_tests/screens/complete_profile/complete_profile_screen.dart';
import 'package:uet_tests/screens/login_success/login_success_screen.dart';
import 'package:uet_tests/screens/sign_up/sign_up_screen.dart';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

import 'package:dio/dio.dart';

Future<http.Response> post(String query, Map data) async {
  String _dataToSend = json.encode(data);

  http.Response response = await http.post(
    Uri.parse(query),
    headers: {"Content-Type": "application/json"},
    body: _dataToSend,
  );

  dynamic recievedData;

  if (response.statusCode == 200) {
    print(response.body);
    recievedData = jsonDecode(response.body);
  } else {
    print(response.statusCode);
  }

  return response;
}

Future<http.Response> get(String query) async {
  http.Response response = await http.post(
    Uri.parse(query),
    headers: {"Content-Type": "application/json"},
  );

  dynamic recievedData;

  if (response.statusCode == 200) {
    print(response.body);
    recievedData = jsonDecode(response.body);
  } else {
    print(response.statusCode);
  }

  return response;
}

List<Login_Manager> parseLoginManagerList(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed
      .map<Login_Manager>((json) => Login_Manager.fromJson(json))
      .toList();
}

Future<http.Response> getLoginManagerfromUID() async {
  String uid = auth.currentUser!.uid;
  String query =
      'https://uet-test.herokuapp.com/api/getLoginManagerFromUID/$uid/';

  http.Response responseRecieved = await get(query);

  print(responseRecieved.body);

  List<Login_Manager> login_manager =
      parseLoginManagerList(responseRecieved.body);

  return responseRecieved;
}

void signupwithGoogle(Map loginData, BuildContext context) async {
  String query = 'https://uet-test.herokuapp.com/api/signup';

  http.Response responseRecieved = await post(query, loginData);

  if (responseRecieved.statusCode == 200) {
    // Created

    Navigator.pushReplacementNamed(context, CompleteProfileScreen.routeName);

    print("New Account Created");
  }
}

void signup(Map loginData, Map completeData, XFile? displayPicture,
    BuildContext context) async {
  String query = 'https://uet-test.herokuapp.com/api/signup';

  http.Response responseRecieved = await post(query, loginData);

  if (responseRecieved.statusCode == 201) {
    // Created
    print(responseRecieved.body);
    Map<String, dynamic> login_manager = json.decode(responseRecieved.body);
    print(login_manager["LoginID"]);
    completeData["UserID"] = login_manager["LoginID"];

    completeData["Display_Picture"] =
        base64Encode(await displayPicture!.readAsBytes());

    completeSignup(completeData, context);

    //  Navigator.pushReplacementNamed(context, emailVerificationScreen.routeName);

    print("New Account Created");
  } else if (responseRecieved.statusCode == 208) {
    // Already Present

    // Yeahi Uper wala Code agr User Add nhi u¡hua, Wrna Home Screen

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('You Already have an Account. Signin Instead.'),
      ),
    );

    print("Account Already Present");
  }
}

void completeSignup(Map data, BuildContext context) async {
  String query = 'https://uet-test.herokuapp.com/api/user';

  print("Completing Sigup");

  http.Response responseRecieved = await post(query, data);

  print(responseRecieved.body);

  /*
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Center(
          child: Image.memory(
            (base64Decode(
                json.decode(responseRecieved.body)["Display_Picture"])),
          ),
        ),
      ));
      
    */

/**
 * 


  var request = http.MultipartRequest('POST', Uri.parse(query));

  final documentPath = (await getTemporaryDirectory()).path;
  request.files.add(await http.MultipartFile.fromPath(
      displayPicture.path.split('/').first,
      documentPath + '/' + path.basename(displayPicture.path.split('/').last)));
  var res = await request.send();

  print(res.reasonPhrase);


  int length = await displayPicture.length();
  var request = http.MultipartRequest('POST', Uri.parse(query));
  request.files.add(await http.MultipartFile(
    'image',
    displayPicture.readAsBytes().asStream(),
    length,
    filename: displayPicture.path.split('/').last,
  ));
  var res = await request.send();

  Dio dio = new Dio();
  FormData formdata = new FormData(); // just like JS
  formdata.add("photos", new UploadFileInfo(_image, basename(_image.path)));
  dio
      .post(uploadURL,
          data: formdata,
          options: Options(
              method: 'POST',
              responseType: ResponseType.PLAIN // or ResponseType.JSON
              ))
      .then((response) => print(response))
      .catchError((error) => print(error));

  http.Response response = await getLoginManagerfromUID();

  if (response.statusCode == 404) {
    Navigator.pushReplacementNamed(context, SignUpScreen.routeName);
    return;
  }

  Login_Manager login_manager = parseLoginManager(response.body);

  String query = 'https://uet-test.herokuapp.com/api/user';

  http.Response responseRecieved = await post(query, data);

  if (responseRecieved.statusCode == 201) {
    // Created

    Navigator.pushReplacementNamed(context, CompleteProfileScreen.routeName);
    print("New Account Created");
  } else {
    // Already Present

    Navigator.pushReplacementNamed(context, LoginSuccessScreen.routeName);
    print("Already Present");
  }
  */
}
