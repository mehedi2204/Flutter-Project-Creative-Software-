import 'package:easy_somity/app/const/color_constant.dart';
import 'package:easy_somity/app/const/widgets/app_text.dart';
import 'package:easy_somity/app/modules/dashboard/controller/loan_collection_view_submit_controller.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../const/string_manager.dart';
import '../../../const/widgets/button.dart';
import '../../../const/widgets/button_widgets.dart';
import '../../../const/widgets/custom_snakebar.dart';
import '../../../const/widgets/user_input_fields.dart';
import '../../dashboard/controller/loan_collection_view_api_controller.dart';
import '../../signin/loginController.dart';
import 'invoice_sharing.dart';
import 'loan_invoice_view.dart';

class LoanCollectionView extends StatefulWidget {
  String icon;

  LoanCollectionView(this.icon);

  // const LoanCollectionView({Key? key}) : super(key: key);
  @override
  State<LoanCollectionView> createState() => _LoanCollectionViewState();
}

final _formKey = GlobalKey<FormState>();
final TextEditingController _todayCollectionController =
    TextEditingController();
final TextEditingController _previousDueController = TextEditingController();
final TextEditingController _fineController = TextEditingController();
final TextEditingController _noteController = TextEditingController();

final LoanCollectionController _loanCollectionController =
    Get.put(LoanCollectionController());
final TextEditingController _searchController = TextEditingController();
final AuthController _authController = Get.put(AuthController());
final LoanCollectionViewSubmitController _loanCollectionViewSubmitController =
    Get.put(LoanCollectionViewSubmitController());

final String accessToken =
    '${_authController.user.value.accessToken}'; // Replace with actual access token
final String? memberNo = _loanCollectionController.loanCollectionData.value
    .data!.memberNo; // Replace with actual member number
final String? loanNo =
    _loanCollectionController.loanCollectionData.value.data!.loanNo;

// Call this method when leaving the screen
void _onBackPressed() {
  _loanCollectionController.clearData();
  _searchController.clear();
  _todayCollectionController.clear();
  _previousDueController.clear();
  _fineController.clear();
  _noteController.clear();
  // You may also navigate away from the screen here
}
String? totalAmountString = _loanCollectionController.loanCollectionData.value.data!.totalAmount;
int totalCollection = _loanCollectionController.loanCollectionData.value.totalCollection ?? 0; // Assuming totalCollection is an int
String? installmentAmountString = _loanCollectionController.loanCollectionData.value.data!.installmentAmount;
int installmentAmount = int.parse(installmentAmountString!);
String todayCollectionTextString = _todayCollectionController.text;
int todayCollectionText = int.parse(todayCollectionTextString);

// Convert totalCollection to a String
String totalCollectionString = totalCollection.toString();

// Now you can proceed with your calculations
int totalAmount = int.parse(totalAmountString!);
int totalCollectionParsed = int.parse(totalCollectionString);

