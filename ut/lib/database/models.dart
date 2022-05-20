import 'dart:convert';

import 'package:flutter/cupertino.dart';

class Login_Manager {
  int LoginID;
  String GoogleSiginUID;
  String Account_Type;

  Login_Manager({
    required this.LoginID,
    required this.GoogleSiginUID,
    required this.Account_Type,
  });

  factory Login_Manager.fromJson(Map<String, dynamic> json) {
    return Login_Manager(
      LoginID: json["LoginID"],
      GoogleSiginUID: json["GoogleSiginUID"],
      Account_Type: json["Account_Type"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'LoginID': LoginID,
      'GoogleSiginUID': GoogleSiginUID,
      'Account_Type': Account_Type,
    };
  }

  @override
  String toString() {
    return 'Login_Manager{GoogleSiginUID: $GoogleSiginUID Account_Type: $Account_Type}';
  }
}

List<Login_Manager> parseLogin_ManagersData(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed
      .map<Login_Manager>((json) => Login_Manager.fromJson(json))
      .toList();
}

class User {
  int UserID;
  String userName;
  String Display_Picture;
  String Company;
  String Contact_Number;
  String Address;
  String Email_Address;
  String AccountCreated;

  User({
    required this.UserID,
    required this.userName,
    required this.Display_Picture,
    required this.Company,
    required this.Contact_Number,
    required this.Address,
    required this.Email_Address,
    required this.AccountCreated,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      UserID: json["UserID"],
      userName: json["userName"],
      Display_Picture: json["Display_Picture"],
      Company: json["Company"],
      Contact_Number: json["Contact_Number"],
      Address: json["Address"],
      Email_Address: json["Email_Address"],
      AccountCreated: json["AccountCreated"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'UserID': UserID,
      'userName': userName,
      'Display_Picture': Display_Picture,
      'Company': Company,
      'Address': Address,
      'Contact_Number': Contact_Number,
      'Email_Address': Email_Address,
      'AccountCreated': AccountCreated,
    };
  }

  @override
  String toString() {
    return 'User{userName: $userName Company: $Company}';
  }
}

List<User> parseUsersData(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<User>((json) => User.fromJson(json)).toList();
}

class Admin {
  int AdminID;
  String adminName;
  String Display_Picture;
  String Role;
  String Contact_Number;
  String Address;
  String Email_Address;
  String AccountCreated;

  Admin({
    required this.AdminID,
    required this.adminName,
    required this.Display_Picture,
    required this.Role,
    required this.Contact_Number,
    required this.Address,
    required this.Email_Address,
    required this.AccountCreated,
  });

  factory Admin.fromJson(Map<String, dynamic> json) {
    return Admin(
      AdminID: json["AdminID"],
      adminName: json["adminName"],
      Display_Picture: json["Display_Picture"],
      Role: json["Role"],
      Contact_Number: json["Contact_Number"],
      Address: json["Address"],
      Email_Address: json["Email_Address"],
      AccountCreated: json["AccountCreated"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'AdminID': AdminID,
      'adminName': adminName,
      'Display_Picture': Display_Picture,
      'Role': Role,
      'Address': Address,
      'Contact_Number': Contact_Number,
      'Email_Address': Email_Address,
      'AccountCreated': AccountCreated,
    };
  }
}

List<Admin> parseAdminsData(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Admin>((json) => Admin.fromJson(json)).toList();
}

class Department {
  int Department_ID;
  String departmentName;
  String Display_Picture;
  int Admin_ID;
  String Contact_Number_toDisplay;
  String Email_Address;
  String DepartmentCreated;

  Department({
    required this.Department_ID,
    required this.departmentName,
    required this.Display_Picture,
    required this.Admin_ID,
    required this.Contact_Number_toDisplay,
    required this.Email_Address,
    required this.DepartmentCreated,
  });

