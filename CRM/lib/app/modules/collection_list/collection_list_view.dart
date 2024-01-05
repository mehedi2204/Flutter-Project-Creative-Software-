import 'package:crm/app/modules/collection_list/collection_list_api_controller.dart';
import 'package:crm/app/modules/invoice_add/invoice_add_form.dart';
import 'package:crm/app/modules/subscription_add/subscription_add_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CollectionListScreen extends StatelessWidget {
  final collectionController = Get.put(CollectionListController());
  final TextEditingController searchController = TextEditingController();

  get context => null;

  void _onBackPressed() {
    searchController.clear();
    collectionController.resetFilter();
    // You may also navigate away from the screen here
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          // title: Text('Dialog Title'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  border: Border.all(
                    color: Colors.deepPurple,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0),
                      blurRadius: 6.0,
                    )
                  ]
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0, bottom: 10.0),
                  child: Text('Add Invoice Collection', style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16,
                  )),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    border: Border.all(
                      color: Colors.deepPurple,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0),
                        blurRadius: 6.0,
                      )
                    ]
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0, bottom: 10.0),
                  child: Text('Add Invoice Collection', style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16,
                  )),
                ),
              ),
            ]
          ),
        );
      },
    );
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
          title: Text('Collection List'),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
          actions: [
            PopupMenuButton(
              splashRadius: 20,
              onSelected: (value) {
                if (value == 1) {
                  Get.to(() => InvoiceAddForm());
                }
                if (value == 2) {
                  Get.to(() => SubscriptionAddForm());
                }
              },
              icon: Container(
                width: 40,
                height: 35,
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  border: Border.all(
                    color: Colors.deepPurple,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(90.0),
                  )
                ),
                  child: Icon(Icons.add)),
              itemBuilder: (_) => [
                PopupMenuItem(
                  child: Text('Add Invoice Collection'),
                  value: 1,
                ),
                PopupMenuItem(
                  child: Text('Add Subscription Collection'),
                  value: 2,
                ),
              ],
            ),
          ],
        ),
        body: Column(
          children: [
            SizedBox(height: 20,),
            Container(
              height: 45,
              width: MediaQuery.of(context).size.width*0.9,
              child: TextField(
                controller: searchController,
                onChanged: (text) {
                  collectionController.filterCollections(text);
                },
                decoration: InputDecoration(
                  suffixIcon: searchController.text.isEmpty
                      ? Icon(Icons.search, color: Colors.deepPurple)
                      : IconButton(
                    splashRadius: 20,
                    onPressed: () {
                      // Clear the search field.
                      searchController.clear();
                      collectionController.resetFilter();
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
                  hintText: 'Search by Invoice No',
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
                    if (collectionController.isLoading.value) {
                      return Center(child: CircularProgressIndicator());
                    } else if (collectionController.networkError.value) {
                      return Center(child: Text('Network Error. Please check your internet connection.'));
                    }
                    else if (collectionController.collectionList.isEmpty) {
                      return Center(child: Text('No collection available.'));
                    }
                    else {
                      return ListView.builder(
                        itemCount: collectionController.filteredCollectionList.length,
                        itemBuilder: (context, index) {
                          final collection = collectionController.filteredCollectionList[index];

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
                                            child: Text(collection.invoiceNo ?? '', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.blueGrey),),
                                          ),
                                          SizedBox(height: 5,),
                                          Divider(thickness: 2, color: Colors.blueGrey,),
                                          Container(
                                            child: Text(collection.mobileNo ?? '', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black54),),
                                          ),
                                          SizedBox(height: 5,),
                                          Row(
                                            children: [
                                              Container(
                                                child: Row(
                                                  children: [
                                                    Text('${collection.collectionDate ?? ''}', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black54),),
                                                  ],
                                                ),
                                              ),
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
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    width: MediaQuery.of(context).size.width * 0.35,
                                                    child: Text('Invoice No: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black54),),
                                                  ),
                                                  Container(
                                                    width: MediaQuery.of(context).size.width * 0.35,
                                                    child: Text(collection.invoiceNo ?? '', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black54),),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 2,),
                                              Row(
                                                children: [
                                                  Container(
                                                    width: MediaQuery.of(context).size.width * 0.35,
                                                    child: Text('Collected Amount: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black54),),
                                                  ),
                                                  Container(
                                                    width: MediaQuery.of(context).size.width * 0.35,
                                                    child: Text(collection.collectedAmount ?? '', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black54),),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 2,),
                                              Row(
                                                children: [
                                                  Container(
                                                    width: MediaQuery.of(context).size.width * 0.35,
                                                    child: Text('Invoice Amount: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black54),),
                                                  ),
                                                  Container(
                                                    width: MediaQuery.of(context).size.width * 0.35,
                                                    child: Text(collection.invoiceAmount ?? '', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black54),),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 2,),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Container(
                                                    width: MediaQuery.of(context).size.width * 0.35,
                                                    child: Text('Collection Amount: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black54),),
                                                  ),
                                                  Container(
                                                    width: MediaQuery.of(context).size.width * 0.35,
                                                    child: Text(collection.collectionAmount ?? '', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black54),),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 2,),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Container(
                                                    width: MediaQuery.of(context).size.width * 0.35,
                                                    child: Text('Due Amount: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black54),),
                                                  ),
                                                  Container(
                                                    width: MediaQuery.of(context).size.width * 0.35,
                                                    child: Text(collection.dueAmount ?? '', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black54),),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 2,),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Container(
                                                    width: MediaQuery.of(context).size.width * 0.35,
                                                    child: Text('Collection Mode: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black54),),
                                                  ),
                                                  Container(
                                                    width: MediaQuery.of(context).size.width * 0.35,
                                                    child: Text(collection.collectionMode ?? '', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black54),),
                                                  ),
                                                ],
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
                                              child: Text('Leads'),
                                              value: 3,
                                            ),
                                            PopupMenuItem(
                                              child: Text('Email'),
                                              value: 4,
                                            ),
                                            PopupMenuItem(
                                              child: Text('Meetings'),
                                              value: 5,
                                            ),
                                            PopupMenuItem(
                                              child: Text('Proposal'),
                                              value: 6,
                                            ),
                                            PopupMenuItem(
                                              child: Text('Invoice'),
                                              value: 7,
                                            ),
                                            PopupMenuItem(
                                              child: Text('Collection'),
                                              value: 8,
                                            ),
                                            PopupMenuItem(
                                              child: Text('Subscription'),
                                              value: 13,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
