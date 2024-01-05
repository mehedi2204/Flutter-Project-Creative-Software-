import 'package:crm/app/modules/call_add/call_add_form.dart';
import 'package:crm/app/modules/customer_add/customer_add_form.dart';
import 'package:crm/app/modules/dashboard/settings/settings_view.dart';
import 'package:crm/app/modules/dashboard/view/dashboard_item.dart';
import 'package:crm/app/modules/email_add/email_add_form.dart';
import 'package:crm/app/modules/expense_add/expense_add_form.dart';
import 'package:crm/app/modules/income_add/income_add_form.dart';
import 'package:crm/app/modules/invoice_add/invoice_add_form.dart';
import 'package:crm/app/modules/lead_add/lead_add_form.dart';
import 'package:crm/app/modules/meeting_add/meeting_add_form.dart';
import 'package:crm/app/modules/prposal_add/proposal_add_form.dart';
import 'package:crm/app/modules/subscription_add/subscription_add_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../const/color_constant.dart';
import '../../../const/widgets/app_text.dart';
import '../../label/label_view.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

void _showPopup(BuildContext context) {
  showModalBottomSheet(
    //isScrollControlled: true,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(20.0),
          topRight: const Radius.circular(20.0),
        )
    ),
    context: context,
    builder: (BuildContext builderContext) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.4,
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Column(
                children: [
                  Text('Add to your Label', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  SizedBox(height: 20,),
                  InkWell(
                    onTap: () {
                      Get.to(CustomerAddForm());
                    },
                    child: Container(
                      height: 70,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 70,
                            width: 8,
                            decoration: BoxDecoration(
                              color: Colors.lightBlueAccent,
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                              boxShadow: [BoxShadow(color: Colors.black, blurRadius: 5, offset: Offset(1, 0))],
                            ),
                          ),
                          SizedBox(width: 20,),
                          Container(
                            child: Icon(Icons.group_add_rounded, color: Colors.amber[200], size: 28, shadows: [BoxShadow(color: Colors.black, blurRadius: 5, offset: Offset(2, 2))],),
                          ),
                          SizedBox(width: 20,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Add Customer', style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500, color: Colors.amber[200], shadows: [BoxShadow(color: Colors.black, blurRadius: 5, offset: Offset(1, 1))]),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  InkWell(
                    onTap: () {
                      Get.to(LeadAddForm());
                    },
                    child: Container(
                      height: 70,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 70,
                            width: 8,
                            decoration: BoxDecoration(
                              color: Colors.greenAccent,
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                              boxShadow: [BoxShadow(color: Colors.black, blurRadius: 5, offset: Offset(1, 0))],
                            ),
                          ),
                          SizedBox(width: 20,),
                          Container(
                            child: Icon(Icons.leaderboard_rounded, color: Colors.greenAccent[100], size: 28, shadows: [BoxShadow(color: Colors.black, blurRadius: 5, offset: Offset(2, 2))],),
                          ),
                          SizedBox(width: 20,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Add Leads', style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500, color: Colors.greenAccent[100], shadows: [BoxShadow(color: Colors.black, blurRadius: 5, offset: Offset(1, 1))]),),
                              //Text('Create a Lead', style: TextStyle(fontSize: 14, color: Colors.white70),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  InkWell(
                    onTap: () {
                      Get.to(CallAddForm());
                    },
                    child: Container(
                      height: 70,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 70,
                            width: 8,
                            decoration: BoxDecoration(
                              color: Colors.lightBlueAccent,
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                              boxShadow: [BoxShadow(color: Colors.black, blurRadius: 5, offset: Offset(1, 0))],
                            ),
                          ),
                          SizedBox(width: 20,),
                          Container(
                            child: Icon(Icons.call, color: Colors.lightBlueAccent, size: 28, shadows: [BoxShadow(color: Colors.black, blurRadius: 5, offset: Offset(2, 2))],),
                          ),
                          SizedBox(width: 20,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Add Call', style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500, color: Colors.lightBlueAccent, shadows: [BoxShadow(color: Colors.black, blurRadius: 5, offset: Offset(1, 1))]),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  InkWell(
                    onTap: () {
                      Get.to(EmailAddForm());
                    },
                    child: Container(
                      height: 70,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 70,
                            width: 8,
                            decoration: BoxDecoration(
                              color: Colors.greenAccent,
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                              boxShadow: [BoxShadow(color: Colors.black, blurRadius: 5, offset: Offset(1, 0))],
                            ),
                          ),
                          SizedBox(width: 20,),
                          Container(
                            child: Icon(Icons.email_outlined, color: Colors.blue[100], size: 28, shadows: [BoxShadow(color: Colors.black, blurRadius: 5, offset: Offset(2, 2))],),
                          ),
                          SizedBox(width: 20,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Add Email', style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500, color: Colors.blue[100], shadows: [BoxShadow(color: Colors.black, blurRadius: 5, offset: Offset(1, 1))]),),
                              //Text('Create a Lead', style: TextStyle(fontSize: 14, color: Colors.white70),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  InkWell(
                    onTap: () {
                      Get.to(SubscriptionAddForm());
                    },
                    child: Container(
                      height: 70,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 70,
                            width: 8,
                            decoration: BoxDecoration(
                              color: Colors.greenAccent,
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                              boxShadow: [BoxShadow(color: Colors.black, blurRadius: 5, offset: Offset(1, 0))],
                            ),
                          ),
                          SizedBox(width: 20,),
                          Container(
                            child: Icon(Icons.subscriptions_outlined, color: Colors.amber[300], size: 28, shadows: [BoxShadow(color: Colors.black, blurRadius: 5, offset: Offset(2, 2))],),
                          ),
                          SizedBox(width: 20,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Add Subscription', style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500, color: Colors.amber[300], shadows: [BoxShadow(color: Colors.black, blurRadius: 5, offset: Offset(1, 1))]),),
                              //Text('Create a Lead', style: TextStyle(fontSize: 14, color: Colors.white70),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  InkWell(
                    onTap: () {
                      Get.to(MeetingAddForm());
                    },
                    child: Container(
                      height: 70,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 70,
                            width: 8,
                            decoration: BoxDecoration(
                              color: Colors.greenAccent,
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                              boxShadow: [BoxShadow(color: Colors.black, blurRadius: 5, offset: Offset(1, 0))],
                            ),
                          ),
                          SizedBox(width: 20,),
                          Container(
                            child: Icon(Icons.group, color: Colors.lightGreenAccent[200], size: 28, shadows: [BoxShadow(color: Colors.black, blurRadius: 5, offset: Offset(2, 2))],),
                          ),
                          SizedBox(width: 20,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Add Meetings', style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500, color: Colors.lightGreenAccent[200], shadows: [BoxShadow(color: Colors.black, blurRadius: 5, offset: Offset(1, 1))]),),
                              //Text('Create a Lead', style: TextStyle(fontSize: 14, color: Colors.white70),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    height: 70,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 70,
                          width: 8,
                          decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                            boxShadow: [BoxShadow(color: Colors.black, blurRadius: 5, offset: Offset(1, 0))],
                          ),
                        ),
                        SizedBox(width: 20,),
                        Container(
                          child: Icon(Icons.follow_the_signs_outlined, color: Colors.pinkAccent[100], size: 28, shadows: [BoxShadow(color: Colors.black, blurRadius: 5, offset: Offset(2, 2))],),
                        ),
                        SizedBox(width: 20,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Add FollowUp', style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500, color: Colors.pinkAccent[100], shadows: [BoxShadow(color: Colors.black, blurRadius: 5, offset: Offset(1, 1))]),),
                            //Text('Create a Lead', style: TextStyle(fontSize: 14, color: Colors.white70),),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  InkWell(
                    onTap: () {
                      Get.to(InvoiceAddForm());
                    },
                    child: Container(
                      height: 70,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 70,
                            width: 8,
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                              boxShadow: [BoxShadow(color: Colors.black, blurRadius: 5, offset: Offset(1, 0))],
                            ),
                          ),
                          SizedBox(width: 20,),
                          Container(
                            child: Icon(Icons.task, color: Colors.amber, size: 28, shadows: [BoxShadow(color: Colors.black, blurRadius: 5, offset: Offset(2, 2))],),
                          ),
                          SizedBox(width: 20,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Add Invoice', style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500, color: Colors.amber, shadows: [BoxShadow(color: Colors.black, blurRadius: 5, offset: Offset(1, 1))]),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  InkWell(
                    onTap: () {
                      Get.to(IncomeAddForm());
                    },
                    child: Container(
                      height: 70,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 70,
                            width: 8,
                            decoration: BoxDecoration(
                              color: Colors.greenAccent,
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                              boxShadow: [BoxShadow(color: Colors.black, blurRadius: 5, offset: Offset(1, 0))],
                            ),
                          ),
                          SizedBox(width: 20,),
                          Container(
                            child: Icon(Icons.attach_money, color: Colors.greenAccent, size: 28, shadows: [BoxShadow(color: Colors.black, blurRadius: 5, offset: Offset(2, 2))],),
                          ),
                          SizedBox(width: 20,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Add Income', style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500, color: Colors.greenAccent, shadows: [BoxShadow(color: Colors.black, blurRadius: 5, offset: Offset(1, 1))]),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  InkWell(
                    onTap: () {
                      Get.to(ExpenseAddForm());
                    },
                    child: Container(
                      height: 70,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 70,
                            width: 8,
                            decoration: BoxDecoration(
                              color: Colors.greenAccent,
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                              boxShadow: [BoxShadow(color: Colors.black, blurRadius: 5, offset: Offset(1, 0))],
                            ),
                          ),
                          SizedBox(width: 20,),
                          Container(
                            child: Icon(Icons.money_off, color: Colors.white, size: 28, shadows: [BoxShadow(color: Colors.black, blurRadius: 5, offset: Offset(2, 2))],),
                          ),
                          SizedBox(width: 20,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Add Expense', style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500, color: Colors.white, shadows: [BoxShadow(color: Colors.black, blurRadius: 5, offset: Offset(1, 1))]),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  InkWell(
                    onTap: () {
                      Get.to(ProposalAddForm());
                    },
                    child: Container(
                      height: 70,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 70,
                            width: 8,
                            decoration: BoxDecoration(
                              color: Colors.greenAccent,
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                              boxShadow: [BoxShadow(color: Colors.black, blurRadius: 5, offset: Offset(1, 0))],
                            ),
                          ),
                          SizedBox(width: 20,),
                          Container(
                            child: Icon(Icons.local_offer, color: Colors.deepOrangeAccent[100], size: 28, shadows: [BoxShadow(color: Colors.black, blurRadius: 5, offset: Offset(2, 2))],),
                          ),
                          SizedBox(width: 20,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Add Proposal', style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500, color: Colors.deepOrangeAccent[100], shadows: [BoxShadow(color: Colors.black, blurRadius: 5, offset: Offset(1, 1))]),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    height: 70,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 70,
                          width: 8,
                          decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                            boxShadow: [BoxShadow(color: Colors.black, blurRadius: 5, offset: Offset(1, 0))],
                          ),
                        ),
                        SizedBox(width: 20,),
                        Container(
                          child: Icon(Icons.airplane_ticket_rounded, color: Colors.blue[200], size: 28, shadows: [BoxShadow(color: Colors.black, blurRadius: 5, offset: Offset(2, 2))],),
                        ),
                        SizedBox(width: 20,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Add Ticket', style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500, color: Colors.blue[200], shadows: [BoxShadow(color: Colors.black, blurRadius: 5, offset: Offset(1, 1))]),),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    height: 70,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 70,
                          width: 8,
                          decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                            boxShadow: [BoxShadow(color: Colors.black, blurRadius: 5, offset: Offset(1, 0))],
                          ),
                        ),
                        SizedBox(width: 20,),
                        Container(
                          child: Icon(Icons.collections_bookmark_outlined, color: Colors.greenAccent[200], size: 28, shadows: [BoxShadow(color: Colors.black, blurRadius: 5, offset: Offset(2, 2))],),
                        ),
                        SizedBox(width: 20,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Add Collection', style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500, color: Colors.greenAccent[200], shadows: [BoxShadow(color: Colors.black, blurRadius: 5, offset: Offset(1, 1))]),),
                          ],
                        ),
                      ],
                    ),
                  ),
                ]
            ),
          ],
        ),
      );
    },
  );
}