  factory Department.fromJson(Map<String, dynamic> json) {
    return Department(
      Department_ID: json["Department_ID"],
      departmentName: json["Name"],
      Display_Picture: json["Display_Picture"],
      Admin_ID: json["Admin_ID"],
      Contact_Number_toDisplay: json["Contact_Number_toDisplay"],
      Email_Address: json["Email_Address"],
      DepartmentCreated: json["DepartmentCreated"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Department_ID': Department_ID,
      'Name': departmentName,
      'Display_Picture': Display_Picture,
      'Admin_ID': Admin_ID,
      'Role': Admin_ID,
      'Contact_Number_toDisplay': Contact_Number_toDisplay,
      'Email_Address': Email_Address,
      'DepartmentCreated': DepartmentCreated,
    };
  }
}

List<Department> parseDepartmentsData(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Department>((json) => Department.fromJson(json)).toList();
/*
products = res.data['products']
        .map<Product>(
          (item) => Product.fromJson(item),lib/database/models.dart
        )lib/database/models.dart
        .toList();
*/
}

class Test {
  int testID;
  String testName;
  int departmentID;
  String Description;
  String Estimates_Testing_Time;
  Map<String, dynamic> Test_Sample_Attributes;
  String Image;
  int Price;
  int Test_Counts;
  String TestCreated;

  Test({
    required this.testID,
    required this.testName,
    required this.departmentID,
    required this.Description,
    required this.Estimates_Testing_Time,
    required this.Test_Sample_Attributes,
    required this.Image,
    required this.Price,
    required this.Test_Counts,
    required this.TestCreated,
  });

  factory Test.fromJson(Map<String, dynamic> json) {
    return Test(
      testID: json["Test_ID"],
      testName: json["Name"],
      departmentID: json["Department_ID"],
      Description: json["Description"],
      Estimates_Testing_Time: json["Estimates_Testing_Time"],
      Test_Sample_Attributes: json["Test_Sample_Attributes"],
      Price: json["Price"],
      Image: json["Image"],
      Test_Counts: json["Test_Counts"],
      TestCreated: json["TestCreated"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Test_ID': testID,
      'Name': testName,
      'Department_ID': departmentID,
      'Description': Description,
      'Estimates_Testing_Time': Estimates_Testing_Time,
      'Test_Sample_Attributes': Test_Sample_Attributes,
      'Image': Image,
      'Price': Price,
      'Test_Counts': Test_Counts,
      'TestCreated': TestCreated,
    };
  }
}

List<Test> parseTestsData(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Test>((json) => Test.fromJson(json)).toList();
}

class Order {
  int Order_ID;
  int Test_ID;
  int User_ID;
  Map<String, dynamic> Test_Sample_Attributes;
  String Status;
  String OrderCompletionTime;
  int Total_Bill;

  Order({
    required this.Order_ID,
    required this.Test_ID,
    required this.User_ID,
    required this.OrderCompletionTime,
    required this.Status,
    required this.Test_Sample_Attributes,
    required this.Total_Bill,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      Order_ID: json["Order_ID"],
      Test_ID: json["Test_ID"],
      User_ID: json["User_ID"],
      OrderCompletionTime: json["OrderCompletionTime"],
      Status: json["Status"],
      Test_Sample_Attributes: json["Test_Sample_Attributes"],
      Total_Bill: json["Total_Bill"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Order_ID': Order_ID,
      'Test_ID': Test_ID,
      'User_ID': User_ID,
      'OrderCompletionTime': OrderCompletionTime,
      'Test_Sample_Attributes': Test_Sample_Attributes,
      'Status': Status,
      'Total_Bill': Total_Bill,
    };
  }
}

List<Order> parseOrdersData(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Order>((json) => Order.fromJson(json)).toList();
}

class Result {
  int Result_ID;
  int Order_ID;
  String ResultDescription;
  String Image;
  Map<String, dynamic> Details;

  Result({
    required this.Result_ID,
    required this.Order_ID,
    required this.ResultDescription,
    required this.Image,
    required this.Details,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      Order_ID: json["Order_ID"],
      Result_ID: json["Result_ID"],
      ResultDescription: json["ResultDescription"],
      Image: json["Image"],
      Details: json["Details"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Order_ID': Order_ID,
      'Result_ID': Result_ID,
      'ResultDescription': ResultDescription,
      'Image': Image,
      'Details': Details,
    };
  }
}

List<Result> parseResultsData(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Result>((json) => Result.fromJson(json)).toList();
}
