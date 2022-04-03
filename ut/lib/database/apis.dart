import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:uet_tests/main.dart';
import 'package:uet_tests/database/models.dart';
import 'package:uet_tests/screens/login_success/login_success_screen.dart';
import 'package:uet_tests/screens/sign_up/sign_up_screen.dart';
import 'package:uet_tests/screens/complete_profile/complete_profile_screen.dart';

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

Login_Manager parseLoginManager(String responseBody) {
  final parsedJson = json.decode(responseBody).cast<Map<String, dynamic>>();
  return Login_Manager.fromJson(parsedJson);
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

  Login_Manager login_manager = parseLoginManager(responseRecieved.body);

  return responseRecieved;
}

void signup(Map data, BuildContext context) async {
  String query = 'https://uet-test.herokuapp.com/api/signup';

  http.Response responseRecieved = await post(query, data);

  /*
  if (responseRecieved.statusCode == 201) {
    // Created
    Navigator.pushReplacementNamed(context, CompleteProfileScreen.routeName);
    print("New Account Created");
  } else if (responseRecieved.statusCode == 208) {
    // Already Present

    http.Response loginMangerResponse = (data["GoogleSiginUID"]);
    if (loginMangerResponse.statusCode == 302) {
    } else {}

    Navigator.pushReplacementNamed(context, LoginSuccessScreen.routeName);
    print("Already Present");
  }*/
  Navigator.pushReplacementNamed(context, CompleteProfileScreen.routeName);
}

void completeSignup(Map data, BuildContext context) async {
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
}
