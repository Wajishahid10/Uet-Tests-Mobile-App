import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:uet_tests/components/shimmer.dart';
import 'package:uet_tests/database/apis.dart';
import 'package:uet_tests/database/models.dart';
import 'package:uet_tests/screens/department_gallery/department_gallery.dart';
import 'package:uet_tests/screens/gallery/gallery_screen.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  late Future<List<Department>> homeDepartments = homeScreenDepartements();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: homeDepartments,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          List<Department> homeDepartmentsData =
              snapshot.data as List<Department>;

          return Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: SectionTitle(
                  title: "Departments",
                  press: () {
                    Navigator.pushReplacementNamed(
                        context, DepartmentGalleryScreen.routeName);
                  },
                ),
              ),
              SizedBox(height: getProportionateScreenWidth(20)),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(
                      homeDepartmentsData.length,
                      (index) {
                        return Row(
                          children: [
                            CategoryCard(
                              department: homeDepartmentsData[index],
                              press: () {
                                Navigator.pushReplacementNamed(
                                    context, GalleryScreen.routeName,
                                    arguments: TestFetchArguments(
                                        DepartmentID: homeDepartmentsData[index]
                                            .Department_ID));
                              },
                            ),
                            SizedBox(width: getProportionateScreenWidth(20)),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.transparent,
              ),
            ],
          );
        }
        return CategoriesRowShimmer();
      },
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.department,
    required this.press,
  }) : super(key: key);

  final Department department;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: GestureDetector(
        onTap: press,
        child: Container(
          width: getProportionateScreenWidth(242),
          height: getProportionateScreenHeight(120),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Image.memory(
                  (base64Decode(
                    department.Display_Picture,
                  )),
                  fit: BoxFit.cover,
                  width: getProportionateScreenWidth(242),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF343434).withOpacity(0.4),
                        Color(0xFF343434).withOpacity(0.15),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(15.0),
                    vertical: getProportionateScreenHeight(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${department.departmentName}\n",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: getProportionateScreenWidth(18),
                          fontWeight: FontWeight.bold,
                          shadows: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "Contact us: ${department.Contact_Number_toDisplay}",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
