import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uet_tests/constants.dart';
import 'package:uet_tests/database/apis.dart';
import 'package:uet_tests/database/models.dart';
import 'package:uet_tests/screens/home/components/home_header.dart';
import 'package:uet_tests/size_config.dart';

import 'package:uet_tests/screens/gallery/components/gallery_test_card.dart';
import 'package:uet_tests/database/Product.dart';

import '../../../main.dart';

Future<List<Test>> loadTest() async {
  List<Test> fetechedTests;
  ByteData image1 = await rootBundle.load('assets/images/sv1.jpg');
  String convertedImage1 = base64Encode(
      image1.buffer.asUint8List(image1.offsetInBytes, image1.lengthInBytes));
  ByteData image2 = await rootBundle.load('assets/images/lpl1.jpg');
  String convertedImage2 = base64Encode(
      image2.buffer.asUint8List(image2.offsetInBytes, image2.lengthInBytes));
  ByteData image3 = await rootBundle.load('assets/images/mc1.jpg');
  String convertedImage3 = base64Encode(
      image3.buffer.asUint8List(image3.offsetInBytes, image3.lengthInBytes));
  ByteData image4 = await rootBundle.load('assets/images/glap.png');
  String convertedImage4 = base64Encode(
      image4.buffer.asUint8List(image4.offsetInBytes, image4.lengthInBytes));
  fetechedTests = [
    Test(
      testID: 1,
      departmentID: 1,
      Test_Counts: 34,
      TestCreated: '30-01-2023',
      Image: convertedImage1,
      testName: "Sieve Analysis",
      Price: 764,
      Description:
          "A sieve analysis is an analytical technique used to determine the particle size distribution of a granular material with macroscopic granular sizes. The sieve analysis technique involves several layers of sieves with different grades of sieve opening sizes.",
      Estimates_Testing_Time: '48 hours',
      Test_Sample_Attributes: {
        'Attribute1': 'Diameter',
        'Attribute2': 'Width',
        'Attribute3': 'Weight',
      },
    ),
    Test(
      testID: 2,
      departmentID: 1,
      Test_Counts: 34,
      TestCreated: '30-01-2023',
      Image: convertedImage2,
      testName: "Liquid Limit and Plastic Limit Test",
      Price: 650,
      Description:
          "Liquid Limit (LL) is the water content at which soil changes from a plastic to a liquid state when the soil specimen is just fluid enough for a groove to close when jarred in a specified manner. Plastic Limit (PL) is the water content at the change from a plastic to a semi-solid state.",
      Estimates_Testing_Time: '48 hours',
      Test_Sample_Attributes: {
        'Attribute1': 'Diameter',
        'Attribute2': 'Width',
        'Attribute3': 'Weight',
      },
    ),
    Test(
      testID: 3,
      departmentID: 1,
      Test_Counts: 34,
      TestCreated: '30-01-2023',
      Image: convertedImage3,
      testName: "Moisture Content (Oven Dry Method)",
      Price: 684,
      Description:
          "Moisture content is expressed as a percentage of the oven-dry weight of the soil. For example, if a 212-gram moist soil sample weighs 197 grams after drying, the percentage of moisture is calculated by dividing 197 into 15, which gives 7.6 percent.",
      Estimates_Testing_Time: '76 hours',
      Test_Sample_Attributes: {
        'Attribute1': 'Diameter',
        'Attribute2': 'Width',
        'Attribute3': 'Weight',
      },
    ),
    Test(
      testID: 4,
      departmentID: 1,
      Test_Counts: 34,
      TestCreated: '30-01-2023',
      Image: convertedImage4,
      testName: "Sieve",
      Price: 960,
      Description:
          "Moisture content is expressed as a percentage of the oven-dry weight of the soil. For example, if a 212-gram moist soil sample weighs 197 grams after drying, the percentage of moisture is calculated by dividing 197 into 15, which gives 7.6 percent.",
      Estimates_Testing_Time: '36 hours',
      Test_Sample_Attributes: {
        'Attribute1': 'Diameter',
        'Attribute2': 'Width',
        'Attribute3': 'Weight',
      },
    ),
  ];
  return fetechedTests;
}

Future<List<Test>> fetchTests(int DepartmentID) async {
  if (DepartmentID == -1) {
    return popularTests();
  }
  if (DepartmentID == -2) {
    return previousTests(await sharedPreferences.getInt("user_ID")!);
  } else {
    return specificDepartment_Tests(DepartmentID);
  }
}

class Body extends StatelessWidget {
  final int DepartmentID;
  const Body({Key? key, required this.DepartmentID}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Future<List<Test>> fetechedTests = fetchTests(DepartmentID);
    /*
    final List<Map> myProducts = List.generate(
        100000, (index) => {"id": index, "name": "Product $index"}).toList();
  */

    return FutureBuilder(
      future: fetechedTests,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          List<Test> fetechedTestsData = snapshot.data as List<Test>;

          if (fetechedTestsData.length == 0) {
            return Center(
              child: Text('No Test Found in This Department'),
            );
          } else {
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
                        itemCount: fetechedTestsData.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return GalleryTestCard(
                              test: fetechedTestsData[index]);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
