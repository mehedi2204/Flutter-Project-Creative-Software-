import 'package:easy_somity/app/const/color_constant.dart';
import 'package:easy_somity/app/const/widgets/app_text.dart';
import 'package:easy_somity/app/const/widgets/custom_snakebar.dart';
import 'package:easy_somity/app/modules/dashboard/controller/loan_collection_view_submit_controller.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../const/string_manager.dart';
import '../../../const/widgets/button.dart';
import '../../../const/widgets/button_widgets.dart';
import '../../../const/widgets/user_input_fields.dart';
import '../../dashboard/controller/dps_collection_view_api_controller.dart';
import '../../dashboard/controller/dps_collection_view_submit_api_controller.dart';
import '../../dashboard/controller/loan_collection_view_api_controller.dart';
import '../../signin/loginController.dart';
import 'dps_invoice_view.dart';

class dpsCollectionView extends StatefulWidget {
  String icon;

  dpsCollectionView(this.icon);

  // const LoanCollectionView({Key? key}) : super(key: key);
  @override
  State<dpsCollectionView> createState() => _dpsCollectionViewState();
}

final _formKey = GlobalKey<FormState>();
final TextEditingController _installmentCollectionController =
    TextEditingController();
final TextEditingController _installmentOverdueController =
    TextEditingController();
final TextEditingController _dpsFineController = TextEditingController();
final TextEditingController _dpsNoteController = TextEditingController();

final DpsCollectionController _dpsCollectionController =
    Get.put(DpsCollectionController());
final TextEditingController _searchController = TextEditingController();
final AuthController _authController = Get.put(AuthController());
final DpsCollectionViewSubmitController _dpsCollectionViewSubmitController =
    Get.put(DpsCollectionViewSubmitController());

final String accessToken =
    '${_authController.user.value.accessToken}'; // Replace with actual access token
final String? memberNo = _dpsCollectionController.dpsCollectionData.value.data!
    .memberNo; // Replace with actual member number
final String? loanNo =
    _dpsCollectionController.dpsCollectionData.value.data!.monthlySavingNo;

// Call this method when leaving the screen
void _onBackPressed() {
  _dpsCollectionController.clearData();
  _searchController.clear();
  _installmentCollectionController.clear();
  _installmentOverdueController.clear();
  _dpsFineController.clear();
  _dpsNoteController.clear();
  // You may also navigate away from the screen here
}

int receivableAmount = _dpsCollectionController
        .dpsCollectionData.value.data!.amountPerInstallment ??
    0;
int installmentRecieved =
    _dpsCollectionController.dpsCollectionData.value.totalReceive ?? 0;

// Convert totalCollection to a String
String installmentRecievedString = installmentRecieved.toString();

class _dpsCollectionViewState extends State<dpsCollectionView> {
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
            text: 'DPS Collection View',
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
                                  await _dpsCollectionController
                                      .fetchDpsCollectionData(
                                          accessToken, memberNo);

                                  final dpsData = _dpsCollectionController
                                      .dpsCollectionData.value;

