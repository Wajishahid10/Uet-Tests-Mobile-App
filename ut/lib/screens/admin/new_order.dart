import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uet_tests/constants.dart';
import 'package:uet_tests/screens/sign_in/sign_in_screen.dart';

class new_order extends StatefulWidget {
  static String routeName = "/new_order";
  new_order({Key? key}) : super(key: key);

  @override
  State<new_order> createState() => _new_orderState();
}

class _new_orderState extends State<new_order> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: kPrimaryColor.withOpacity(0.5),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [Text('New Orders')],
          )),
      body: Container(
          decoration: BoxDecoration(color: kPrimaryColor.withOpacity(0.5)),
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Order Details',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Product Details',
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
                                    'Product name:',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Text(
                                    'product_title',
                                    style: TextStyle(fontSize: 20),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'price per piece:',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Text(
                                    'price_per_piece',
                                    style: TextStyle(fontSize: 20),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Quantity:',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Text(
                                    'salequantity',
                                    style: TextStyle(fontSize: 20),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Total Price:',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Text(
                                    'price',
                                    // "Rs ${int.parse(data['price_per_piece']) * int.parse(data['salequantity'])}",
                                    style: TextStyle(fontSize: 20),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'User Details',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'User Name:',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Expanded(
                                    child: Text(
                                      'name',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'User Address:',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Text(
                                    'address',
                                    style: TextStyle(fontSize: 20),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'User Phone Number:',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Text(
                                    'phone no',
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
                                        // proceed_order(data);
                                        // deleteUser(document.id);
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            0.0, 3.0, 0.0, 10.0),
                                        child: Text(
                                          'Send to proceed',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          shape: StadiumBorder()),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        Get.toNamed(SignInScreen.routeName);
                                        // add_order_to_spam(data);
                                        // deleteUser(document.id);
                                        // // print(document.id);
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            0.0, 3.0, 0.0, 10.0),
                                        child: Text(
                                          'Send to Spam',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          shape: StadiumBorder()),
                                    ),
                                  ])
                            ],
                          ))),
                ))
          ])),
    );
  }
}