class _DashboardViewState extends State<DashboardView> {

  int _currentIndex = 0;

  final List<Widget> _pages = [
    // Create your pages here
    // Example:
    DashboardItem(),
    Center(child: Text('Search')),
    LabelView(),
    SettingsView(),
  ];

  // Define a list of colors for the icons
  final List<Color> _iconColors = [
    Colors.deepPurple,
    Colors.grey,
    Colors.grey,
    Colors.grey,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.white,
      //drawer: AppDrawer(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.only(left: 25.0, top: 10.0, bottom: 10.0),
          child: Image.asset('assets/crm_logo-noBG.png'),
        ),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        title: AppText(
          text: 'Smart CRM',
          color: CustomColor.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
        ],
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomAppBar(
        elevation: 10,
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.dashboard),
              color: _iconColors[0],
              onPressed: () {
                setState(() {
                  _currentIndex = 0;
                  _updateIconColors(0);
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.search),
              color: _iconColors[1],
              onPressed: () {
                setState(() {
                  _currentIndex = 1;
                  _updateIconColors(1);
                });
              },
            ),
            SizedBox(width: 50,),
            IconButton(
              icon: Icon(Icons.label),
              color: _iconColors[2],
              onPressed: () {
                setState(() {
                  _currentIndex = 2;
                  _updateIconColors(2);
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.settings),
              color: _iconColors[3],
              onPressed: () {
                setState(() {
                  _currentIndex = 3;
                  _updateIconColors(3);
                });
              },
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        elevation: 4,
        backgroundColor: Colors.deepPurple,
        child: Icon(Icons.add),
        onPressed: () {
          _showPopup(context);
        },
      ),
    );
  }
  // Function to update icon colors based on the selected index
  void _updateIconColors(int selectedIndex) {
    for (int i = 0; i < _iconColors.length; i++) {
      _iconColors[i] = i == selectedIndex ? Colors.deepPurple : Colors.grey;
    }
  }
}
