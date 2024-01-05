import 'package:flutter/material.dart';

class CustomerDashboardItem extends StatefulWidget {
  const CustomerDashboardItem({Key? key}) : super(key: key);

  @override
  State<CustomerDashboardItem> createState() => _CustomerDashboardItemState();
}

class _CustomerDashboardItemState extends State<CustomerDashboardItem> {
  @override
  Widget build(BuildContext context) {
    int _currentIndex = 0;
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        body: ListView(children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(children: [
              SizedBox(
                height: 20,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Colors.lightBlueAccent[50],
                                  borderRadius: BorderRadius.circular(60),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black54,
                                        offset: Offset(-1, 1),
                                        spreadRadius: .5)
                                  ],
                                ),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Image.asset('assets/handshake.png',
                                      width: 25, height: 25),
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Proposal',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Colors.blueGrey[50],
                                  borderRadius: BorderRadius.circular(60),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black54,
                                        offset: Offset(-1, 1),
                                        spreadRadius: .5)
                                  ],
                                ),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Image.asset('assets/bill.png',
                                      width: 30, height: 30),
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Invoice',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Colors.cyan[100],
                                  borderRadius: BorderRadius.circular(60),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black54,
                                        offset: Offset(-1, 1),
                                        spreadRadius: .5)
                                  ],
                                ),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Image.asset('assets/money.png',
                                      width: 25, height: 25),
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Collection',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ]),
              ]),
              SizedBox(
                height: 30,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                SizedBox(
                  width: 35,
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Colors.teal[200],
                                  borderRadius: BorderRadius.circular(60),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black54,
                                        offset: Offset(-1, 1),
                                        spreadRadius: .5)
                                  ],
                                ),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Image.asset('assets/subscription.png',
                                      width: 25, height: 25),
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Subscription',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
              ]),
              SizedBox(
                height: 20,
              ),
              Divider(
                thickness: 1,
                color: Colors.black54,
                indent: 10,
                endIndent: 10,
              ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, bottom: 10.0),
            child: Text(
              'Recent Activities',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              textAlign: TextAlign.start,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Column(children: [
              Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black54,
                          offset: Offset(0, 0),
                          spreadRadius: .5)
                    ],
                  ),
                  child: TabBar(
                    labelStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: Colors.black,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorPadding: EdgeInsets.all(5),
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blueGrey.withOpacity(.5),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.white60,
                            offset: Offset(1, 1),
                            spreadRadius: .5)
                      ],
                    ),
                    indicatorWeight: 0,
                    isScrollable: true,
                    tabs: [
                      SizedBox(
                        child: Tab(
                          text: 'Proposal',
                        ),
                        width: MediaQuery.of(context).size.width * .2,
                      ),
                    ],
                  )),
              SizedBox(
                height: 1,
              ),
              Container(
                  height: MediaQuery.of(context).size.height * .4,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black54,
                          offset: Offset(0, 0),
                          spreadRadius: .5,
                        )
                      ]
                  ),
                  child: TabBarView(children: [
                    Container(
                      //height: 500,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: ListView(children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 0.0, right: 0.0),
                          child: Container(
                              //height: 60,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Row(children: [
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Prposal 1',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                    FontWeight.w500),
                                              ),
                                              Text(
                                                'From: Rajon, 01942-671947',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                ),
                                              ),
                                              Text(
                                                'Proposal details here',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ]),
                                      ),
                                      Container(
                                        child: Row(children: [
                                          PopupMenuButton(
                                              itemBuilder: (_) => [
                                                PopupMenuItem(
                                                    child: Text('Call'),
                                                    value: 1),
                                                PopupMenuItem(
                                                    child: Text('Message'),
                                                    value: 2),
                                                PopupMenuItem(
                                                    child:
                                                    Text('Video Call'),
                                                    value: 3),
                                              ])
                                        ]),
                                      ),
                                    ]),
                              )),
                        ),
                        Divider(thickness: .5, color: Colors.black26),
                        Padding(
                          padding: const EdgeInsets.only(left: 0.0, right: 0.0),
                          child: Container(
                            //height: 60,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Row(children: [
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Prposal 2',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                    FontWeight.w500),
                                              ),
                                              Text(
                                                'From: Shakil Khan, 01942-671947',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                              Text(
                                                'Proposal details here',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ]),
                                      ),
                                      Container(
                                        child: Row(children: [
                                          PopupMenuButton(
                                              itemBuilder: (_) => [
                                                PopupMenuItem(
                                                    child: Text('Call'),
                                                    value: 1),
                                                PopupMenuItem(
                                                    child: Text('Message'),
                                                    value: 2),
                                                PopupMenuItem(
                                                    child:
                                                    Text('Video Call'),
                                                    value: 3),
                                              ])
                                        ]),
                                      ),
                                    ]),
                              )),
                        ),
                        Divider(thickness: .5, color: Colors.black26),
                        Padding(
                          padding: const EdgeInsets.only(left: 0.0, right: 0.0),
                          child: Container(
                            //height: 60,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Row(children: [
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Prposal 3',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                    FontWeight.w500),
                                              ),
                                              Text(
                                                'From: Prokas, 01942-671947',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                              Text(
                                                'Proposal details here',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ]),
                                      ),
                                      Container(
                                        child: Row(children: [
                                          PopupMenuButton(
                                              itemBuilder: (_) => [
                                                PopupMenuItem(
                                                    child: Text('Call'),
                                                    value: 1),
                                                PopupMenuItem(
                                                    child: Text('Message'),
                                                    value: 2),
                                                PopupMenuItem(
                                                    child:
                                                    Text('Video Call'),
                                                    value: 3),
                                              ])
                                        ]),
                                      ),
                                    ]),
                              )),
                        ),
                        Divider(thickness: .5, color: Colors.black26),
                        Padding(
                          padding: const EdgeInsets.only(left: 0.0, right: 0.0),
                          child: Container(
                            //height: 60,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Row(children: [
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Prposal 4',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                    FontWeight.w500),
                                              ),
                                              Text(
                                                'From: Tuhin, 01942-671947',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                              Text(
                                                'Proposal details here',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ]),
                                      ),
                                      Container(
                                        child: Row(children: [
                                          PopupMenuButton(
                                              itemBuilder: (_) => [
                                                PopupMenuItem(
                                                    child: Text('Call'),
                                                    value: 1),
                                                PopupMenuItem(
                                                    child: Text('Message'),
                                                    value: 2),
                                                PopupMenuItem(
                                                    child:
                                                    Text('Video Call'),
                                                    value: 3),
                                              ])
                                        ]),
                                      ),
                                    ]),
                              )),
                        ),
                      ]),
                    ),
                  ]))
            ]),
          ),
          SizedBox(
            height: 30,
          ),
        ]),
      ),
    );
  }
}
