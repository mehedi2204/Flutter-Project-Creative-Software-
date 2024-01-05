import 'package:easy_somity/app/const/color_constant.dart';
import 'package:easy_somity/app/const/widgets/app_text.dart';
import 'package:easy_somity/app/modules/dashboard/controller/loan_collection_view_submit_controller.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../dashboard/controller/datewise_loan_report_api_controller.dart';
import '../dashboard/controller/loan_report_api_controller.dart';
import '../signin/loginController.dart';

class loanCollectionReportView extends StatefulWidget {
  String icon;

  loanCollectionReportView(this.icon);

  // const LoanCollectionView({Key? key}) : super(key: key);
  @override
  State<loanCollectionReportView> createState() =>
      _loanCollectionReportViewState();
}


class _loanCollectionReportViewState extends State<loanCollectionReportView> {

  String fromDateText = '';
  String toDateText = '';

  DateTime? fromDate;
  DateTime? toDate;

  final DatewiseLoanReportController loanController = Get.put(DatewiseLoanReportController());

  Future<void> _selectFromDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: fromDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      final formattedDate = DateFormat('yyyy-MM-dd').format(picked);
      setState(() {
        loanController.fromDateController.text = formattedDate;
        fromDateText = formattedDate;
      });
    }
  }

  Future<void> _selectToDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: toDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      final formattedDate = DateFormat('yyyy-MM-dd').format(picked);
      setState(() {
        loanController.toDateController.text = formattedDate;
        toDateText = formattedDate;
      });
    }
  }


  void _showPopup(BuildContext context) {
    int isClose = 0;
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
          height: MediaQuery.of(context).size.height * 0.5,
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      'Loan Collection Report Filter',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.close))
                ],
              ),
              SizedBox(height: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 20,
                    //width: MediaQuery.of(context).size.width * 0.4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('From Date',style: TextStyle(
                            fontFamily: GoogleFonts.robotoMono().fontFamily,
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),),
                        SizedBox(width: 5),
                        Text(
                          "*",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    //width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: TextFormField(
                      style: TextStyle(fontWeight: FontWeight.bold),
                      controller: loanController.fromDateController,
                      readOnly: true,
                      onTap: () => _selectFromDate(context),
                      decoration: InputDecoration(
                          suffixIcon: Icon(Icons.calendar_month),
                          hintText: 'Select From Date',
                          hintStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          )
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 20,
                   //width: MediaQuery.of(context).size.width * 0.4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('To Date',style: TextStyle(
                            fontFamily: GoogleFonts.robotoMono().fontFamily,
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),),
                        SizedBox(width: 5),
                        Text(
                          "*",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    //width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: TextFormField(
                      style: TextStyle(fontWeight: FontWeight.bold),
                      controller: loanController.toDateController,
                      readOnly: true,
                      onTap: () => _selectToDate(context),
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.calendar_month),
                          hintText: 'Select To Date',
                          hintStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          )
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30,),
              GestureDetector(
                onTap: () async {
                  setState(() {
                    fromDateText = loanController.fromDateController.text;
                    toDateText = loanController.toDateController.text;
                  });
                  Navigator.pop(context);

                  loanController.fetchMemberData();
                  if (loanController.memberData.isEmpty) {
                    Fluttertoast.showToast(
                      msg: "No Data Found",
                    );
                  }
                },
                child: Container(
                  height: 50,
                  // width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                      color: isClose == 0
                          ? CustomColor.primary
                          : Colors.transparent,
                      border: Border.all(
                          width: 2, color: Colors.grey[600]!),
                      borderRadius: BorderRadius.all(
                          Radius.circular(20))),
                  child: Center(
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment.center,
                      children: [
                        // Icon(Icons.search),
                        AppText(
                          text: 'Submit',
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: isClose == 0
                              ? CustomColor.white
                              : Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }


  @override
  void initState() {
    super.initState();
    loanController.fetchInitialData();
    if (loanController.memberData.isEmpty) {
      Fluttertoast.showToast(
        msg: "No Data Found",
      );
    }
    // Initialize fromDate and toDate with the last 7 days
    final currentDate = DateTime.now();
    final sevenDaysAgo = currentDate.subtract(Duration(days: 7));
    final formattedFromDate = DateFormat('yyyy-MM-dd').format(sevenDaysAgo);
    final formattedToDate = DateFormat('yyyy-MM-dd').format(currentDate);
    setState(() {
      fromDateText = formattedFromDate;
      toDateText = formattedToDate;
      loanController.fromDateController.text = formattedFromDate;
      loanController.toDateController.text = formattedToDate;
      fromDate = sevenDaysAgo;
      toDate = currentDate;
    });
  }

  Widget build(BuildContext context) {
    int isClose = 0;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            child: IconButton(
              onPressed: () {
                _showPopup(context);
              },
              icon: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent,
                  borderRadius: BorderRadius.circular(90.0),
                ),
                child: Icon(Icons.filter_list)
            ),
            ),
          )
        ],
        title: AppText(
          text: 'Loan Collection Report View',
          color: CustomColor.white,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        backgroundColor: CustomColor.primary,
      ),
      body: Column(
        children: [
          Container(
            height: 50,
            width: double.infinity,
            color: CustomColor.primary.withOpacity(0.1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("From Date: $fromDateText", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),),
                  Text("To Date: $toDateText", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),),
                ],
              )),
          Expanded(
            child: Obx(
                  () => ListView.builder(
                itemCount: loanController.memberData.length,
                itemBuilder: (context, index) {

                  String apiDateTime = "${loanController.memberData[index].createdAt}";
// Parse the API datetime string
                  DateTime parsedDateTime = DateTime.parse(apiDateTime);
// Format the date
                  String formattedDate = DateFormat.yMd().format(parsedDateTime);
// Format the time in 12-hour clock format with AM/PM
                  String formattedTime = DateFormat.jm().format(parsedDateTime);
                  String idCheck = loanController.memberData[index].id.toString();

                  final data = loanController.memberData[index];
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Card(
                      color: Colors.grey[200],
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(child: Text("Account No: ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.grey[600]),)),
                                Expanded(child: Text(data.memberNo ?? '', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)),
                              ],
                            ),
                            SizedBox(height: 3,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(child: Text("Loan Collection No: ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.grey[600]),)),
                                Expanded(child: Text(data.installmentCollectionsNo ?? '', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)),
                              ],
                            ),
                            SizedBox(height: 3,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(child: Text("Name: ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.grey[600]),)),
                                Expanded(child: Text(data.member!.memberName ?? '', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)),
                              ],
                            ),
                            SizedBox(height: 3,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(child: Text("Loan No: ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.grey[600]),)),
                                Expanded(child: Text(data.loanNo ?? '', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)),
                              ],
                            ),
                            SizedBox(height: 3,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(child: Text("Today's Collection: ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.grey[600]),)),
                                Expanded(child: Text(data.installmentCollection ?? '', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)),
                              ],
                            ),
                            SizedBox(height: 3,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(child: Text("Previous Due: ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.grey[600]),)),
                                Expanded(child: Text(data.previousDue ?? '', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)),
                              ],
                            ),
                            SizedBox(height: 3,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(child: Text("Fine: ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.grey[600]),)),
                                Expanded(child: Text(data.fine ?? '', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)),
                              ],
                            ),
                            SizedBox(height: 3,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(child: Text("Note: ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.grey[600]),)),
                                Expanded(child: Text(data.note ?? '', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)),
                              ],
                            ),
                            SizedBox(height: 3,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(child: Text("Date: ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.grey[600]),)),
                                Expanded(child: Text(formattedDate ?? '', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                  //   ListTile(
                  //   title: Text(data.memberNo ?? ''),
                  //   subtitle: Text(data.date ?? ''),
                  //   // Add more fields as needed
                  // );
                },
              ),
            ),
          ),
        ]
      ),
    );
  }
}
