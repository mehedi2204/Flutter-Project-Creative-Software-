import 'package:crm/app/const/widgets/custom_snakebar.dart';
import 'package:crm/app/modules/customer_add/customer_add_form.dart';
import 'package:crm/app/modules/customer_list/customer_details_view.dart';
import 'package:crm/app/modules/customer_list/customer_list_api_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomerList extends StatefulWidget {
  const CustomerList({Key? key}) : super(key: key);

  @override
  State<CustomerList> createState() => _CustomerListState();
}

class _CustomerListState extends State<CustomerList> {
  final CustomerController customerController = Get.put(CustomerController());
  final TextEditingController searchController = TextEditingController();
  bool isSearchEmpty = true;

  @override
  void initState() {
    super.initState();
    // Listen for changes in the search field and filter the list accordingly.
    searchController.addListener(() {
      final searchTerm = searchController.text.trim().toLowerCase();
      customerController.filterCustomers(searchTerm);
    });
  }

  void _onBackPressed() {
    searchController.clear();
    customerController.resetFilter();
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
          title: Text('Customer List'),
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
                Get.to(CustomerAddForm());
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
                decoration: InputDecoration(
                  suffixIcon: searchController.text.isEmpty
                      ? Icon(Icons.search, color: Colors.deepPurple)
                      : IconButton(
                    splashRadius: 20,
                    onPressed: () {
                      // Clear the search field.
                      searchController.clear();
                      // Reset the list to show all subscriptions.
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
                    if (customerController.isLoading.value) {
                      return Center(child: CircularProgressIndicator());
                    } else if (customerController.networkError.value) {
                      return Center(child: Text('Network Error. Please check your internet connection.'));
                    }
                    else {
                      final filteredCustomers =
                          customerController.filteredCustomers;

                      if (filteredCustomers.isEmpty) {
                        return Center(child: Text('No customers found.'));
                      }

                      return ListView.builder(
                        itemCount: filteredCustomers.length,
                        itemBuilder: (context, index) {
                          final customer = filteredCustomers[index];
                          final String phoneNumber = "${customer.mobileNo ?? ''}";

                          _callPhoneNumber() async {
                            final url = 'tel:$phoneNumber';
                            try {
                              await launchUrl(Uri.parse(url));
                            } catch (e) {
                              customSnakebar(
                                title: 'Calling Error',
                                description: '$e',
                                color: Colors.red,
                                icon: Icons.error,
                              );
                              print('Error: $e');
                            }
                          }

                          return Padding(
                            padding: const EdgeInsets.only(
                              left: 8.0,
                              right: 8.0,
                              top: 5.0,
                            ),
                            child: InkWell(
                              onTap: () {
                                Get.to(CustomerDetailsScreen(customer: customer));
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                elevation: 4,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width *
                                                0.65,
                                            child: Text(
                                              customer.businessName ?? '',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                color: Colors.blueGrey,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width *
                                                0.5,
                                            child: Text(
                                              customer.customerName ?? '',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16,
                                                color: Colors.black54,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width *
                                                0.5,
                                            child: Text(
                                              customer.businessRole ?? '',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16,
                                                color: Colors.black54,
                                              ),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                    0.3,
                                                child: Text(
                                                  customer.mobileNo ?? '',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                    color: Colors.black54,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.deepPurple,
                                                  border: Border.all(
                                                    color: Colors.blueGrey,
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.circular(7.0),
                                                ),
                                                child: Padding(
                                                  padding:
                                                  const EdgeInsets.all(2.0),
                                                  child: Text(
                                                    'Status: ${customer.status ?? ''}',
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 16,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    InkWell(
                                      onTap: _callPhoneNumber,
                                      child: Icon(
                                        Icons.call,
                                        color: Colors.blueGrey,
                                      ),
                                    ),
                                    Container(
                                      child: PopupMenuButton(
                                        splashRadius: 20,
                                        onSelected: (value) {},
                                        icon: Icon(
                                          Icons.more_vert,
                                          color: Colors.blueGrey,
                                        ),
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
                                    ),
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
            ),
          ],
        ),
      ),
    );
  }
}
