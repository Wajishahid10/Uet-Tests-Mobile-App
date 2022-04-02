import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:uet_tests/screens/login_success/login_success_screen.dart';
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

void getLoginManagerfromUID(String uid) async {
  String query = 'https://uet-test.herokuapp.com/api/signup';

  Map<String, dynamic> map = {"uid": uid};

  Uri.https(
      'https://uet-test.herokuapp.com', '/api/getLoginManagerFromUID/', map);

  http.Response responseRecieved = await get(query);

  print(responseRecieved.body);

  if (responseRecieved.statusCode == 201) {
    print("New Account Created");
  } else {
    print("Already Present");
  }
}

void signup(Map data, BuildContext context) async {
  String query = 'https://uet-test.herokuapp.com/api/signup';

  http.Response responseRecieved = await post(query, data);

  if (responseRecieved.statusCode == 201) {
    // Created

    Navigator.pushReplacementNamed(context, CompleteProfileScreen.routeName);
    print("New Account Created");
  } else {
    // Already Present
    getLoginManagerfromUID(data["GoogleSiginUID"]);
    Navigator.pushReplacementNamed(context, LoginSuccessScreen.routeName);
    print("Already Present");
  }
}

void completeSignup(Map data, BuildContext context) async {
  String query = 'https://uet-test.herokuapp.com/api/signup';

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