                                  if (dpsData.data!.memberNo != memberNo) {
                                    customSnakebar(
                                        title: 'Member not found',
                                        description: 'Enter Correct Member No',
                                        color: Colors.redAccent,
                                        icon: Icons.error);
                                    _dpsCollectionController
                                        .resetDpsCollectionData();
                                  } else {
                                    _dpsCollectionController.isSearchPerformed
                                        .value = true; // Set the search flag
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
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
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
                    if (_dpsCollectionController.isLoading.value) {
                      return CircularProgressIndicator();
                    } else if (_dpsCollectionController
                        .isSearchPerformed.value) {
                      final dpsData =
                          _dpsCollectionController.dpsCollectionData.value;
                      final installmentDue =
                          receivableAmount - installmentRecieved;
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
                                '${dpsData.data!.memberNo}',
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
                                '${dpsData.data!.memberName}',
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
                                '${dpsData.data!.membersFatherName}',
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
                                '${dpsData.data!.mobileNo}',
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
                                    "Per Installment",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontFamily: GoogleFonts.robotoMono()
                                            .fontFamily),
                                  ),
                                  Container(
                                    height: 45,
                                    width: MediaQuery.of(context).size.width *
                                        0.43,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color:
                                          CustomColor.primary.withOpacity(0.1),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "${dpsData.data!.amountPerInstallment}",
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
                                    "Receivable",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontFamily: GoogleFonts.robotoMono()
                                            .fontFamily),
                                  ),
                                  Container(
                                    height: 45,
                                    width: MediaQuery.of(context).size.width *
                                        0.43,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color:
                                          CustomColor.primary.withOpacity(0.1),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "${dpsData.data!.amountPerInstallment}",
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
                                    "Installment Due",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontFamily: GoogleFonts.robotoMono()
                                            .fontFamily),
                                  ),
                                  Container(
                                    height: 45,
                                    width: MediaQuery.of(context).size.width *
                                        0.43,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color:
                                          CustomColor.primary.withOpacity(0.1),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "${installmentDue}",
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
                                    "Installment Recieved",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontFamily: GoogleFonts.robotoMono()
                                            .fontFamily),
                                  ),
                                  Container(
                                    height: 45,
                                    width: MediaQuery.of(context).size.width *
                                        0.43,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color:
                                          CustomColor.primary.withOpacity(0.1),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "${dpsData.totalReceive}",
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
                                    "Today's Recieved",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontFamily: GoogleFonts.robotoMono()
                                            .fontFamily),
                                  ),
                                  Container(
                                    height: 45,
                                    width: MediaQuery.of(context).size.width *
                                        0.43,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color:
                                          CustomColor.primary.withOpacity(0.1),
                                    ),
                                    child: Center(
                                      child: TextFormField(
                                        controller:
                                            _installmentCollectionController,
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
                                    "Installment Overdue",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontFamily: GoogleFonts.robotoMono()
                                            .fontFamily),
                                  ),
                                  Container(
                                    height: 45,
                                    width: MediaQuery.of(context).size.width *
                                        0.43,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color:
                                          CustomColor.primary.withOpacity(0.1),
                                    ),
                                    child: Center(
                                      child: TextFormField(
                                        controller:
                                            _installmentOverdueController,
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
                                    "Fine for Investment",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontFamily: GoogleFonts.robotoMono()
                                            .fontFamily),
                                  ),
                                  Container(
                                    height: 45,
                                    width: MediaQuery.of(context).size.width *
                                        0.43,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color:
                                          CustomColor.primary.withOpacity(0.1),
                                    ),
                                    child: Center(
                                      child: TextFormField(
                                        controller: _dpsFineController,
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
                                    "Collection Note",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontFamily: GoogleFonts.robotoMono()
                                            .fontFamily),
                                  ),
                                  Container(
                                    height: 45,
                                    width: MediaQuery.of(context).size.width *
                                        0.43,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color:
                                          CustomColor.primary.withOpacity(0.1),
                                    ),
                                    child: Center(
                                      child: TextFormField(
                                        controller: _dpsNoteController,
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
                                        '${_authController.user.value.accessToken}'; // Replace with actual access token
                                    final dps_collection_no =
                                        '${_dpsCollectionController.dpsCollectionData.value.dps_collection_no}';
                                    final memberNo = _searchController.text;
                                    final monthlySavingNo =
                                        '${_dpsCollectionController.dpsCollectionData.value.data!.monthlySavingNo}';
                                    final installmentCollection =
                                        _installmentCollectionController.text;
                                    final installmentOverdue =
                                        _installmentOverdueController.text;
                                    final fine = _dpsFineController.text;
                                    final note = _dpsNoteController.text;

                                    await _dpsCollectionViewSubmitController
                                        .submitOrUpdateDpsCollection(
                                      accessToken,
                                      dps_collection_no,
                                      memberNo,
                                      monthlySavingNo,
                                      installmentCollection,
                                      installmentOverdue,
                                      fine,
                                      note,
                                    );
                                    _installmentCollectionController.text = '';
                                    _installmentOverdueController.text = '';
                                    _dpsFineController.text = '';
                                    _dpsNoteController.text = '';

                                    await _dpsCollectionController
                                        .fetchDpsCollectionData(
                                            accessToken, memberNo);

                                    final dpsData = _dpsCollectionController
                                        .dpsCollectionData.value;

                                    if (dpsData.data!.memberNo != memberNo) {
                                      //customSnakebar(title: 'Member Search Error', description: 'Member Not Found', color: Colors.deepPurple, icon: Icons.error);
                                      _dpsCollectionController
                                          .resetDpsCollectionData();
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
                                    Get.to(() => DpsInvoiceView());
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
                          SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Obx(() {
                              return _dpsCollectionViewSubmitController
                                      .isLoading.value
                                  ? CircularProgressIndicator()
                                  : SizedBox();
                            }),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      );
                    } else {
                      return SizedBox
                          .shrink(); // Render an empty widget when no search is performed
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
