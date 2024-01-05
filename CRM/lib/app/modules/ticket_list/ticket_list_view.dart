import 'package:crm/app/modules/ticket_list/ticket_list_api_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TicketListView extends StatelessWidget {
  final TicketListController controller = Get.put(TicketListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ticket List'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            icon: Container(
              width: 40,
                height: 35,
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(90),
                ),
                child: Icon(Icons.add)),
            onPressed: () {
              Get.toNamed('/add_ticket');
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
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.search, color: Colors.deepPurple,),
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
                    )
                )
            ),
            Divider(thickness: 1, color: Colors.blueGrey, indent: MediaQuery.of(context).size.width*0.04, endIndent: MediaQuery.of(context).size.width*0.04, height: 20,),
            Expanded(
              flex: 8,
              child: Container(
                child: Obx(
                      () {
                    if (controller.isLoading.value) {
                      return Center(child: CircularProgressIndicator());
                    } else if (controller.networkError.value) {
                      return Center(child: Text('Network Error. Please check your internet connection.'));
                    } else if (controller.ticketList.isEmpty) {
                      return Center(child: Text('No tickets available.'));
                    }
                    else {
                      return ListView.builder(
                        itemCount: controller.ticketList.length,
                        itemBuilder: (context, index) {
                          final ticket = controller.ticketList[index];
                          // final String phoneNumber = "${lead.mobileNo ?? ''}";
                          // _callPhoneNumber() async {
                          //   final url = 'tel:$phoneNumber';
                          //   try {
                          //     await launchUrl(Uri.parse(url));
                          //   } catch (e) {
                          //     customSnakebar(title: 'Calling Error', description: '$e', color: Colors.red, icon: Icons.error);
                          //     print('Error: $e');
                          //   }
                          // }
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0, right: 8.0, top: 5.0),
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
                                            child: Text(ticket.subject ?? '', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.blueGrey),)),
                                        SizedBox(height: 10,),
                                        Container(
                                            width: MediaQuery.of(context).size.width * 0.4,
                                            child: Text(ticket.message ?? '', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black54),)),
                                        SizedBox(height: 3,),
                                        Container(
                                            width: MediaQuery.of(context).size.width * 0.6,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text('Department: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black54),),
                                                Text(ticket.department ?? '', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black54),),
                                              ],
                                            )),
                                        SizedBox(height: 3,),
                                        Container(
                                            width: MediaQuery.of(context).size.width * 0.6,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text('Service: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black54),),
                                                Text(ticket.service ?? '', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black54),),
                                              ],
                                            )),
                                        SizedBox(height: 3,),
                                        Container(
                                            width: MediaQuery.of(context).size.width * 0.6,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text('Priority: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black54),),
                                                Text(ticket.priority ?? '', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black54),),
                                              ],
                                            )),
                                      ],
                                    ),
                                  ),
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
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            )
          ]
      ),
    );
  }
}
