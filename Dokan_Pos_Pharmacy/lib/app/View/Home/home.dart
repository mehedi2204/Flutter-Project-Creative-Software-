import 'package:dokan_pos/app/View/Collection/invoice_print_view.dart';
import 'package:dokan_pos/app/constraints/custom_color.dart';
import 'package:dokan_pos/app/constraints/styling.dart';
import 'package:dokan_pos/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    //final width = MediaQuery.of(context).size.width;
    //final height = MediaQuery.of(context).size.height;

    double progress = 0.6;

    String dropdownvalue = 'Select Item';

    // List of items in our dropdown menu
    var items = [
      'Select Item',
      'Item 1',
      'Item 2',
      'Item 3',
      'Item 4',
    ];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: CustomColor.backgroundColor,
          title: Text('Dokan Pos Pharmacy', style: TextStyle(fontWeight: FontWeight.bold)),
          centerTitle: true,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {

              },
              icon: Icon(Icons.more_vert),
            )
          ]
        ),
        body: ListView(
          children: [
            Stack(
              clipBehavior: Clip.none,
              //alignment: Alignment.bottomCenter,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: CustomColor.backgroundColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(150),
                        bottomRight: Radius.circular(150),
                      )),
                  height: 250,
                  child: Row(children: [
                    Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                        color: Colors.orange.shade200.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(90),
                      ),
                    ),
                    SizedBox(width: 110),
                    Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                        color: Colors.orange.shade200.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(90),
                      ),
                    ),
                  ]
                  ),
                ),

                Positioned(
                  // bottom: -420,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 28),
                    child: Container(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            //mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 30),
                                Row(children: [
                                  Text(
                                    "Dashboard",
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ]),
                                Row(
                                  children: [
                                    Container(
                                      height: 35,
                                      width: 110,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                          // Initial Value
                                          value: dropdownvalue,

                                          // Down Arrow Icon
                                          icon:
                                          const Icon(Icons.keyboard_arrow_down),

                                          // Array list of items
                                          items: items.map((String items) {
                                            return DropdownMenuItem(
                                              value: items,
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Text(
                                                  items,
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                          // After selecting the desired option,it will
                                          // change button value to selected value
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              dropdownvalue = newValue!;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 120),
                                    Container(
                                      width: 100,
                                      height: 100,
                                      child: Stack(
                                        children: [
                                          CircularProgressIndicator(
                                            value: progress,
                                            strokeWidth: 3,
                                            backgroundColor: Colors.orange.shade200
                                                .withOpacity(0.5),
                                            valueColor:
                                            AlwaysStoppedAnimation<Color>(Colors
                                                .orange.shade100
                                                .withOpacity(1.0)),
                                          ),
                                          // Center(
                                          //   child: Text(
                                          //     '${(progress * 100).toInt()}%',
                                          //     style: TextStyle(
                                          //       fontSize: 18,
                                          //       //fontWeight: FontWeight.bold,
                                          //       color: Colors.orange.shade100.withOpacity(0.9),
                                          //     ),
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed(Routes.SELL);
                                    },
                                    child: Container(
                                      width: 150,
                                      height: 150,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey.shade500,
                                                blurRadius: 3,
                                                spreadRadius: 0,
                                                blurStyle: BlurStyle.solid)
                                          ]),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: 60,
                                                width: 60,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                    BorderRadius.circular(90),
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: Colors.grey.shade500,
                                                          blurRadius: 3,
                                                          spreadRadius: 0,
                                                          blurStyle: BlurStyle.solid)
                                                    ]),
                                                child: CircleAvatar(
                                                    backgroundImage: AssetImage(
                                                      'assets/calculater.gif',
                                                    )),
                                              ),
                                              SizedBox(height: 10),
                                              Text(
                                                "Sell & Earn",
                                                style: getBoldStyle(
                                                    color: Colors.black54,
                                                    fontSize: 20),
                                              ),
                                              SizedBox(height: 15),
                                              Container(
                                                width: 150,
                                                height: 5,
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(10)),
                                                  child: LinearProgressIndicator(
                                                    value: 1,
                                                    valueColor:
                                                    AlwaysStoppedAnimation<Color>(
                                                        Color(0xff1372ea)),
                                                    backgroundColor:
                                                    Color(0xffD6D6D6),
                                                  ),
                                                ),
                                              )
                                            ]),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  GestureDetector(
                                    onTap: () {

                                    },
                                    child: Container(
                                      width: 150,
                                      height: 150,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey.shade500,
                                                blurRadius: 3,
                                                spreadRadius: 0,
                                                blurStyle: BlurStyle.solid)
                                          ]),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: 60,
                                                width: 60,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                    BorderRadius.circular(90),
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: Colors.grey.shade500,
                                                          blurRadius: 3,
                                                          spreadRadius: 0,
                                                          blurStyle: BlurStyle.solid)
                                                    ]),
                                                child: CircleAvatar(
                                                    backgroundImage: AssetImage(
                                                      'assets/due_book.gif',
                                                    )),
                                              ),
                                              SizedBox(height: 10),
                                              Text(
                                                "Due book",
                                                style: getBoldStyle(
                                                    color: Colors.black54,
                                                    fontSize: 20),
                                              ),
                                              SizedBox(height: 15),
                                              Container(
                                                width: 150,
                                                height: 5,
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(10)),
                                                  child: LinearProgressIndicator(
                                                    value: 1,
                                                    valueColor:
                                                    AlwaysStoppedAnimation<Color>(
                                                        Color(0xff7dc3cd)),
                                                    backgroundColor:
                                                    Color(0xffD6D6D6),
                                                  ),
                                                ),
                                              )
                                            ]),
                                      ),
                                    ),
                                  ),
                                ]),
                                SizedBox(height: 20),
                                Row(children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(InvoicePrintView());
                                    },
                                    child: Container(
                                      width: 150,
                                      height: 150,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey.shade500,
                                                blurRadius: 3,
                                                spreadRadius: 0,
                                                blurStyle: BlurStyle.solid)
                                          ]),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: 60,
                                                width: 60,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                    BorderRadius.circular(90),
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: Colors.grey.shade500,
                                                          blurRadius: 3,
                                                          spreadRadius: 0,
                                                          blurStyle: BlurStyle.solid)
                                                    ]),
                                                child: CircleAvatar(
                                                    backgroundImage: AssetImage(
                                                      'assets/digital_Money.gif',
                                                    )),
                                              ),
                                              SizedBox(height: 10),
                                              Text(
                                                "Collection",
                                                style: getBoldStyle(
                                                    color: Colors.black54,
                                                    fontSize: 20),
                                              ),
                                              SizedBox(height: 15),
                                              Container(
                                                width: 150,
                                                height: 5,
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(10)),
                                                  child: LinearProgressIndicator(
                                                    value: 1,
                                                    valueColor:
                                                    AlwaysStoppedAnimation<Color>(
                                                        Color(0xffec7501)),
                                                    backgroundColor:
                                                    Color(0xffD6D6D6),
                                                  ),
                                                ),
                                              )
                                            ]),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  Container(
                                    width: 150,
                                    height: 150,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey.shade500,
                                              blurRadius: 3,
                                              spreadRadius: 0,
                                              blurStyle: BlurStyle.solid)
                                        ]),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 60,
                                              width: 60,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                  BorderRadius.circular(90),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.grey.shade500,
                                                        blurRadius: 3,
                                                        spreadRadius: 0,
                                                        blurStyle: BlurStyle.solid)
                                                  ]),
                                              child: CircleAvatar(
                                                  backgroundImage: AssetImage(
                                                    'assets/shop.png',
                                                  )),
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              "Online Shop",
                                              style: getBoldStyle(
                                                  color: Colors.black54,
                                                  fontSize: 20),
                                            ),
                                            SizedBox(height: 15),
                                            Container(
                                              width: 150,
                                              height: 5,
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                                child: LinearProgressIndicator(
                                                  value: 1,
                                                  valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                      Color(0xffcdcdcd)),
                                                  backgroundColor:
                                                  Color(0xffD6D6D6),
                                                ),
                                              ),
                                            )
                                          ]),
                                    ),
                                  ),
                                ]),
                                SizedBox(height: 20),
                                Row(children: [
                                  Container(
                                    width: 150,
                                    height: 150,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey.shade500,
                                              blurRadius: 3,
                                              spreadRadius: 0,
                                              blurStyle: BlurStyle.solid)
                                        ]),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 60,
                                              width: 60,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                  BorderRadius.circular(90),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.grey.shade500,
                                                        blurRadius: 3,
                                                        spreadRadius: 0,
                                                        blurStyle: BlurStyle.solid)
                                                  ]),
                                              child: CircleAvatar(
                                                  backgroundImage: AssetImage(
                                                    'assets/due_book.gif',
                                                  )),
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              "Due book",
                                              style: getBoldStyle(
                                                  color: Colors.black54,
                                                  fontSize: 20),
                                            ),
                                            SizedBox(height: 15),
                                            Container(
                                              width: 150,
                                              height: 5,
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                                child: LinearProgressIndicator(
                                                  value: 1,
                                                  valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                      Color(0xff7dc3cd)),
                                                  backgroundColor:
                                                  Color(0xffD6D6D6),
                                                ),
                                              ),
                                            )
                                          ]),
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed(Routes.SETTINGS);
                                    },
                                    child: Container(
                                      width: 150,
                                      height: 150,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey.shade500,
                                                blurRadius: 3,
                                                spreadRadius: 0,
                                                blurStyle: BlurStyle.solid)
                                          ]),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: 60,
                                                width: 60,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                    BorderRadius.circular(90),
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color:
                                                          Colors.grey.shade500,
                                                          blurRadius: 3,
                                                          spreadRadius: 0,
                                                          blurStyle:
                                                          BlurStyle.solid)
                                                    ]),
                                                child: Icon(Icons.settings,
                                                    size: 40,
                                                    color: Colors.black
                                                        .withOpacity(0.7)),
                                              ),
                                              SizedBox(height: 10),
                                              Text(
                                                "Settings",
                                                style: getBoldStyle(
                                                    color: Colors.black54,
                                                    fontSize: 20),
                                              ),
                                              SizedBox(height: 15),
                                              Container(
                                                width: 150,
                                                height: 5,
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(10)),
                                                  child: LinearProgressIndicator(
                                                    value: 1,
                                                    valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                        Colors.black
                                                            .withOpacity(0.7)),
                                                    backgroundColor:
                                                    Color(0xffD6D6D6),
                                                  ),
                                                ),
                                              )
                                            ]),
                                      ),
                                    ),
                                  ),
                                ]),
                              ]),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ]
        )
      ),
    );
  }
}
