import 'package:crm/app/modules/lead_add/lead_add_form.dart';
import 'package:crm/app/modules/leads_list/lead_list_api_controller.dart';
import 'package:crm/app/modules/leads_list/lead_list_details_view.dart';
import 'package:crm/app/modules/leads_list/lead_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../const/widgets/custom_snakebar.dart';

class LeadListScreen extends StatelessWidget {
  final leadListController = Get.put(LeadListController());
  final TextEditingController searchController = TextEditingController();

  void _onBackPressed() {
    searchController.clear();
    leadListController.resetFilter();
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
          title: Text('Lead List'),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
          actions: [
            IconButton(
              icon: Container(
                  width: 40,
                  height: 35,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(90.0),
                  ),
                  child: Icon(Icons.add)),
              onPressed: () {
                Get.to(LeadAddForm());
              }
            )
          ]
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
                      leadListController.filterLeadList(value);
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
                          leadListController.resetFilter();
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
                      if (leadListController.isLoading.value) {
                        return Center(child: CircularProgressIndicator());
                      } else if (leadListController.networkError.value) {
                        return Center(child: Text('Network Error. Please check your internet connection.'));
                      } else if (leadListController.leadList.isEmpty) {
                        return Center(child: Text('No leads available.'));
                      }
                      else {
                        // Use the filteredSubscriptions instead of subscriptions.
                        final leadList =
                            leadListController.filteredLeadList;

                        return ListView.builder(
                          itemCount: leadList.length,
                          itemBuilder: (context, index) {
                            final lead = leadList[index];
                            final String phoneNumber = "${lead.mobileNo ?? ''}";
                            _callPhoneNumber() async {
                              final url = 'tel:$phoneNumber';
                              try {
                                await launchUrl(Uri.parse(url));
                              } catch (e) {
                                customSnakebar(title: 'Calling Error', description: '$e', color: Colors.red, icon: Icons.error);
                                print('Error: $e');
                              }
                            }
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0, right: 8.0, top: 5.0),
                              child: InkWell(
                                onTap: () {
                                  Get.to(LeadDetailScreen(lead));
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  elevation: 4,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Container(
                                                width: MediaQuery.of(context).size.width * 0.65,
                                                child: Text(lead.customer?.businessName ?? '', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.blueGrey),)),
                                            SizedBox(height: 5,),
                                            Container(
                                                width: MediaQuery.of(context).size.width * 0.5,
                                                child: Text(lead.customerName ?? '', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black54),)),
                                            Container(
                                                width: MediaQuery.of(context).size.width * 0.5,
                                                child: Text(lead.customer?.businessRole ?? '', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black54),)),
                                            Row(
                                              children: [
                                                Container(
                                                    width: MediaQuery.of(context).size.width * 0.4,
                                                    child: Text(lead.mobileNo ?? '', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black54),)),
                                                Container(
                                                  //width: MediaQuery.of(context).size.width * 0.5,
                                                    decoration: BoxDecoration(
                                                      color: Colors.deepPurple,
                                                      border: Border.all(
                                                        color: Colors.blueGrey,
                                                        width: 1,
                                                      ),
                                                      borderRadius: BorderRadius.circular(7.0),
                                                    ),
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(2.0),
                                                      child: Text('Status: ${lead.status ?? ''}', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.white),),
                                                    )),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      InkWell(
                                          onTap: _callPhoneNumber,
                                          child: Icon(Icons.call, color: Colors.blueGrey,)),
                                      // IconButton(onPressed: _callPhoneNumber, icon: Icon(Icons.call, color: Colors.blueGrey,)),
                                      Container(
                                        child: PopupMenuButton(
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
                                      )
                                    ],
                                  ),
                                ),
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

