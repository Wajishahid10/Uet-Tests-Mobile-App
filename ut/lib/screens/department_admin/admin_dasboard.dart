import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uet_tests/constants.dart';
import 'package:uet_tests/database/models.dart';
import 'package:uet_tests/screens/department_admin/add_department.dart';
import 'package:uet_tests/screens/department_admin/add_department_admin.dart';
import 'package:uet_tests/screens/department_admin/add_test.dart';
import 'package:uet_tests/screens/department_admin/complete_order.dart';
import 'package:uet_tests/screens/department_admin/new_order.dart';
import 'package:uet_tests/screens/department_admin/show_dept_admin.dart';

class dashboard extends StatefulWidget {
  // static var routeName;
  static String routeName = "/dashboard";

  dashboard({Key? key}) : super(key: key);

  @override
  _dashboardState createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // app bar code is here
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: kPrimaryColor.withOpacity(0.5),
        title: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 14.0, 0.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Text(
                " Welcome Admin",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              // Text(
              //   " Admin",
              //   style: TextStyle(
              //       color: Colors.black,
              //       fontSize: 25,
              //       fontWeight: FontWeight.bold),
              // ),
            ],
          ),
        ),
      ),

      // body widget is define below
      body: _body(),
      // drawer widget is define on drawer file
      // drawer: MyAdminDrawer(),
    );
  }
}

// body widget
class _body extends StatefulWidget {
  _body({Key? key}) : super(key: key);

  @override
  __bodyState createState() => __bodyState();
}

class Choice {
  final String title;
  final IconData icon;
  const Choice({required this.title, required this.icon});
}

// list to use as data in grid element
const List<Choice> choices = <Choice>[
  Choice(title: 'New Orders', icon: Icons.new_releases_outlined),
  // Choice(title: 'Orders in progress', icon: Icons.work_outline_outlined),
  Choice(title: 'Complete Order', icon: Icons.star_outline_sharp),
  Choice(title: 'Add Department', icon: Icons.dangerous_outlined),
  Choice(title: 'Add Test', icon: Icons.add),

  Choice(title: 'Add Dept Admin', icon: Icons.add),
  Choice(title: 'Show Dept Admin', icon: Icons.list_alt)
  // Choice(title: 'Statistics', icon: Icons.message_outlined),
];

class __bodyState extends State<_body> {
  late final Choice choice;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        // color: Colors.grey.withOpacity(0.1),
        color: kPrimaryColor.withOpacity(0.5),
        // color: Color(0xffFDD9E0),
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 8.0,
              children: List.generate(choices.length, (index) {
                return Center(
                  // selectCard widget is define below
                  child: SelectCard(choice: choices[index]),
                );
              })),
        ));
  }
}

class SelectCard extends StatelessWidget {
  const SelectCard({Key? key, required this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    // final TextStyle? textStyle = Theme.of(context).textTheme.display1;
    return GestureDetector(
      onTap: () {
        if (choice.title == 'New Orders') {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => New_orders()),
          // );
          Get.toNamed(new_order.routeName);
        } else if (choice.title == 'Orders in progress') {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => Orders_in_progress()),
          // );
        } else if (choice.title == 'Complete Order') {
          Get.toNamed(complete_order.routeName);
        } else if (choice.title == 'Add Department') {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => Spam_order()),
          // );

          Get.toNamed(add_department.routeName);
        } else if (choice.title == 'Add Test') {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => add_products()),
          // );
          Get.toNamed(add_test.routeName);
        } else if (choice.title == 'Statistics') {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => Statistics()),
          // );
        } else if (choice.title == 'Add Dept Admin') {
          Get.toNamed(add_dept_admin.routeName);
        } else if (choice.title == 'Show Dept Admin') {
          Get.toNamed(show_dept_admin.routeName);
        }
      },
      child: Card(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(100))),
          elevation: 15,
          color: Colors.white,
          child: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                      child: Icon(choice.icon,
                          size: 50.0, color: kPrimaryColor.withOpacity(0.7))),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      choice.title,
                      style: const TextStyle(color: Colors.black, fontSize: 23),
                    ),
                  ),
                ]),
          )),
    );
  }
}
