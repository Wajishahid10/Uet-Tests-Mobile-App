import 'dart:convert';

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
}
