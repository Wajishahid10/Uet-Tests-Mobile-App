import 'dart:convert';
// import 'dart:html';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'package:flutter/material.dart';
import 'package:uet_tests/constants.dart';
import 'package:uet_tests/database/models.dart';
import 'package:uet_tests/size_config.dart';

class show_dept_admin extends StatefulWidget {
  static String routeName = "/show_dept_admin";
  show_dept_admin({Key? key}) : super(key: key);

  @override
  State<show_dept_admin> createState() => _show_dept_adminState();
}

class _show_dept_adminState extends State<show_dept_admin> {
  late Future<List<admin>> adminList;

  Client client = http.Client();
  @override
  void initState() {
    super.initState();
    adminList = fetchadmin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: kPrimaryColor.withOpacity(0.5),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [Text('Dept Admins')],
          )),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: FutureBuilder<List<admin>>(
          future: adminList,
          builder: (context, abc) {
            if (abc.hasData) {
              return ListView.builder(
                itemCount: abc.data!.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration:
                        BoxDecoration(color: kPrimaryColor.withOpacity(0.5)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(30),
                                topRight: Radius.circular(30),
                                bottomLeft: Radius.circular(30),
                                topLeft: Radius.circular(30)),
                          ),
                          elevation: 10,
                          color: Colors.white,
                          child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 18,
                                  ),
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        'https://picsum.photos/id/237/200/300'),
                                    radius: 50,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Name:',
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black),
                                      ),
                                      Text(
                                        '${abc.data![index].adminName}',
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Contact:',
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black),
                                      ),
                                      Text(
                                        '${abc.data![index].Contact_Number}',
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Email:',
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black),
                                      ),
                                      Text(
                                        '${abc.data![index].Email_Address}',
                                        // "Rs ${int.parse(data['price_per_piece']) * int.parse(data['salequantity'])}",
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Address:',
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black),
                                      ),
                                      Text(
                                        '${abc.data![index].Address}',
                                        // "Rs ${int.parse(data['price_per_piece']) * int.parse(data['salequantity'])}",
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            // proceed_order(data);
                                            // deleteUser(document.id);
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                0.0, 3.0, 0.0, 10.0),
                                            child: Row(
                                              children: [
                                                Text(
                                                  'Edit',
                                                  style: TextStyle(
                                                      fontSize:
                                                          getProportionateScreenWidth(
                                                              15)),
                                                ),
                                                Icon(
                                                  Icons.edit,
                                                  color: Colors.white,
                                                )
                                              ],
                                            ),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                              shape: StadiumBorder()),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            // add_order_to_spam(data);
                                            // deleteUser(document.id);
                                            // // print(document.id);
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                0.0, 3.0, 0.0, 10.0),
                                            child: Text(
                                              'Delete',
                                              style: TextStyle(
                                                  fontSize:
                                                      getProportionateScreenWidth(
                                                          15)),
                                            ),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                              shape: StadiumBorder()),
                                        ),
                                      ]),
                                ],
                              ))),
                    ),
                  );
                },
              );
              //Text(abc.data.length.toString());
            } else if (abc.hasError) {
              return Text("tt:${abc.error}");
            }

            // By default, it show a loading spinner.
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

List<admin> parseData(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<admin>((json) => admin.fromJson(json)).toList();
}

var url = Uri.parse('https://uet-tests.herokuapp.com/api/admin');
Future<List<admin>> fetchadmin() async {
  //final response = await http.get('https://pcc.edu.pk/mad/consultants.json');
  var response = await http.get(url);
  if (response.statusCode == 200) {
    // If the call to the server was successful (returns OK), parse the JSON.
    //var data = json.decode(response.body);

    return parseData(response.body);
  } else {
    // If that call was not successful (response was unexpected), it throw an error.
    throw Exception('Failed to load data');
  }
}

class admin {
  final int AdminID;
  final String adminName;
  final String Display_Picture;
  final String Role;
  final String Contact_Number;
  final String Address;
  final String Email_Address;
  final String AccountCreated;

  admin(
      {required this.AdminID,
      required this.adminName,
      required this.Display_Picture,
      required this.Role,
      required this.Address,
      required this.Email_Address,
      required this.Contact_Number,
      required this.AccountCreated});

  factory admin.fromJson(Map<String, dynamic> json) {
    return admin(
      AdminID: json['AdminID'],
      adminName: json['adminName'],
      Display_Picture: json['Display_Picture'],
      Role: json['Role'],
      Address: json['Address'],
      Email_Address: json['Email_Address'],
      Contact_Number: json['Contact_Number'],
      AccountCreated: json['AccountCreated'],
    );
  }
}
