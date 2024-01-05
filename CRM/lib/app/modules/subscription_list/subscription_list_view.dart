import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:crm/app/modules/subscription_add/subscription_add_form.dart';
import 'package:crm/app/modules/subscription_list/subscription_list_api_controller.dart';

class SubscriptionListScreen extends StatelessWidget {
  final SubscriptionController subscriptionController =
  Get.put(SubscriptionController());
  final TextEditingController searchController = TextEditingController();

  void _onBackPressed() {
    searchController.clear();
    subscriptionController.resetFilter();
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
          title: Text("Subscription List"),
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
                Get.to(SubscriptionAddForm());
              },
            )
          ],
        ),
        body: Column(
          children: [
            SizedBox(height: 20),
            Container(
              height: 45,
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextField(
                controller: searchController,
                onChanged: (value) {
                  // Call a method to filter the list when the text changes.
                  subscriptionController.filterSubscriptions(value);
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
                      subscriptionController.resetFilter();
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
            Divider(
              thickness: 1,
              color: Colors.blueGrey,
              indent: MediaQuery.of(context).size.width * 0.04,
              endIndent: MediaQuery.of(context).size.width * 0.04,
              height: 20,
            ),
            Expanded(
              flex: 8,
              child: Container(
                child: Obx(
                      () {
                    if (subscriptionController.isLoading.value) {
                      return Center(child: CircularProgressIndicator());
                    } else if (subscriptionController.networkError.value) {
                      return Center(child: Text('Network Error. Please check your internet connection.'));
                    }
                    else if (subscriptionController.filteredSubscriptions.isEmpty) {
                      return Center(child: Text('No subscriptions available.'));
                    } else {
                      // Use the filteredSubscriptions instead of subscriptions.
                      final filteredSubscriptions =
                          subscriptionController.filteredSubscriptions;

                      return ListView.builder(
                        itemCount: filteredSubscriptions.length,
                        itemBuilder: (context, index) {
                          final subscription =
                          filteredSubscriptions[index];

                          return Padding(
                            padding: const EdgeInsets.only(
                              left: 8.0,
                              right: 8.0,
                              top: 5.0,
                            ),
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
                                                  child: Text(subscription.customer?.businessName ?? '', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.blueGrey),)),
                                              SizedBox(height: 5,),
                                              Divider( thickness: 2, color: Colors.blueGrey,),
                                              Container(
                                                //width: MediaQuery.of(context).size.width * 0.6,
                                                  child: Text(subscription.title ?? '', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black54),)),
                                              SizedBox(height: 5,),
                                              Row(
                                                children: [
                                                  Container(
                                                    //width: MediaQuery.of(context).size.width * 0.4,
                                                      child: Row(
                                                        children: [
                                                          Text('Product: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black54),),
                                                          Text('${subscription.product ?? ''}', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black54),),
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
                                            ],
                                          ),
                                        ),
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
                                                            child: Text(subscription.customer?.customerName ?? '', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black54),)),
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
                                                            child: Text(subscription.customer?.businessRole ?? '', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black54),)),
                                                      ]
                                                  ),
                                                  SizedBox(height: 2,),
                                                  Row(
                                                      children: [
                                                        Container(
                                                            width: MediaQuery.of(context).size.width * 0.35,
                                                            child: Text('Phone Number: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black54),)),
                                                        Container(
                                                            width: MediaQuery.of(context).size.width * 0.35,
                                                            child: Text(subscription.customer?.mobileNo ?? '', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black54),)),
                                                      ]
                                                  ),
                                                  SizedBox(height: 2,),
                                                  Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Container(
                                                            width: MediaQuery.of(context).size.width * 0.35,
                                                            child: Text('Plan: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black54),)),
                                                        Container(
                                                            width: MediaQuery.of(context).size.width * 0.35,
                                                            child: Text(subscription.plane ?? '', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black54),)),
                                                      ]
                                                  ),
                                                  SizedBox(height: 2,),
                                                  Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Container(
                                                            width: MediaQuery.of(context).size.width * 0.35,
                                                            child: Text('Bill Amount: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black54),)),
                                                        Container(
                                                            width: MediaQuery.of(context).size.width * 0.35,
                                                            child: Text(subscription.billAmount ?? '', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black54),)),
                                                      ]
                                                  ),
                                                  SizedBox(height: 2,),
                                                  Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Container(
                                                            width: MediaQuery.of(context).size.width * 0.35,
                                                            child: Text('Payment Type: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black54),)),
                                                        Container(
                                                            width: MediaQuery.of(context).size.width * 0.35,
                                                            child: Text(subscription.paymentType ?? '', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black54),)),
                                                      ]
                                                  ),
                                                  SizedBox(height: 2,),
                                                  Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Container(
                                                            width: MediaQuery.of(context).size.width * 0.35,
                                                            child: Text('Currency: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black54),)),
                                                        Container(
                                                            width: MediaQuery.of(context).size.width * 0.35,
                                                            child: Text(subscription.currency?.name ?? '', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black54),)),
                                                      ]
                                                  ),
                                                  SizedBox(height: 2,),
                                                  Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Container(
                                                            width: MediaQuery.of(context).size.width * 0.35,
                                                            child: Text('First Billing Date: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black54),)),
                                                        Container(
                                                            width: MediaQuery.of(context).size.width * 0.35,
                                                            child: Text(subscription.firstBillingDate ?? '', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black54),)),
                                                      ]
                                                  ),
                                                  SizedBox(height: 2,),
                                                  Row(
                                                      children: [
                                                        Container(
                                                            width: MediaQuery.of(context).size.width * 0.35,
                                                            child: Text('Bill Due Date: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black54),)),
                                                        Container(
                                                            width: MediaQuery.of(context).size.width * 0.35,
                                                            child: Text(subscription.billDueDate ?? '', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black54),)),
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
          ],
        ),
      ),
    );
  }
}
