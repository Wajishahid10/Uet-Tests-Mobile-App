import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uet_tests/constants.dart';
import 'package:uet_tests/database/models.dart';
import 'package:uet_tests/screens/department_gallery/components/gallery_categories.dart';
import 'package:uet_tests/screens/home/components/home_header.dart';
import 'package:uet_tests/size_config.dart';

import 'package:uet_tests/database/Product.dart';

Future<List<Department>> loadDepartment() async {
  ByteData image1 = await rootBundle.load('assets/cc1.jpg');
  String convertedImage1 = base64Encode(
      image1.buffer.asUint8List(image1.offsetInBytes, image1.lengthInBytes));
  ByteData image2 = await rootBundle.load('assets/ee2.jpg');
  String convertedImage2 = base64Encode(
      image2.buffer.asUint8List(image2.offsetInBytes, image2.lengthInBytes));

  final List<Department> demoDepartment = [
    Department(
        departmentID: 1,
        departmentName: 'Chemical',
        Display_Picture: convertedImage1,
        AdminID: 1,
        Contact_Number_toDisplay: '0312-34567890',
        Email_Address: 'Email_Address',
        DepartmentCreated: '02.2.2012'),
    Department(
        departmentID: 2,
        departmentName: 'Electrical Department',
        Display_Picture: convertedImage2,
        AdminID: 1,
        Contact_Number_toDisplay: '0312-34567890',
        Email_Address: 'Email_Address',
        DepartmentCreated: '02.2.2012'),
  ];

  return demoDepartment;
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  // late Future<List<Department>> demoDepartments = loadDepartment();
  List<Department>? demoDepartments;

  void s() async {
    demoDepartments = await loadDepartment();
  }

  @override
  Widget build(BuildContext context) {
    s();
    /*
    final List<Map> myProducts = List.generate(
        100000, (index) => {"id": index, "name": "Product $index"}).toList();
  */

    return demoDepartments == null
            ? CircularProgressIndicator()
            : SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: getProportionateScreenHeight(20)),
                      HomeHeader(),
                      SizedBox(height: getProportionateScreenHeight(20)),
                      SafeArea(
                        child: GridView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 20,
                          ),
                          itemCount: demoProducts.length,
                          itemBuilder: (BuildContext ctx, index) {
                            return GalleryCategories(
                                department: demoDepartments![index]);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )
        /**FutureBuilder(
      future: demoDepartments,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          List<Department> demoDepartmentsData =
              snapshot.data as List<Department>;
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: getProportionateScreenHeight(20)),
                  HomeHeader(),
                  SizedBox(height: getProportionateScreenHeight(20)),
                  SafeArea(
                    child: GridView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 20,
                      ),
                      itemCount: demoProducts.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return GalleryCategories(
                            department: demoDepartmentsData[index]);
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    )
     */
        ;
  }
}
