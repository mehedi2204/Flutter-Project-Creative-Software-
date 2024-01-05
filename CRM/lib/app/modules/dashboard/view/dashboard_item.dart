import 'package:crm/app/modules/call_list/call_list_view.dart';
import 'package:crm/app/modules/collection_list/collection_list_view.dart';
import 'package:crm/app/modules/customer_list/customer_list_view.dart';
import 'package:crm/app/modules/email_list/email_list_view.dart';
import 'package:crm/app/modules/expense_list/expense_list_view.dart';
import 'package:crm/app/modules/follow_up_list/follow_up_list.dart';
import 'package:crm/app/modules/income_list/income_list_view.dart';
import 'package:crm/app/modules/invoice_list/invoice_list_view.dart';
import 'package:crm/app/modules/leads_list/lead_list_api_controller.dart';
import 'package:crm/app/modules/leads_list/lead_list_view.dart';
import 'package:crm/app/modules/meeting_list/meeting_list_view.dart';
import 'package:crm/app/modules/proposal_list/proposal_list_view.dart';
import 'package:crm/app/modules/subscription_list/subscription_list_view.dart';
import 'package:crm/app/modules/ticket_list/ticket_list_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardItem extends StatefulWidget {
  const DashboardItem({Key? key}) : super(key: key);

  @override
  State<DashboardItem> createState() => _DashboardItemState();
}

