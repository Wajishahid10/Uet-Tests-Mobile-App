import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import 'package:uet_tests/main.dart';
import 'package:uet_tests/database/models.dart';
import 'package:uet_tests/screens/department_admin/admin_dasboard.dart';
import 'package:uet_tests/screens/emailVerification/emailVerification_screen.dart';
import 'package:uet_tests/screens/complete_profile/complete_profile_screen.dart';
import 'package:uet_tests/screens/login_success/login_success_screen.dart';
import 'package:uet_tests/screens/sign_up/sign_up_screen.dart';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

import 'package:dio/dio.dart';

final baseAPI = 'https://uet-tests.herokuapp.com/api/';

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
  http.Response response = await http.get(
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

Future<Login_Manager> getLoginManagerfromUID() async {
  String uid = auth.currentUser!.uid;
  String query = baseAPI + 'getLoginManagerFromUID/$uid/';

  http.Response responseRecieved = await get(query);

  print(responseRecieved.body);

  Login_Manager login_manager =
      Login_Manager.fromJson(jsonDecode(responseRecieved.body));
  return login_manager;
}

void signupwithGoogle(Map loginData, BuildContext context) async {
  String query = baseAPI + 'signup';

  http.Response responseRecieved = await post(query, loginData);

  print(responseRecieved);

  Map<String, dynamic> login_manager = json.decode(responseRecieved.body);

  int userID = login_manager["LoginID"];

  Navigator.pushReplacementNamed(context, CompleteProfileScreen.routeName,
      arguments: UserIDforGoogleSignInArguments(UserID: userID));
}

Future<void> login(
    String? email, String? password, BuildContext context) async {
  try {
    await auth.signInWithEmailAndPassword(email: email!, password: password!);
    String query = baseAPI + 'getLoginManagerFromUID/${auth.currentUser!.uid}';

    http.Response responseRecieved = await get(query);

    Map<String, dynamic> login_manager = json.decode(responseRecieved.body);

    int userID = login_manager["LoginID"];
    String accountType = login_manager["Account_Type"];
    print(responseRecieved.body);

    if (accountType == '1') {
      // Customer
      await sharedPreferences.setInt("user_ID", userID);
      Navigator.pushNamed(context, LoginSuccessScreen.routeName);
    } else if (accountType == '2') {
      // Customer
      await sharedPreferences.setInt("admin_ID", userID);

      Get.toNamed(dashboard.routeName);
    }
  } on FirebaseAuthException catch (e) {
    if (e.hashCode == "user-not-found") {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('No Such User. You\'ve to create Account.'),
        ),
      );
    } else if (e.code == "") {}

    //  else if (e.code == "") {}
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Couldn\'t Login due to ' + e.message.toString()),
      ),
    );
  }
}

void signupAdmin(Map loginData, Map completeData, XFile? displayPicture,
    BuildContext context) async {
  String query = baseAPI + 'signup';
  try {
    http.Response responseRecieved = await post(query, loginData);

    if (responseRecieved.statusCode == 201) {
      // Created
      print(responseRecieved.body);
      Map<String, dynamic> login_manager = json.decode(responseRecieved.body);
      print(login_manager["LoginID"]);
      completeData["AdminID"] = login_manager["LoginID"];

      completeData["Display_Picture"] =
          base64Encode(await displayPicture!.readAsBytes());

      completeSignupAdmin(completeData, context);

      print("New Account Created");
    } else if (responseRecieved.statusCode == 208) {
      // Already Present

      // Yeahi Uper wala Code agr User Add nhi hua, Wrna Home Screen

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('You Already have an Account. Signin Instead.'),
        ),
      );

      print("Account Already Present");
    }
  } catch (onError) {}
}

void completeSignupAdmin(Map data, BuildContext context) async {
  String query = baseAPI + 'admin';

  print("Completing Sigup");

  http.Response responseRecieved = await post(query, data);

  print(responseRecieved.body);

  Navigator.pushReplacementNamed(context, emailVerificationScreen.routeName);
}

void signup(Map loginData, Map completeData, XFile? displayPicture,
    BuildContext context) async {
  String query = baseAPI + 'signup';
  try {
    http.Response responseRecieved = await post(query, loginData);

    if (responseRecieved.statusCode == 201) {
      // Created
      print(responseRecieved.body);
      Map<String, dynamic> login_manager = json.decode(responseRecieved.body);

      int userID = login_manager["LoginID"];
      completeData["UserID"] = userID;

      completeData["Display_Picture"] =
          base64Encode(await displayPicture!.readAsBytes());

      completeSignup(completeData, context, true);

      print("New Account Created");

      await sharedPreferences.setInt("user_ID", userID);
    } else if (responseRecieved.statusCode == 208) {
      // Already Present

      // Yeahi Uper wala Code agr User Add nhi hua, Wrna Home Screen

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('You Already have an Account. Signin Instead.'),
        ),
      );

      print("Account Already Present");
    }
  } catch (onError) {}
}

