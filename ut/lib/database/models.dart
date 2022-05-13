import 'dart:convert';

import 'package:flutter/cupertino.dart';

class Login_Manager {
  int? LoginID;
  String? GoogleSiginUID;
  String? Account_Type;

  Login_Manager({
    this.LoginID,
    this.GoogleSiginUID,
    this.Account_Type,
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
  int? UserID;
  String? userName;
  String? Display_Picture;
  String? Company;
  String? Contact_Number;
  String? Address;
  String? Email_Address;
  String? AccountCreated;

  User({
    this.UserID,
    this.userName,
    this.Display_Picture,
    this.Company,
    this.Contact_Number,
    this.Address,
    this.Email_Address,
    this.AccountCreated,
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
  int? AdminID;
  String? adminName;
  String? Display_Picture;
  String? Role;
  String? Contact_Number;
  String? Address;
  String? Email_Address;
  String? AccountCreated;

  Admin({
    this.AdminID,
    this.adminName,
    this.Display_Picture,
    this.Role,
    this.Contact_Number,
    this.Address,
    this.Email_Address,
    this.AccountCreated,
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
  int? departmentID;
  String? departmentName;
  String? Display_Picture;
  Admin? AdminID;
  String? Contact_Number_toDisplay;
  String? Email_Address;
  String? DepartmentCreated;

  Department({
    this.departmentID,
    this.departmentName,
    this.Display_Picture,
    this.AdminID,
    this.Contact_Number_toDisplay,
    this.Email_Address,
    this.DepartmentCreated,
  });

  factory Department.fromJson(Map<String, dynamic> json) {
    return Department(
      departmentID: json["departmentID"],
      departmentName: json["departmentName"],
      Display_Picture: json["Display_Picture"],
      AdminID: json["AdminID"],
      Contact_Number_toDisplay: json["Contact_Number_toDisplay"],
      Email_Address: json["Email_Address"],
      DepartmentCreated: json["DepartmentCreated"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'departmentID': departmentID,
      'departmentName': departmentName,
      'Display_Picture': Display_Picture,
      'Role': AdminID,
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
  int? testID;
  String? testName;
  int? departmentID;
  String? Description;
  String? Estimates_Testing_Time;
  Map<String, dynamic>? Test_Sample_Attributes;
  String? Image;
  int? Price;
  int? Test_Counts;
  String? TestCreated;

  Test({
    this.testID,
    this.testName,
    this.departmentID,
    this.Description,
    this.Estimates_Testing_Time,
    this.Test_Sample_Attributes,
    this.Image,
    this.Price,
    this.Test_Counts,
    this.TestCreated,
  });

  factory Test.fromJson(Map<String, dynamic> json) {
    return Test(
      testID: json["testID"],
      testName: json["testName"],
      departmentID: json["departmentID"],
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
      'testID': testID,
      'testName': testName,
      'departmentID': departmentID,
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

class Order {
  int? Order_ID;
  int? Test_ID;
  int? User_ID;
  Map<String, dynamic>? Test_Sample_Attributes;
  String? Status;
  String? OrderCompletionTime;
  int? Total_Bill;

  Order({
    this.Order_ID,
    this.Test_ID,
    this.User_ID,
    this.OrderCompletionTime,
    this.Status,
    this.Test_Sample_Attributes,
    this.Total_Bill,
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

class Result {
  int? Result_ID;
  int? Order_ID;
  String? ResultDescription;
  String? Image;
  Map<String, dynamic>? Details;

  Result({
    this.Result_ID,
    this.Order_ID,
    this.ResultDescription,
    this.Image,
    this.Details,
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