class _LoanCollectionViewState extends State<LoanCollectionView> {
  @override
  Widget build(BuildContext context) {
    int isClose = 0;
    return WillPopScope(
      onWillPop: () async {
        _onBackPressed();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: AppText(
            text: 'Loan Collection View',
            color: CustomColor.white,
            fontWeight: FontWeight.bold,
          ),
          centerTitle: true,
          backgroundColor: CustomColor.primary,
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Row(children: [
                      Text(
                        "Member No",
                        style: TextStyle(
                            fontFamily: GoogleFonts.robotoMono().fontFamily,
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 5),
                      Text(
                        "*",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ]),
                  ),
                  Container(
                      height: 50,
                      //width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: TextFormField(
                                style: TextStyle(fontWeight: FontWeight.bold),
                                controller: _searchController,
                                decoration: InputDecoration(
                                    hintText: 'Enter Member No',
                                    hintStyle: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10.0),
                                          topLeft: Radius.circular(10.0)),
                                    )),
                              ),
                            ),
                            SizedBox(
                              height: 55,
                              child: ElevatedButton(
                                onPressed: () async {
                                  final accessToken =
                                      '${_authController.user.value.accessToken}'; // Replace with actual access token
                                  final memberNo = _searchController.text;
                                  await _loanCollectionController
                                      .fetchLoanCollectionData(
                                          accessToken, memberNo);

                                  final loanData = _loanCollectionController
                                      .loanCollectionData.value;

                                  if (loanData.data!.memberNo != memberNo) {
                                    customSnakebar(
                                        title: 'Member not found',
                                        description: 'Enter Correct Member No',
                                        color: Colors.redAccent,
                                        icon: Icons.error);
                                    _loanCollectionController
                                        .resetLoanCollectionData();
                                  }
                                  else {
                                    _loanCollectionController.isSearchPerformed.value = true; // Set the search flag
                                  }
                                },
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        CustomColor.primary),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(10.0),
                                          topRight: Radius.circular(10.0)),
                                    ))),
                                child: Text(
                                  'Search',
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(
                    color: Colors.grey,
                    thickness: 1.5,
                  ),
                  Obx(() {
                    if (_loanCollectionController.isLoading.value) {
                      return CircularProgressIndicator();
                    } else if (_loanCollectionController.isSearchPerformed.value){
                      final loanData =
                          _loanCollectionController.loanCollectionData.value;
                      final balance = totalAmount - totalCollectionParsed;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Account No: ',
                                style: TextStyle(
                                    fontFamily:
                                        GoogleFonts.robotoMono().fontFamily,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black.withOpacity(0.6)),
                              ),
                              Text(
                                '${loanData.data!.memberNo}',
                                style: TextStyle(
                                    fontFamily:
                                        GoogleFonts.robotoMono().fontFamily,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.black87),
                                textAlign: TextAlign.right,
                              ),
                              //SizedBox(width: MediaQuery.of(context).size.width * 0.33,),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Name: ',
                                style: TextStyle(
                                    fontFamily:
                                        GoogleFonts.robotoMono().fontFamily,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black.withOpacity(0.6)),
                              ),
                              Text(
                                '${loanData.data!.memberName}',
                                style: TextStyle(
                                    fontFamily:
                                        GoogleFonts.robotoMono().fontFamily,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.black87),
                                textAlign: TextAlign.right,
                              ),
                              //SizedBox(width: MediaQuery.of(context).size.width * 0.33,),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Father's Name: ",
                                style: TextStyle(
                                    fontFamily:
                                        GoogleFonts.robotoMono().fontFamily,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black.withOpacity(0.6)),
                              ),
                              Text(
                                '${loanData.data!.membersFatherName}',
                                style: TextStyle(
                                    fontFamily:
                                        GoogleFonts.robotoMono().fontFamily,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.black87),
                                textAlign: TextAlign.right,
                              ),
                              //SizedBox(width: MediaQuery.of(context).size.width * 0.33,),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Mobile: ",
                                style: TextStyle(
                                    fontFamily:
                                        GoogleFonts.robotoMono().fontFamily,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black.withOpacity(0.6)),
                              ),
                              Text(
                                '${loanData.data!.mobileNo}',
                                style: TextStyle(
                                    fontFamily:
                                        GoogleFonts.robotoMono().fontFamily,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.black87),
                                textAlign: TextAlign.right,
                              ),
                              //SizedBox(width: MediaQuery.of(context).size.width * 0.33,),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Divider(
                            color: Colors.grey,
                            thickness: 1.5,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Installment Amount",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontFamily:
                                            GoogleFonts.robotoMono().fontFamily),
                                  ),
                                  Container(
                                    height: 45,
                                    width:
                                        MediaQuery.of(context).size.width * 0.43,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: CustomColor.primary.withOpacity(0.1),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "${loanData.data!.installmentAmount}",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.black,
                                            fontFamily: GoogleFonts.robotoMono()
                                                .fontFamily),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Loan Amount",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontFamily:
                                            GoogleFonts.robotoMono().fontFamily),
                                  ),
                                  Container(
                                    height: 45,
                                    width:
                                        MediaQuery.of(context).size.width * 0.43,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: CustomColor.primary.withOpacity(0.1),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "${loanData.data!.totalAmount}",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.black,
                                            fontFamily: GoogleFonts.robotoMono()
                                                .fontFamily),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Total Collection",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontFamily:
                                            GoogleFonts.robotoMono().fontFamily),
                                  ),
                                  Container(
                                    height: 45,
                                    width:
                                        MediaQuery.of(context).size.width * 0.43,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: CustomColor.primary.withOpacity(0.1),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "${loanData.totalCollection}",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.black,
                                            fontFamily: GoogleFonts.robotoMono()
                                                .fontFamily),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Balance",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontFamily:
                                            GoogleFonts.robotoMono().fontFamily),
                                  ),
                                  Container(
                                    height: 45,
                                    width:
                                        MediaQuery.of(context).size.width * 0.43,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: CustomColor.primary.withOpacity(0.1),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "${balance}",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.black,
                                            fontFamily: GoogleFonts.robotoMono()
                                                .fontFamily),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Today Collection",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontFamily:
                                            GoogleFonts.robotoMono().fontFamily),
                                  ),
                                  Container(
                                    height: 45,
                                    width:
                                        MediaQuery.of(context).size.width * 0.43,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: CustomColor.primary.withOpacity(0.1),
                                    ),
                                    child: Center(
                                      child: TextFormField(
                                        controller: _todayCollectionController,
                                        decoration: InputDecoration(
                                          hintText: '0.00',
                                          hintStyle: TextStyle(
                                              fontWeight: FontWeight.w600),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Previous Due",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontFamily:
                                            GoogleFonts.robotoMono().fontFamily),
                                  ),
                                  Container(
                                    height: 45,
                                    width:
                                        MediaQuery.of(context).size.width * 0.43,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: CustomColor.primary.withOpacity(0.1),
                                    ),
                                    child: Center(
                                      child: TextFormField(
                                        controller: _previousDueController,
                                        decoration: InputDecoration(
                                          hintText: '0.00',
                                          hintStyle: TextStyle(
                                              fontWeight: FontWeight.w600),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Fine",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontFamily:
                                            GoogleFonts.robotoMono().fontFamily),
                                  ),
                                  Container(
                                    height: 45,
                                    width:
                                        MediaQuery.of(context).size.width * 0.43,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: CustomColor.primary.withOpacity(0.1),
                                    ),
                                    child: Center(
                                      child: TextFormField(
                                        controller: _fineController,
                                        decoration: InputDecoration(
                                          hintText: '0.00',
                                          hintStyle: TextStyle(
                                              fontWeight: FontWeight.w600),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Note",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontFamily:
                                            GoogleFonts.robotoMono().fontFamily),
                                  ),
                                  Container(
                                    height: 45,
                                    width:
                                        MediaQuery.of(context).size.width * 0.43,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: CustomColor.primary.withOpacity(0.1),
                                    ),
                                    child: Center(
                                      child: TextFormField(
                                        controller: _noteController,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () async {
                                    final accessToken =
                                        '${_authController.user.value.accessToken}';
                                    final installmentCollectionNo = _loanCollectionController.loanCollectionData.value.installmentCcollectionNo;
                                    final memberNo = _searchController.text;
                                    final loanNo = _loanCollectionController
                                        .loanCollectionData.value.data!.loanNo;
                                    final installmentCollection =
                                        _todayCollectionController.text;
                                    final previousDue =
                                        _previousDueController.text;
                                    final fine = _fineController.text;
                                    final note = _noteController.text;
                                    //final installmentAmount = _loanCollectionController.loanCollectionData.value.installmentCollection;

                                       await _loanCollectionViewSubmitController
                                           .submitOrUpdateLoanCollection(
                                         accessToken,
                                         installmentCollectionNo!,
                                         memberNo,
                                         loanNo!,
                                         installmentCollection,
                                         previousDue,
                                         fine,
                                         note,
                                       );
                                       _todayCollectionController.text = '';
                                       _previousDueController.text = '';
                                       _fineController.text = '';
                                       _noteController.text = '';


                                       await _loanCollectionController
                                           .fetchLoanCollectionData(
                                           accessToken, memberNo);

                                       final loanData = _loanCollectionController
                                           .loanCollectionData.value;

                                       if (loanData.data!.memberNo != memberNo) {
                                         _loanCollectionController
                                             .resetLoanCollectionData();
                                       }
                                       else {
                                         _loanCollectionController.isSearchPerformed.value = true; // Set the search flag
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
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    Get.to(() => LoanInvoiceView());
                                    isClose = 1;
                                    print(isClose);
                                  },
                                  child: Container(
                                    height: 50,
                                    // width: MediaQuery.of(context).size.width * 0.9,
                                    decoration: BoxDecoration(
                                        color: isClose == 1
                                            ? CustomColor.dGreen
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
                                            text: 'Print Report',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: isClose == 1
                                                ? CustomColor.white
                                                : Colors.black,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Center(
                            child: Obx(() {
                              return _loanCollectionViewSubmitController.isLoading.value
                                  ? CircularProgressIndicator()
                                  : SizedBox();
                            }),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      );
                    }
                    else {
                      return SizedBox.shrink(); // Render an empty widget when no search is performed
                    }
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
