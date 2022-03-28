class Login_Manager {
  String? GoogleSiginUID;
  String? Account_Type;

  Login_Manager({
    this.GoogleSiginUID,
    this.Account_Type,
  });

  Map<String, dynamic> toMap() {
    return {
      'GoogleSiginUID': GoogleSiginUID,
      'Account_Type': Account_Type,
    };
  }

  @override
  String toString() {
    return 'Login_Manager{GoogleSiginUID: $GoogleSiginUID Account_Type: $Account_Type}';
  }
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
