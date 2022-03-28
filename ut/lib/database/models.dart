import 'dart:convert';

class Login_Manager {
  int? loginID;
  String? GoogleSiginUID;
  String? Account_Type;

  Login_Manager({
    this.loginID,
    this.GoogleSiginUID,
    this.Account_Type,
  });

  factory Login_Manager.fromJson(Map<String, dynamic> json) {
    return Login_Manager(
      loginID: json["loginID"],
      GoogleSiginUID: json["GoogleSiginUID"],
      Account_Type: json["Account_Type"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'loginID': loginID,
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
  String? DisplayPicture_Url;
  String? Company;
  String? ContactNumber;
  String? Address;
  String? Email_Address;
  String? AccountCreated;

  User({
    this.UserID,
    this.userName,
    this.DisplayPicture_Url,
    this.Company,
    this.ContactNumber,
    this.Address,
    this.Email_Address,
    this.AccountCreated,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      UserID: json["UserID"],
      userName: json["userName"],
      DisplayPicture_Url: json["DisplayPicture_Url"],
      Company: json["Company"],
      ContactNumber: json["ContactNumber"],
      Address: json["Address"],
      Email_Address: json["Email_Address"],
      AccountCreated: json["AccountCreated"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'UserID': UserID,
      'userName': userName,
      'DisplayPicture_Url': DisplayPicture_Url,
      'Company': Company,
      'Address': Address,
      'ContactNumber': ContactNumber,
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
  String? DisplayPicture_Url;
  String? Role;
  String? ContactNumber;
  String? Address;
  String? Email_Address;
  String? AccountCreated;

  Admin({
    this.AdminID,
    this.adminName,
    this.DisplayPicture_Url,
    this.Role,
    this.ContactNumber,
    this.Address,
    this.Email_Address,
    this.AccountCreated,
  });

  factory Admin.fromJson(Map<String, dynamic> json) {
    return Admin(
      AdminID: json["AdminID"],
      adminName: json["adminName"],
      DisplayPicture_Url: json["DisplayPicture_Url"],
      Role: json["Role"],
      ContactNumber: json["ContactNumber"],
      Address: json["Address"],
      Email_Address: json["Email_Address"],
      AccountCreated: json["AccountCreated"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'AdminID': AdminID,
      'adminName': adminName,
      'DisplayPicture_Url': DisplayPicture_Url,
      'Role': Role,
      'Address': Address,
      'ContactNumber': ContactNumber,
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
  String? DisplayPicture_Url;
  Admin? AdminID;
  String? ContactNumber;
  String? Email_Address;
  String? DepartmentCreated;

  Department({
    this.departmentID,
    this.departmentName,
    this.DisplayPicture_Url,
    this.AdminID,
    this.ContactNumber,
    this.Email_Address,
    this.DepartmentCreated,
  });

  factory Department.fromJson(Map<String, dynamic> json) {
    return Department(
      departmentID: json["departmentID"],
      departmentName: json["departmentName"],
      DisplayPicture_Url: json["DisplayPicture_Url"],
      AdminID: json["AdminID"],
      ContactNumber: json["ContactNumber"],
      Email_Address: json["Email_Address"],
      DepartmentCreated: json["DepartmentCreated"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'departmentID': departmentID,
      'departmentName': departmentName,
      'DisplayPicture_Url': DisplayPicture_Url,
      'Role': AdminID,
      'ContactNumber': ContactNumber,
      'Email_Address': Email_Address,
      'DepartmentCreated': DepartmentCreated,
    };
  }
}

List<Department> parseDepartmentsData(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Department>((json) => Department.fromJson(json)).toList();
}
