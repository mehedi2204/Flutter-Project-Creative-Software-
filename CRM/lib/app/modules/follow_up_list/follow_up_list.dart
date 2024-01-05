import 'package:crm/app/modules/call_list/call_list_api_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

String formatTime(String inputTime) {
  final inputFormat = DateFormat('HH:mm');
  final outputFormat = DateFormat('h:mm a');
  final time = inputFormat.parse(inputTime);

  return outputFormat.format(time);
}

class FollowUpListScreen extends StatelessWidget {
  final CallListController callListController = Get.put(CallListController());
  final TextEditingController searchController = TextEditingController();

  void _onBackPressed() {
    searchController.clear();
    callListController.resetFilter();
    // You may also navigate away from the screen here
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _onBackPressed();
        return true;
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text('Follow UP List'),
            centerTitle: true,
            backgroundColor: Colors.deepPurple,
          ),
          body: Column(
              children: [
                SizedBox(height: 20,),
                Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width*0.9,
                    child: TextField(
                      controller: searchController,
                      onChanged: (value) {
                        // Call a method to filter the list when the text changes.
                        callListController.filterCallList(value);
                      },
                      decoration: InputDecoration(
                        suffixIcon: searchController.text.isEmpty
                            ? Icon(Icons.search, color: Colors.deepPurple)
                            : IconButton(
                          splashRadius: 20,
                          onPressed: () {
                            // Clear the search field.
                            searchController.clear();
                            // Reset the list to show all subscriptions.
                            callListController.resetFilter();
                          },
                          icon: Icon(Icons.clear, color: Colors.deepPurple),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple, width: 5),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.deepPurple),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.deepPurple, width: 2),
                        ),
                        hintText: 'Search by Business Name',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                ),
                Divider(thickness: 1, color: Colors.blueGrey, indent: MediaQuery.of(context).size.width*0.04, endIndent: MediaQuery.of(context).size.width*0.04, height: 20,),
                Expanded(
                  flex: 8,
                  child: Container(
                    child: Obx(
                          () {
                        if (callListController.isLoading.value) {
                          return Center(child: CircularProgressIndicator());
                        }
                        else if (callListController.networkError.value) {
                          return Center(child: Text('Network Error. Please check your internet connection.'));
                        }
                        else if (callListController.callList.isEmpty) {
                          return Center(child: Text('No follow ups available.'));
                        }
                        else {
                          // Use the filteredSubscriptions instead of subscriptions.
                          final callList =
                              callListController.filteredCallList;

                          return ListView.builder(
                            itemCount: callList.length,
                            itemBuilder: (context, index) {
                              final call = callList[index];
                              final inputTime = call.followUpTime ?? '';
                              final inputTime2 = call.statTime ?? '';
                              final formattedTime = formatTime(inputTime);
                              final formattedTime2 = formatTime(inputTime2);

                              final callDuration = call.duration ?? '';
                              return Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, right: 8.0, top: 5.0),
                                child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    elevation: 4,
                                    child: ExpansionTile(
                                        title: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    //width: MediaQuery.of(context).size.width * 0.65,
                                                      child: Text(call.customer?.businessName ?? '', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.blueGrey),)),
                                                  SizedBox(height: 5,),
                                                  Divider( thickness: 2, color: Colors.blueGrey,),
                                                  Container(
                                                    //width: MediaQuery.of(context).size.width * 0.6,
                                                      child: Text(call.mobileNo ?? '', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black54),)),
                                                  SizedBox(height: 5,),
                                                  Row(
                                                    children: [
                                                      Container(
                                                        //width: MediaQuery.of(context).size.width * 0.4,
                                                          child: Row(
                                                            children: [
                                                              Text('Status: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black54),),
                                                              Text('${call.status ?? ''}', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black54),),
                                                            ],
                                                          )),
                                                      // SizedBox(width: MediaQuery.of(context).size.width * 0.15,),
                                                      // Container(
                                                      //   //width: MediaQuery.of(context).size.width * 0.5,
                                                      //     decoration: BoxDecoration(
                                                      //       color: Colors.deepPurple,
                                                      //       border: Border.all(
                                                      //         color: Colors.blueGrey,
                                                      //         width: 1,
                                                      //       ),
                                                      //       borderRadius: BorderRadius.circular(7.0),
                                                      //     ),
                                                      //     child: Padding(
                                                      //       padding: const EdgeInsets.all(2.0),
                                                      //       child: Text('Status: ${email.customer?.status ?? ''}', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.white),),
                                                      //     )),
                                                    ],
                                                  ),
                                                  Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                      children: [
                                                        Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              Row(
                                                                  children: [
                                                                    Text('Follow Up Date | Time: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black54),),
                                                                  ]
                                                              ),
                                                              Row(
                                                                  children: [
                                                                    Text(call.followUpDate ?? '', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black54),),
                                                                    Text(' | ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black54),),
                                                                    Text(formattedTime ?? '', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black54),),
                                                                  ]
                                                              ),
                                                            ]
                                                        ),
                                                      ]
                                                  ),
                                                ],
                                              ),
                                            ),
                                            IconButton(onPressed: () {}, icon: Icon(Icons.call))
                                          ],
                                        ),
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 25.0, ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Container(
                                                  child: Column(
                                                    //crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Row(
                                                          children: [
                                                            Container(
                                                                width: MediaQuery.of(context).size.width * 0.35,
                                                                child: Text('Customer Name: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black54),)),
                                                            Container(
                                                                width: MediaQuery.of(context).size.width * 0.35,
                                                                child: Text(call.customer?.customerName ?? '', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black54),)),
                                                          ]
                                                      ),
                                                      SizedBox(height: 2,),
                                                      Row(
                                                          children: [
                                                            Container(
                                                                width: MediaQuery.of(context).size.width * 0.35,
                                                                child: Text('Business Role: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black54),)),
                                                            Container(
                                                                width: MediaQuery.of(context).size.width * 0.35,
                                                                child: Text(call.customer?.businessRole ?? '', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black54),)),
                                                          ]
                                                      ),
                                                      SizedBox(height: 2,),
                                                      Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Container(
                                                                width: MediaQuery.of(context).size.width * 0.35,
                                                                child: Text('Address: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black54),)),
                                                            Container(
                                                                width: MediaQuery.of(context).size.width * 0.35,
                                                                child: Text(call.address ?? '', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black54),)),
                                                          ]
                                                      ),
                                                      SizedBox(height: 2,),
                                                      Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Container(
                                                                width: MediaQuery.of(context).size.width * 0.35,
                                                                child: Text('Website: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black54),)),
                                                            Container(
                                                                width: MediaQuery.of(context).size.width * 0.35,
                                                                child: Text(call.customer?.website ?? '', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black54),)),
                                                          ]
                                                      ),
                                                      SizedBox(height: 2,),
                                                      Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Container(
                                                                width: MediaQuery.of(context).size.width * 0.35,
                                                                child: Text('Display Reminder: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black54),)),
                                                            Container(
                                                                width: MediaQuery.of(context).size.width * 0.35,
                                                                child: Text(call.displayReminder ?? '', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black54),)),
                                                          ]
                                                      ),
                                                      SizedBox(height: 2,),
                                                      Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Container(
                                                                width: MediaQuery.of(context).size.width * 0.35,
                                                                child: Text('Direction: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black54),)),
                                                            Container(
                                                                width: MediaQuery.of(context).size.width * 0.35,
                                                                child: Text(call.direction ?? '', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black54),)),
                                                          ]
                                                      ),
                                                      SizedBox(height: 2,),
                                                      Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Container(
                                                                width: MediaQuery.of(context).size.width * 0.35,
                                                                child: Text('Duration: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black54),)),
                                                            Container(
                                                                width: MediaQuery.of(context).size.width * 0.35,
                                                                child: Text('${callDuration} min', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black54),)),
                                                          ]
                                                      ),
                                                      SizedBox(height: 2,),
                                                      Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Container(
                                                                width: MediaQuery.of(context).size.width * 0.35,
                                                                child: Text('Call Type: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black54),)),
                                                            Container(
                                                                width: MediaQuery.of(context).size.width * 0.35,
                                                                child: Text(call.callType ?? '', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black54),)),
                                                          ]
                                                      ),
                                                      SizedBox(height: 2,),
                                                      Row(
                                                          children: [
                                                            Container(
                                                                width: MediaQuery.of(context).size.width * 0.35,
                                                                child: Text('Private: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black54),)),
                                                            Container(
                                                                width: MediaQuery.of(context).size.width * 0.35,
                                                                child: Text(call.private ?? '', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black54),)),
                                                          ]
                                                      ),
                                                      SizedBox(height: 2,),
                                                      Row(
                                                          children: [
                                                            Container(
                                                                width: MediaQuery.of(context).size.width * 0.35,
                                                                child: Text('Comment: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black54),)),
                                                            Container(
                                                                width: MediaQuery.of(context).size.width * 0.35,
                                                                child: Text(call.comment ?? '', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black54),)),
                                                          ]
                                                      ),
                                                      SizedBox(height: 10,),
                                                    ],
                                                  ),
                                                ),
                                                PopupMenuButton(
                                                    splashRadius: 30,
                                                    onSelected: (value) {},
                                                    icon: Icon(Icons.more_vert, color: Colors.blueGrey),
                                                    itemBuilder: (_) => [
                                                      PopupMenuItem(
                                                          child:
                                                          Text('Leads'),
                                                          value: 3),
                                                      PopupMenuItem(
                                                          child:
                                                          Text('Email'),
                                                          value: 4),
                                                      PopupMenuItem(
                                                          child:
                                                          Text('Meetings'),
                                                          value: 5),
                                                      PopupMenuItem(
                                                          child:
                                                          Text('Proposal'),
                                                          value: 6),
                                                      PopupMenuItem(
                                                          child:
                                                          Text('Invoice'),
                                                          value: 7),
                                                      PopupMenuItem(
                                                          child:
                                                          Text('Collection'),
                                                          value: 8),
                                                      PopupMenuItem(
                                                          child:
                                                          Text('Subscription'),
                                                          value: 13),
                                                    ]),
                                              ],
                                            ),
                                          )
                                        ])
                                ),
                              );
                            },
                          );
                        }
                      },
                    ),
                  ),
                )
              ]
          )
      ),
    );
  }
}
