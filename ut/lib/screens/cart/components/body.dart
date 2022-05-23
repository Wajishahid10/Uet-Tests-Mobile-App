import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uet_tests/database/apis.dart';
import 'package:uet_tests/database/models.dart';

import '../../../size_config.dart';
import 'cart_card.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

Future<List<Test>> loadTest() async {
  List<Test> demoTests;
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
  demoTests = [
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
  return demoTests;
}

class _BodyState extends State<Body> {
  late Future<List<List<Object>>> fetchedOrders = ordersofUser();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchedOrders,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          List<List<Object>> fetchedTestsData =
              snapshot.data as List<List<Object>>;

          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: ListView.builder(
              itemCount: fetchedTestsData.length,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Dismissible(
                  key: Key(index.toString()),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    setState(() {
                      fetchedTestsData.removeAt(index);
                    });
                  },
                  background: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFE6E6),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Spacer(),
                        Text('Cancel Order'),
                        SizedBox(
                          width: getProportionateScreenWidth(5),
                        ),
                        SvgPicture.asset("assets/icons/Trash.svg"),
                      ],
                    ),
                  ),
                  child: OrderCard(totalorder: fetchedTestsData[index]),
                ),
              ),
            ),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

/**
class _BodyState extends State<Body> {
  List<Test>? demoTests;

  void ajeeb() async {
    demoTests = await loadTest();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ajeeb();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      ajeeb();
    });
    if (demoTests != null) {
      setState(() {});
    }
    return demoTests == null
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: ListView.builder(
              itemCount: demoCarts.length,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Dismissible(
                  key: Key(demoCarts[index].product.id.toString()),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    setState(() {
                      demoCarts.removeAt(index);
                    });
                  },
                  background: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFE6E6),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Text('Cancel Order'),
                        Spacer(),
                        SvgPicture.asset("assets/icons/Trash.svg"),
                      ],
                    ),
                  ),
                  child: OrderCard(order: demoTests![index]),
                ),
              ),
            ),
          );
  }
}
 */