class _DashboardItemState extends State<DashboardItem> {
  @override
  Widget build(BuildContext context) {
    int _currentIndex = 0;
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        body: ListView(children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(children: [
              SizedBox(
                height: 20,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.to(CustomerList());
                            },
                            child: Container(
                              child: Column(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.deepPurple[50],
                                      borderRadius: BorderRadius.circular(60),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black54,
                                            offset: Offset(-1, 1),
                                            spreadRadius: .5)
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: IconButton(
                                        onPressed: () {
                                          Get.to(CustomerList());
                                        },
                                        icon: Image.asset(
                                          'assets/customer.png',
                                          width: 35,
                                          height: 35,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Customer',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ]),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                              onTap: () {
                                Get.to(LeadListScreen());
                              },
                            child: Container(
                              child: Column(
                                children: [
                                  Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(60),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black54,
                                              offset: Offset(-1, 1),
                                              spreadRadius: .5)
                                        ],
                                      ),
                                      child: IconButton(
                                        onPressed: () {
                                          Get.to(LeadListScreen());
                                        },
                                        icon: Image.asset('assets/generation.png',
                                            width: 30, height: 30),
                                      )),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Leads',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ]),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.to(CallListScreen());
                            },
                            child: Container(
                              child: Column(
                                children: [
                                  Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.lightBlueAccent,
                                        borderRadius: BorderRadius.circular(60),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black54,
                                              offset: Offset(-1, 1),
                                              spreadRadius: .5)
                                        ],
                                      ),
                                      child: IconButton(
                                        onPressed: () {
                                          Get.to(CallListScreen());
                                        },
                                        icon: Image.asset('assets/phone.png',
                                            width: 25, height: 25),
                                      )),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Call',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ]),
                  ]),
              SizedBox(
                height: 30,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                          onTap: () {
                            Get.to(EmailListScreen());
                          },
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.blueGrey,
                                    borderRadius: BorderRadius.circular(60),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black54,
                                          offset: Offset(-1, 1),
                                          spreadRadius: .5)
                                    ],
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      Get.to(EmailListScreen());
                                    },
                                    icon: Image.asset('assets/mail.png',
                                        width: 25, height: 25),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Email',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                          onTap: () {
                            Get.to(SubscriptionListScreen());
                          },
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.blueGrey[100],
                                    borderRadius: BorderRadius.circular(60),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black54,
                                          offset: Offset(-1, 1),
                                          spreadRadius: .5)
                                    ],
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      Get.to(SubscriptionListScreen());
                                    },
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
                      ),
                    ]),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(MeetingListPage());
                        },
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.cyan,
                                    borderRadius: BorderRadius.circular(60),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black54,
                                          offset: Offset(-1, 1),
                                          spreadRadius: .5)
                                    ],
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      Get.to(MeetingListPage());
                                    },
                                    icon: Image.asset('assets/teamwork.png',
                                        width: 30, height: 30),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Meetings',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
              ]),
              SizedBox(
                height: 30,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(FollowUpListScreen());
                        },
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.cyan[200],
                                    borderRadius: BorderRadius.circular(60),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black54,
                                          offset: Offset(-1, 1),
                                          spreadRadius: .5)
                                    ],
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      Get.to(FollowUpListScreen());
                                    },
                                    icon: Image.asset('assets/follow up.png',
                                        width: 25, height: 25),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Follow Up',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                          onTap: () {
                            Get.to(InvoiceListScreen());
                          },
                        child: Container(
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
                                    onPressed: () {
                                      Get.to(InvoiceListScreen());
                                    },
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
                                color: Colors.blue[200],
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
                                icon: Image.asset('assets/groups icon.png',
                                    width: 35, height: 35),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Teammates',
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
                height: 30,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(IncomeListScreen());
                        },
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.indigo[200],
                                    borderRadius: BorderRadius.circular(60),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black54,
                                          offset: Offset(-1, 1),
                                          spreadRadius: .5)
                                    ],
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      Get.to(IncomeListScreen());
                                    },
                                    icon: Image.asset('assets/growth.png',
                                        width: 25, height: 25),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Income',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(ExpenseListScreen());
                        },
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.blueGrey[200],
                                    borderRadius: BorderRadius.circular(60),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black54,
                                          offset: Offset(-1, 1),
                                          spreadRadius: .5)
                                    ],
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      Get.to(ExpenseListScreen());
                                    },
                                    icon: Image.asset('assets/expense.png',
                                        width: 30, height: 30),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Expense',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(ProposalListPage());
                        },
                        child: Container(
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
                                    onPressed: () {
                                      Get.to(ProposalListPage());
                                    },
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
                      ),
                    ]),
              ]),
              SizedBox(
                height: 30,
              ),
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(TicketListView());
                        },
                        child: Container(
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
                                    onPressed: () {
                                      Get.to(TicketListView());
                                    },
                                    icon: Image.asset('assets/ticket.png',
                                        width: 25, height: 25),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Ticket',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.to(CollectionListScreen());
                            },
                            child: Container(
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
                                        onPressed: () {
                                          Get.to(CollectionListScreen());
                                        },
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
                          ),
                        ]),
                    SizedBox(
                      width: 50,
                    ),
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
                  child: Center(
                    child: TabBar(
                      labelStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      labelColor: Colors.deepPurple,
                      unselectedLabelColor: Colors.grey,
                      indicatorColor: Colors.deepPurple,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorPadding: EdgeInsets.all(5),
                      // indicator: BoxDecoration(
                      //   borderRadius: BorderRadius.circular(10),
                      //   color: Colors.blueGrey.withOpacity(.5),
                      //   boxShadow: [
                      //     BoxShadow(
                      //         color: Colors.white60,
                      //         offset: Offset(1, 1),
                      //         spreadRadius: .5)
                      //   ],
                      // ),
                      indicatorWeight: 3,
                      isScrollable: true,
                      tabs: [
                        SizedBox(
                          child: Tab(
                            text: 'Customer',
                          ),
                          width: MediaQuery.of(context).size.width * .2,
                        ),
                        SizedBox(
                          child: Tab(
                            text: 'Leads',
                          ),
                          width: MediaQuery.of(context).size.width * .2,
                        ),
                        SizedBox(
                          child: Tab(
                            text: 'Call',
                          ),
                          width: MediaQuery.of(context).size.width * .2,
                        ),
                        SizedBox(
                          child: Tab(
                            text: 'Follow Up',
                          ),
                          width: MediaQuery.of(context).size.width * .2,
                        ),
                        SizedBox(
                          child: Tab(
                            text: 'Proposal',
                          ),
                          width: MediaQuery.of(context).size.width * .2,
                        ),
                      ],
                    ),
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
                      height: 500,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: ListView(children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 0.0, right: 0.0),
                          child: Container(
                              height: 60,
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
                                          Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              borderRadius:
                                                  BorderRadius.circular(90),
                                            ),
                                            child: Center(
                                                child: Icon(
                                              Icons.person,
                                              color: Colors.white,
                                              size: 30,
                                            )),
                                          ),
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
                                                'Rajon',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                '01942-671947',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w400),
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
                              height: 60,
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
                                          Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              borderRadius:
                                                  BorderRadius.circular(90),
                                            ),
                                            child: Center(
                                                child: Icon(
                                              Icons.person,
                                              color: Colors.white,
                                              size: 30,
                                            )),
                                          ),
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
                                                'Shakil Khan',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                '01942-675387',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w400),
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
                              height: 60,
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
                                          Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              borderRadius:
                                                  BorderRadius.circular(90),
                                            ),
                                            child: Center(
                                                child: Icon(
                                              Icons.person,
                                              color: Colors.white,
                                              size: 30,
                                            )),
                                          ),
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
                                                'Arnab',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                '01442-671380',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w400),
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
                              height: 60,
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
                                          Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              borderRadius:
                                                  BorderRadius.circular(90),
                                            ),
                                            child: Center(
                                                child: Icon(
                                              Icons.person,
                                              color: Colors.white,
                                              size: 30,
                                            )),
                                          ),
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
                                                'Sajid Rabbi',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                '01942-671947',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w400),
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
                              height: 60,
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
                                          Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              borderRadius:
                                                  BorderRadius.circular(90),
                                            ),
                                            child: Center(
                                                child: Icon(
                                              Icons.person,
                                              color: Colors.white,
                                              size: 30,
                                            )),
                                          ),
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
                                                'Rabbi',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                '01942-671947',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w400),
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
                              height: 60,
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
                                          Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              borderRadius:
                                                  BorderRadius.circular(90),
                                            ),
                                            child: Center(
                                                child: Icon(
                                              Icons.person,
                                              color: Colors.white,
                                              size: 30,
                                            )),
                                          ),
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
                                                'Prokash',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                '01942-671947',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w400),
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
                              height: 60,
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
                                          Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              borderRadius:
                                                  BorderRadius.circular(90),
                                            ),
                                            child: Center(
                                                child: Icon(
                                              Icons.person,
                                              color: Colors.white,
                                              size: 30,
                                            )),
                                          ),
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
                                                'Parbo',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                '01942-671947',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w400),
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
                              height: 60,
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
                                          Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              borderRadius:
                                                  BorderRadius.circular(90),
                                            ),
                                            child: Center(
                                                child: Icon(
                                              Icons.person,
                                              color: Colors.white,
                                              size: 30,
                                            )),
                                          ),
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
                                                'Salauddin',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                '01942-671947',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w400),
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
                    Container(
                      height: 500,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: ListView(children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 0.0, right: 0.0),
                          child: Container(
                              height: 60,
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
                                          Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              borderRadius:
                                              BorderRadius.circular(90),
                                            ),
                                            child: Center(
                                                child: Icon(
                                                  Icons.person,
                                                  color: Colors.white,
                                                  size: 30,
                                                )),
                                          ),
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
                                                'Rajon',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                    FontWeight.w500),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                '01942-671947',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                    FontWeight.w400),
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
                              height: 60,
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
                                          Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              borderRadius:
                                              BorderRadius.circular(90),
                                            ),
                                            child: Center(
                                                child: Icon(
                                                  Icons.person,
                                                  color: Colors.white,
                                                  size: 30,
                                                )),
                                          ),
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
                                                'Shakil Khan',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                    FontWeight.w500),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                '01942-675387',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                    FontWeight.w400),
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
                              height: 60,
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
                                          Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              borderRadius:
                                              BorderRadius.circular(90),
                                            ),
                                            child: Center(
                                                child: Icon(
                                                  Icons.person,
                                                  color: Colors.white,
                                                  size: 30,
                                                )),
                                          ),
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
                                                'Arnab',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                    FontWeight.w500),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                '01442-671380',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                    FontWeight.w400),
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
                              height: 60,
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
                                          Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              borderRadius:
                                              BorderRadius.circular(90),
                                            ),
                                            child: Center(
                                                child: Icon(
                                                  Icons.person,
                                                  color: Colors.white,
                                                  size: 30,
                                                )),
                                          ),
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
                                                'Sajid Rabbi',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                    FontWeight.w500),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                '01942-671947',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                    FontWeight.w400),
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
                              height: 60,
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
                                          Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              borderRadius:
                                              BorderRadius.circular(90),
                                            ),
                                            child: Center(
                                                child: Icon(
                                                  Icons.person,
                                                  color: Colors.white,
                                                  size: 30,
                                                )),
                                          ),
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
                                                'Rabbi',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                    FontWeight.w500),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                '01942-671947',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                    FontWeight.w400),
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
                              height: 60,
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
                                          Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              borderRadius:
                                              BorderRadius.circular(90),
                                            ),
                                            child: Center(
                                                child: Icon(
                                                  Icons.person,
                                                  color: Colors.white,
                                                  size: 30,
                                                )),
                                          ),
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
                                                'Prokash',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                    FontWeight.w500),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                '01942-671947',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                    FontWeight.w400),
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
                              height: 60,
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
                                          Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              borderRadius:
                                              BorderRadius.circular(90),
                                            ),
                                            child: Center(
                                                child: Icon(
                                                  Icons.person,
                                                  color: Colors.white,
                                                  size: 30,
                                                )),
                                          ),
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
                                                'Parbo',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                    FontWeight.w500),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                '01942-671947',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                    FontWeight.w400),
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
                              height: 60,
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
                                          Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              borderRadius:
                                              BorderRadius.circular(90),
                                            ),
                                            child: Center(
                                                child: Icon(
                                                  Icons.person,
                                                  color: Colors.white,
                                                  size: 30,
                                                )),
                                          ),
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
                                                'Salauddin',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                    FontWeight.w500),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                '01942-671947',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                    FontWeight.w400),
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
                    Container(
                      height: 500,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: ListView(children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 0.0, right: 0.0),
                          child: Container(
                              height: 60,
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
                                          Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              borderRadius:
                                              BorderRadius.circular(90),
                                            ),
                                            child: Center(
                                                child: Icon(
                                                  Icons.person,
                                                  color: Colors.white,
                                                  size: 30,
                                                )),
                                          ),
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
                                                'Rajon',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                    FontWeight.w500),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                '01942-671947',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                    FontWeight.w400),
                                              ),
                                            ],
                                          ),
                                        ]),
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                Row(children: [
                                                  Icon(
                                                    Icons.call_missed,
                                                    size: 20,
                                                    color: Colors.red,
                                                  ),
                                                  Text(
                                                    'Today',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.w400),
                                                  ),
                                                ]),
                                                Text(
                                                  'Duration: 0.00 min',
                                                )
                                              ],
                                            ),
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
                                          ],
                                        ),
                                      ),
                                    ]),
                              )),
                        ),
                        Divider(thickness: .5, color: Colors.black26),
                        Padding(
                          padding: const EdgeInsets.only(left: 0.0, right: 0.0),
                          child: Container(
                              height: 60,
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
                                          Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              borderRadius:
                                              BorderRadius.circular(90),
                                            ),
                                            child: Center(
                                                child: Icon(
                                                  Icons.person,
                                                  color: Colors.white,
                                                  size: 30,
                                                )),
                                          ),
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
                                                'Mahafujur Rahaman',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                    FontWeight.w500),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                '01942-671947',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                    FontWeight.w400),
                                              ),
                                            ],
                                          ),
                                        ]),
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                Row(children: [
                                                  Icon(
                                                    Icons.call_made,
                                                    size: 20,
                                                    color: Colors.green,
                                                  ),
                                                  Text(
                                                    'Today',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.w400),
                                                  ),
                                                ]),
                                                Text(
                                                  'Duration: 2.34 min',
                                                )
                                              ],
                                            ),
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
                                          ],
                                        ),
                                      ),
                                    ]),
                              )),
                        ),
                        Divider(thickness: .5, color: Colors.black26),
                        Padding(
                          padding: const EdgeInsets.only(left: 0.0, right: 0.0),
                          child: Container(
                              height: 60,
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
                                          Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              borderRadius:
                                              BorderRadius.circular(90),
                                            ),
                                            child: Center(
                                                child: Icon(
                                                  Icons.person,
                                                  color: Colors.white,
                                                  size: 30,
                                                )),
                                          ),
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
                                                'Rajon',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                    FontWeight.w500),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                '01942-671947',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                    FontWeight.w400),
                                              ),
                                            ],
                                          ),
                                        ]),
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                Row(children: [
                                                  Icon(
                                                    Icons.call_missed,
                                                    size: 20,
                                                    color: Colors.red,
                                                  ),
                                                  Text(
                                                    'Today',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.w400),
                                                  ),
                                                ]),
                                                Text(
                                                  'Duration: 0.00 min',
                                                )
                                              ],
                                            ),
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
                                          ],
                                        ),
                                      ),
                                    ]),
                              )),
                        ),
                        Divider(thickness: .5, color: Colors.black26),
                        Padding(
                          padding: const EdgeInsets.only(left: 0.0, right: 0.0),
                          child: Container(
                              height: 60,
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
                                          Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              borderRadius:
                                              BorderRadius.circular(90),
                                            ),
                                            child: Center(
                                                child: Icon(
                                                  Icons.person,
                                                  color: Colors.white,
                                                  size: 30,
                                                )),
                                          ),
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
                                                'Rajon',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                    FontWeight.w500),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                '01942-671947',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                    FontWeight.w400),
                                              ),
                                            ],
                                          ),
                                        ]),
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                Row(children: [
                                                  Icon(
                                                    Icons.call_missed,
                                                    size: 20,
                                                    color: Colors.red,
                                                  ),
                                                  Text(
                                                    'Today',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.w400),
                                                  ),
                                                ]),
                                                Text(
                                                  'Duration: 0.00 min',
                                                )
                                              ],
                                            ),
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
                                          ],
                                        ),
                                      ),
                                    ]),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 0.0, right: 0.0),
                          child: Container(
                              height: 60,
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
                                          Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              borderRadius:
                                              BorderRadius.circular(90),
                                            ),
                                            child: Center(
                                                child: Icon(
                                                  Icons.person,
                                                  color: Colors.white,
                                                  size: 30,
                                                )),
                                          ),
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
                                                'Rajon',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                    FontWeight.w500),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                '01942-671947',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                    FontWeight.w400),
                                              ),
                                            ],
                                          ),
                                        ]),
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                Row(children: [
                                                  Icon(
                                                    Icons.call_missed,
                                                    size: 20,
                                                    color: Colors.red,
                                                  ),
                                                  Text(
                                                    'Today',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.w400),
                                                  ),
                                                ]),
                                                Text(
                                                  'Duration: 0.00 min',
                                                )
                                              ],
                                            ),
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
                                          ],
                                        ),
                                      ),
                                    ]),
                              )),
                        ),
                        Divider(thickness: .5, color: Colors.black26),
                        Padding(
                          padding: const EdgeInsets.only(left: 0.0, right: 0.0),
                          child: Container(
                              height: 60,
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
                                          Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              borderRadius:
                                              BorderRadius.circular(90),
                                            ),
                                            child: Center(
                                                child: Icon(
                                                  Icons.person,
                                                  color: Colors.white,
                                                  size: 30,
                                                )),
                                          ),
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
                                                'Rajon',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                    FontWeight.w500),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                '01942-671947',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                    FontWeight.w400),
                                              ),
                                            ],
                                          ),
                                        ]),
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                Row(children: [
                                                  Icon(
                                                    Icons.call_missed,
                                                    size: 20,
                                                    color: Colors.red,
                                                  ),
                                                  Text(
                                                    'Today',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.w400),
                                                  ),
                                                ]),
                                                Text(
                                                  'Duration: 0.00 min',
                                                )
                                              ],
                                            ),
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
                                          ],
                                        ),
                                      ),
                                    ]),
                              )),
                        ),
                        Divider(thickness: .5, color: Colors.black26),
                        Padding(
                          padding: const EdgeInsets.only(left: 0.0, right: 0.0),
                          child: Container(
                              height: 60,
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
                                          Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              borderRadius:
                                              BorderRadius.circular(90),
                                            ),
                                            child: Center(
                                                child: Icon(
                                                  Icons.person,
                                                  color: Colors.white,
                                                  size: 30,
                                                )),
                                          ),
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
                                                'Rajon',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                    FontWeight.w500),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                '01942-671947',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                    FontWeight.w400),
                                              ),
                                            ],
                                          ),
                                        ]),
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                Row(children: [
                                                  Icon(
                                                    Icons.call_missed,
                                                    size: 20,
                                                    color: Colors.red,
                                                  ),
                                                  Text(
                                                    'Today',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.w400),
                                                  ),
                                                ]),
                                                Text(
                                                  'Duration: 0.00 min',
                                                )
                                              ],
                                            ),
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
                                          ],
                                        ),
                                      ),
                                    ]),
                              )),
                        ),
                        Divider(thickness: .5, color: Colors.black26),
                        Padding(
                          padding: const EdgeInsets.only(left: 0.0, right: 0.0),
                          child: Container(
                              height: 60,
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
                                          Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              borderRadius:
                                              BorderRadius.circular(90),
                                            ),
                                            child: Center(
                                                child: Icon(
                                                  Icons.person,
                                                  color: Colors.white,
                                                  size: 30,
                                                )),
                                          ),
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
                                                'Rajon',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                    FontWeight.w500),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                '01942-671947',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                    FontWeight.w400),
                                              ),
                                            ],
                                          ),
                                        ]),
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                Row(children: [
                                                  Icon(
                                                    Icons.call_missed,
                                                    size: 20,
                                                    color: Colors.red,
                                                  ),
                                                  Text(
                                                    'Today',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.w400),
                                                  ),
                                                ]),
                                                Text(
                                                  'Duration: 0.00 min',
                                                )
                                              ],
                                            ),
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
                                          ],
                                        ),
                                      ),
                                    ]),
                              )),
                        ),
                      ]),
                    ),
                    Container(
                      height: 500,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: ListView(children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 0.0, right: 0.0),
                          child: Container(
                              height: 60,
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
                                          Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              borderRadius:
                                              BorderRadius.circular(90),
                                            ),
                                            child: Center(
                                                child: Icon(
                                                  Icons.person,
                                                  color: Colors.white,
                                                  size: 30,
                                                )),
                                          ),
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
                                                'Rajon',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                    FontWeight.w500),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                '01942-671947',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                    FontWeight.w400),
                                              ),
                                            ],
                                          ),
                                        ]),
                                      ),
                                      Container(
                                        child: Row(
                                          
                                            children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Last Contact',
                                              ),
                                          Text(
                                                'Yesterday, 10:00 AM',
                                          ),
                                            ],
                                          ),
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
                              height: 60,
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
                                          Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              borderRadius:
                                              BorderRadius.circular(90),
                                            ),
                                            child: Center(
                                                child: Icon(
                                                  Icons.person,
                                                  color: Colors.white,
                                                  size: 30,
                                                )),
                                          ),
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
                                                'Nirob',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                    FontWeight.w500),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                '01942-671947',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                    FontWeight.w400),
                                              ),
                                            ],
                                          ),
                                        ]),
                                      ),
                                      Container(
                                        child: Row(

                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Last Contact',
                                                  ),
                                                  Text(
                                                    'Yesterday, 9:00 PM',
                                                  ),
                                                ],
                                              ),
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
                              height: 60,
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
                                          Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              borderRadius:
                                              BorderRadius.circular(90),
                                            ),
                                            child: Center(
                                                child: Icon(
                                                  Icons.person,
                                                  color: Colors.white,
                                                  size: 30,
                                                )),
                                          ),
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
                                                'Shakil',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                    FontWeight.w500),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                '01942-671947',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                    FontWeight.w400),
                                              ),
                                            ],
                                          ),
                                        ]),
                                      ),
                                      Container(
                                        child: Row(

                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Last Contact',
                                                  ),
                                                  Text(
                                                    'Today, 10:00 AM',
                                                  ),
                                                ],
                                              ),
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
                              height: 60,
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
                                          Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              borderRadius:
                                              BorderRadius.circular(90),
                                            ),
                                            child: Center(
                                                child: Icon(
                                                  Icons.person,
                                                  color: Colors.white,
                                                  size: 30,
                                                )),
                                          ),
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
                                                'Rajon',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                    FontWeight.w500),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                '01942-671947',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                    FontWeight.w400),
                                              ),
                                            ],
                                          ),
                                        ]),
                                      ),
                                      Container(
                                        child: Row(

                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Last Contact',
                                                  ),
                                                  Text(
                                                    'Yesterday, 10:00 AM',
                                                  ),
                                                ],
                                              ),
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
                              height: 60,
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
                                          Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              borderRadius:
                                              BorderRadius.circular(90),
                                            ),
                                            child: Center(
                                                child: Icon(
                                                  Icons.person,
                                                  color: Colors.white,
                                                  size: 30,
                                                )),
                                          ),
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
                                                'Rajon',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                    FontWeight.w500),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                '01942-671947',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                    FontWeight.w400),
                                              ),
                                            ],
                                          ),
                                        ]),
                                      ),
                                      Container(
                                        child: Row(

                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Last Contact',
                                                  ),
                                                  Text(
                                                    'Yesterday, 10:00 AM',
                                                  ),
                                                ],
                                              ),
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
