import 'package:crm/app/modules/leads_list/lead_list_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class LeadDetailScreen extends StatelessWidget {
  final LeadList lead;

  LeadDetailScreen(this.lead);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.person, color: Colors.white, size: 30,)),
                SizedBox(width: 10),
                Column(
                  //mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width / 2,
                          child: Text('${lead.customerName ?? ''}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.black))),
                      SizedBox(height: 5),
                      Container(
                          width: MediaQuery.of(context).size.width / 2,
                          child: Text('${lead.customer?.businessName ?? ''}',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold))),
                    ]),
                Spacer(),
                Icon(Icons.more_vert, color: Colors.deepPurple, size: 30,)
              ],
            ),
            Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 8),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width,
                          child: Text('Business Role',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Colors.black))),
                      SizedBox(height: 10),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('${lead.customer?.businessRole ?? ''}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black.withOpacity(.7),
                                  )),
                              Icon(Icons.perm_identity, color: Colors.deepPurple, size: 20,),
                            ],
                          )),
                    ]),
              ),
            ),
            // Card(
            //   elevation: 4,
            //   child: Padding(
            //     padding: const EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 8),
            //     child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Container(
            //               width: MediaQuery.of(context).size.width,
            //               child: Text('Business Industry',
            //                   style: TextStyle(
            //                       fontWeight: FontWeight.w500,
            //                       fontSize: 16,
            //                       color: Colors.black))),
            //           SizedBox(height: 10),
            //           Container(
            //               width: MediaQuery.of(context).size.width,
            //               child: Row(
            //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                 children: [
            //                   Text('${lead.customer.industries?.name ?? ''}',
            //                       style: TextStyle(
            //                         fontSize: 16,
            //                         color: Colors.black.withOpacity(.7),
            //                       )),
            //                   Icon(Icons.business, color: Colors.deepPurple, size: 20,),
            //                 ],
            //               )),
            //         ]),
            //   ),
            // ),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 8),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width,
                          child: Text('Mobile No',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Colors.black))),
                      SizedBox(height: 10),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('${lead.mobileNo ?? ''}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black.withOpacity(.7),
                                  )),
                              Icon(Icons.call, color: Colors.deepPurple, size: 20,),
                            ],
                          )),
                    ]),
              ),
            ),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 8),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width,
                          child: Text('Email',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Colors.black))),
                      SizedBox(height: 10),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('${lead.email ?? 'N/A'}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black.withOpacity(.7),
                                  )),
                              Icon(Icons.email, color: Colors.deepPurple, size: 20,),
                            ],
                          )),
                    ]),
              ),
            ),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 8),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width,
                          child: Text('Customer Website',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Colors.black))),
                      SizedBox(height: 10),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('${lead.customer?.website ?? 'N/A'}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black.withOpacity(.7),
                                  )),
                              Icon(CupertinoIcons.globe, color: Colors.deepPurple, size: 20,),
                            ],
                          )),
                    ]),
              ),
            ),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 8),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width,
                          child: Text('Address',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Colors.black))),
                      SizedBox(height: 10),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('${lead.customer?.address ?? 'N/A'}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black.withOpacity(.7),
                                  )),
                              Icon(Icons.location_on, color: Colors.deepPurple, size: 20,),
                            ],
                          )),
                    ]),
              ),
            ),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 8),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width,
                          child: Text('Country',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Colors.black))),
                      SizedBox(height: 10),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('${lead.countries?.name ?? ''}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black.withOpacity(.7),
                                  )),
                              Icon(Icons.flag, color: Colors.deepPurple, size: 20,),
                            ],
                          )),
                    ]),
              ),
            ),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 8),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width,
                          child: Text('Product',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Colors.black))),
                      SizedBox(height: 10),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('${lead.product?.productName ?? ''}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black.withOpacity(.7),
                                  )),
                              Icon(Icons.shopping_cart, color: Colors.deepPurple, size: 20,),
                            ],
                          )),
                    ]),
              ),
            ),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 8),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width,
                          child: Text('Customer Group',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Colors.black))),
                      SizedBox(height: 10),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('${lead.clientGroup?.clientGroupName ?? ''}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black.withOpacity(.7),
                                  )),
                              Icon(Icons.label_important, color: Colors.deepPurple, size: 20,),
                            ],
                          )),
                    ]),
              ),
            ),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 8),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width,
                          child: Text('Lead Sources',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Colors.black))),
                      SizedBox(height: 10),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('${lead.leadSources ?? 'N/A'}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black.withOpacity(.7),
                                  )),
                              Icon(Icons.leak_add, color: Colors.deepPurple, size: 20,),
                            ],
                          )),
                    ]),
              ),
            ),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 8),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width,
                          child: Text('Status',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Colors.black))),
                      SizedBox(height: 10),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('${lead.status ?? 'N/A'}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black.withOpacity(.7),
                                  )),
                              Icon(CupertinoIcons.arrow_up_doc, color: Colors.deepPurple, size: 20,),
                            ],
                          )),
                    ]),
              ),
            ),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 8),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width,
                          child: Text('Assigned By',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Colors.black))),
                      SizedBox(height: 10),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('${lead.users?.name ?? ''}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black.withOpacity(.7),
                                  )),
                              Icon(Icons.person, color: Colors.deepPurple, size: 20,),
                            ],
                          )),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}