void completeSignup(
    Map data, BuildContext context, bool requiredVerficarion) async {
  String query = baseAPI + 'user';

  print("Completing Sigup");

  http.Response responseRecieved = await post(query, data);

  print(responseRecieved.body);
  if (requiredVerficarion) {
    Navigator.pushReplacementNamed(context, emailVerificationScreen.routeName);
  } else {
    Navigator.pushNamed(context, LoginSuccessScreen.routeName);
  }
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

  String query = baseAPI+'user';

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

//  <List<Map<String, String>,String>>

Future<List<Object>> searchBarSuggesstions() async {
  String query = baseAPI + 'home/searchBar';

  http.Response responseRecieved = await get(query);

  Map<String, String> suggestionsMap =
      Map<String, String>.from(jsonDecode(responseRecieved.body));

  List<Object> result = [];

  result.add(suggestionsMap);

  List<String> list_of_testNames_searchbar = [];

  suggestionsMap
      .forEach((key, value) => list_of_testNames_searchbar.add(value));

  result.add(list_of_testNames_searchbar);

  return result;
}

Future<Users> getUser() async {
  String query = baseAPI + 'userinfo/${sharedPreferences.getInt("user_ID")}';

  http.Response responseRecieved = await get(query);

  Users user = Users.fromJson(jsonDecode(responseRecieved.body));

  return user;
}

Future<List<Department>> homeScreenDepartements() async {
  String query = baseAPI + 'home/departments';

  http.Response responseRecieved = await get(query);

  List<Department> departments_List =
      parseDepartmentsData(responseRecieved.body);

  return departments_List;
}

Future<List<Department>> fetchDepartements() async {
  String query = baseAPI + 'department';

  http.Response responseRecieved = await get(query);

  List<Department> departments_List =
      parseDepartmentsData(responseRecieved.body);

  return departments_List;
}

Future<Test> getTest(int id) async {
  String query = baseAPI + 'testinfo/$id';

  http.Response responseRecieved = await get(query);

  print(responseRecieved.body);

  Test test = Test.fromJson(jsonDecode(responseRecieved.body));

  return test;
}

Future<List<Test>> homePopularTests() async {
  String query = baseAPI + 'home/popularTests';

  http.Response responseRecieved = await get(query);

  List<Test> tests_List = parseTestsData(responseRecieved.body);

  return tests_List;
}

Future<List<Test>> popularTests() async {
  String query = baseAPI + 'popularTests';

  http.Response responseRecieved = await get(query);

  List<Test> tests_List = parseTestsData(responseRecieved.body);

  return tests_List;
}

Future<List<Test>> homePreviousTests() async {
  String query =
      baseAPI + 'home/previousTests/${sharedPreferences.getInt("user_ID")}';

  http.Response responseRecieved = await get(query);

  List<Test> tests_List = parseTestsData(responseRecieved.body);

  return tests_List;
}

Future<List<Test>> previousTests() async {
  String query =
      baseAPI + 'previousTests/${sharedPreferences.getInt("user_ID")}';

  http.Response responseRecieved = await get(query);

  List<Test> tests_List = parseTestsData(responseRecieved.body);

  return tests_List;
}

Future<List<Test>> currentOrderTests() async {
  String query =
      baseAPI + 'curretnOrderOfUser/${sharedPreferences.getInt("user_ID")}';

  http.Response responseRecieved = await get(query);

  List<Test> tests_List = parseTestsData(responseRecieved.body);

  return tests_List;
}

Future<List<Test>> specificDepartment_Tests(int id) async {
  String query = baseAPI + 'specificDepartmentTests/$id';

  http.Response responseRecieved = await get(query);

  List<Test> tests_List = parseTestsData(responseRecieved.body);

  return tests_List;
}

Future<List<Order>> orderTest(Map<String, dynamic> dataMap) async {
  String query = baseAPI + 'order';

  http.Response responseRecieved = await post(query, dataMap);

  List<Order> orders_List = parseOrdersData(responseRecieved.body);

  return orders_List;
}

Future<List<List<Object>>> ordersofUser() async {
  String query = baseAPI + 'orderOfUser/${sharedPreferences.getInt("user_ID")}';

  http.Response responseRecieved = await get(query);

  List<List<Object>> objectsList = [];

  List<Order> orders_List = parseOrdersData(responseRecieved.body);

  List<Test> testsList = await currentOrderTests();

  for (int i = 0; i < testsList.length; i++) {
    objectsList.add([orders_List[i], testsList[i]]);
  }
  return objectsList;
}

Future<List<List<Object>>> resultsofUser() async {
  String query =
      baseAPI + 'resultOfUser/${sharedPreferences.getInt("user_ID")}';

  List<List<Object>> objectsList = [];

  http.Response responseRecieved = await get(query);

  List<Result> results_List = parseResultsData(responseRecieved.body);

  List<Test> testsList = await previousTests();

  for (int i = 0; i < testsList.length; i++) {
    objectsList.add([results_List[i], testsList[i]]);
  }

  return objectsList;
}
