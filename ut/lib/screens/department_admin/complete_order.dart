import 'dart:convert';
// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uet_tests/constants.dart';
import 'package:uet_tests/database/apis.dart';
import 'package:uet_tests/database/models.dart';
import 'package:uet_tests/screens/department_admin/admin_dasboard.dart';
import 'package:uet_tests/screens/profile/components/profile_menu.dart';
import 'package:uet_tests/size_config.dart';

import 'package:http/http.dart' as http;

class complete_order extends StatefulWidget {
  static String routeName = "/complete_order";
  complete_order({Key? key}) : super(key: key);

  @override
  State<complete_order> createState() => _complete_orderState();
}

class _complete_orderState extends State<complete_order> {
  late Future<List<completeOrder>> completeOrderList;

  http.Client client = http.Client();
  @override
  void initState() {
    super.initState();
    completeOrderList = fetchcompleteOrder();
  }

  void del(int id) {
    String str_id = id.toString();
    var deleteUrl = Uri.parse(
        'https://uet-tests.herokuapp.com/api/completedOrderDP/' + str_id);
    client.delete(deleteUrl);
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
            children: [Text('Complete Orders')],
          )),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: FutureBuilder<List<completeOrder>>(
          future: completeOrderList,
          builder: (context, abc) {
            if (abc.hasData) {
              return ListView.builder(
                itemCount: abc.data!.length,
                itemBuilder: (context, index) {
                  return Container(
                      // decoration: BoxDecoration(color: kPrimaryColor.withOpacity(0.5)),
                      child: Column(children: [
                    //order detail container
                    Container(
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
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
                                        height: 20,
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Order Details',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            'User no:',
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          Text(
                                            '${abc.data![index].User_ID}',
                                            style: TextStyle(fontSize: 20),
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            'Test no:',
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          Text(
                                            '${abc.data![index].Test_ID}',
                                            style: TextStyle(fontSize: 20),
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            'Completion Time:',
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          Text(
                                            '${abc.data![index].OrderCompletionTime}',
                                            style: TextStyle(fontSize: 20),
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            'Total Bill:',
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          Text(
                                            '${abc.data![index].Total_Bill}',
                                            style: TextStyle(fontSize: 20),
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            'Status:',
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          Text(
                                            '${abc.data![index].Status}',
                                            style: TextStyle(fontSize: 20),
                                          )
                                        ],
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
                                                del(abc.data![index]
                                                    .CompletedOrder_ID);
                                                Get.toNamed(
                                                    dashboard.routeName);

                                                // add_order_to_spam(data);
                                                // deleteUser(document.id);
                                                // // print(document.id);
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    0.0, 3.0, 0.0, 10.0),
                                                child: Text(
                                                  'Delete Order',
                                                  style: TextStyle(
                                                      fontSize:
                                                          getProportionateScreenWidth(
                                                              15)),
                                                ),
                                              ),
                                              style: ElevatedButton.styleFrom(
                                                  shape: StadiumBorder()),
                                            ),
                                          ])
                                    ],
                                  ))),
                        ))
                  ]));
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

  List<completeOrder> parseData(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<completeOrder>((json) => completeOrder.fromJson(json))
        .toList();
  }

  var url = Uri.parse('https://uet-tests.herokuapp.com/api/completedOrder');
  Future<List<completeOrder>> fetchcompleteOrder() async {
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
}
