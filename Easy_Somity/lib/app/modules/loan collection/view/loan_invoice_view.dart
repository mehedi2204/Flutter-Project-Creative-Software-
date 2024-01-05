import 'package:dotted_border/dotted_border.dart';
import 'package:easy_somity/app/const/color_constant.dart';
import 'package:easy_somity/app/const/widgets/app_text.dart';
import 'package:easy_somity/app/modules/loan%20collection/view/loan_invoice_view_pos_print.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../../../const/widgets/app_text.dart';
import '../../dashboard/controller/loan_collection_controller.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:share/share.dart';

import '../../dashboard/controller/loan_collection_view_api_controller.dart';
import '../../dashboard/controller/loan_report_api_controller.dart';
import '../../signin/loginController.dart';

class LoanInvoiceView extends StatefulWidget {
  const LoanInvoiceView({Key? key}) : super(key: key);

  @override
  State<LoanInvoiceView> createState() => _LoanInvoiceViewState();
}

final LoanCollectionReportController controller =
    Get.put(LoanCollectionReportController());
final AuthController _authController = Get.put(AuthController());
final LoanCollectionController _loanCollectionController =
    Get.put(LoanCollectionController());

String? totalAmountString =
    _loanCollectionController.loanCollectionData.value.data!.totalAmount;
int totalCollection =
    _loanCollectionController.loanCollectionData.value.totalCollection ??
        0; // Assuming totalCollection is an int

// Convert totalCollection to a String
String totalCollectionString = totalCollection.toString();

// Now you can proceed with your calculations
int totalAmount = int.parse(totalAmountString!);
int totalCollectionParsed = int.parse(totalCollectionString);


String apiDateTime = "${controller.data.value.createdAt}";

// Parse the API datetime string
DateTime parsedDateTime = DateTime.parse(apiDateTime);

// Format the date
String formattedDate = DateFormat.yMd().format(parsedDateTime);

// Format the time in 12-hour clock format with AM/PM
String formattedTime = DateFormat.jm().format(parsedDateTime);

class _LoanInvoiceViewState extends State<LoanInvoiceView> {
  @override
  void initState() {
    super.initState();
    // Fetch data when the screen loads
    controller
        .fetchLoanCollectionReport('${_authController.user.value.accessToken}');
  }



  Future<File> generateAndSavePDF() async {
    final ttfFont = await rootBundle.load("assets/Siyam Rupali ANSI.ttf");
    final customFont = pw.Font.ttf(ttfFont);
    final PdfColor borderColor = PdfColors.grey;
    final pdf = pw.Document();

    pdf.addPage(pw.Page(
      build: (pw.Context context) {
        return pw.Container(
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              // Add your PDF content here, you can use pw.Text, pw.Table, etc.
              // Example:
              pw.SizedBox(
                height: 20,
              ),
              pw.Center(
                child: pw.Text(
                  'mnR mÂq I FY `vb mgevq mwgwZ',
                  style: pw.TextStyle(
                    font: customFont,
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 22,
                  ),
                  textAlign: pw.TextAlign.center,
                ),
              ),
              pw.Center(
                child: pw.Text(
                  '${controller.company.value.address ?? ''}',
                  style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 16,
                  ),
                  textAlign: pw.TextAlign.center,
                ),
              ),
              pw.Center(
                child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.center,
                  children: [
                    pw.Text(
                      'Contact No:',
                      style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    pw.SizedBox(
                      width: 5,
                    ),
                    pw.Text(
                      '${controller.company.value.number ?? ''}',
                      style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold,
                        fontSize: 14,
                      )
                    ),
                  ],
                ),
              ),
              pw.SizedBox(
                height: 10,
              ),
              pw.Center(
                child: pw.Text(
                  "Loan Collection Invoice",
                  style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 20,
                  ),
                  textAlign: pw.TextAlign.center,
                ),
              ),
              pw.Divider(
                thickness: 2,
                color: borderColor,
              ),
              pw.SizedBox(
                height: 10,
              ),
              pw.Row(
                children: [
                  pw.Text(
                    'Date:',
                    style: pw.TextStyle(
                      fontSize: 16,
                    ),
                    // fontWeight: FontWeight.bold,
                  ),
                  pw.Text(
                    '${formattedDate},',
                    style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      fontSize: 16,
                    )
                  ),
                  pw.SizedBox(
                    width: 20,
                  ),
                  pw.Text(
                    'Time:',
                    style: pw.TextStyle(
                      fontSize: 16,
                    )
                  ),
                  pw.Text(
                    '${formattedTime}',
                    style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      fontSize: 16,
                    )
                  ),
                ],
              ),
              pw.SizedBox(
                height: 10,
              ),
              pw.Row(
                children: [
                  pw.Text(
                    'Account No:',
                    // fontWeight: FontWeight.bold,
                    style: pw.TextStyle(
                      fontSize: 16,
                    )
                  ),
                  pw.Text(
                    '${controller.data.value.member!.memberNo ?? ''}',
                    style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      fontSize: 16,
                    )
                  ),
                ],
              ),
              pw.SizedBox(
                height: 10,
              ),
              pw.Row(
                children: [
                  pw.Text(
                    'Name:',
                    // fontWeight: FontWeight.bold,
                    style: pw.TextStyle(
                      fontSize: 16,
                    )
                  ),
                  pw.Text(
                    '${controller.data.value.member!.memberName ?? ''}',
                    style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      fontSize: 16,
                    )
                  ),
                ],
              ),
              pw.SizedBox(
                height: 10,
              ),
              pw.Row(
                children: [
                  pw.Text(
                    "Father's Name:",
                    // fontWeight: FontWeight.bold,
                    style: pw.TextStyle(
                      fontSize: 16,
                    )
                  ),
                  pw.Text(
                    '${controller.data.value.member!.membersFatherName ?? ''}',
                    style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      fontSize: 16,
                    )
                  ),
                ],
              ),
              pw.SizedBox(
                height: 10,
              ),
              pw.Row(
                children: [
                  pw.Text(
                    "Phone:",
                    // fontWeight: FontWeight.bold,
                    style: pw.TextStyle(
                      fontSize: 16,
                    )
                  ),
                  pw.Text(
                    '${controller.data.value.member!.mobileNo ?? ''}',
                    style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      fontSize: 16,
                    )
                  ),
                ],
              ),
              pw.SizedBox(
                height: 10,
              ),
              pw.Row(
                children: [
                  pw.Text(
                    "Loan Collection No:",
                    // fontWeight: FontWeight.bold,
                    style: pw.TextStyle(
                      fontSize: 16,
                    )
                  ),
                  pw.Text(
                    '${controller.data.value.installmentCollectionsNo ?? ''}',
                    style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      fontSize: 16,
                    )
                  ),
                ],
              ),
              pw.SizedBox(
                height: 10,
              ),
              pw.Divider(
                thickness: 2,
                color: borderColor,
              ),
              pw.SizedBox(
                height: 10,
              ),
                pw.Container(
                  padding: pw.EdgeInsets.only(
                      left: 20, top: 20, bottom: 20, right: 10),
                  // decoration: BoxDecoration(
                  //   border: Border.all(
                  //     color: CustomColor.grey,
                  //     width: 3
                  //
                  //   ),
                  // ),
                  child: pw.Container(
                    padding: pw.EdgeInsets.all(8.0),
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(
                        color: borderColor, // Border color is red
                        width: 2.0, // Border width
                        style: pw.BorderStyle.solid, // Solid line style
                      ),
                      borderRadius: pw.BorderRadius.circular(8.0),),
                    child: pw.Column(
                      children: [
                        pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Text(
                                "Installment Amount:",
                                style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold,
                                  fontSize: 16,
                                )
                            ),
                            pw.Text(
                                '${controller.amountPerInstallment.value.installmentAmount ?? ''}',
                                style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold,
                                  fontSize: 16,
                                )
                            ),
                          ],
                        ),
                        pw.SizedBox(
                          height: 10,
                        ),
                        pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Text(
                                "Loan Amount:",
                                style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold,
                                  fontSize: 16,
                                )
                            ),
                            pw.Text(
                                '${_loanCollectionController.loanCollectionData.value.data!.totalAmount}',
                                style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold,
                                  fontSize: 16,
                                )
                            ),
                          ],
                        ),
                        pw.SizedBox(
                          height: 10,
                        ),
                        pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Text(
                                "Today's Collection:",
                                style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold,
                                  fontSize: 16,
                                )
                            ),
                            pw.Text(
                                '${controller.data.value.installmentCollection ?? '0.0'}',
                                style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold,
                                  fontSize: 16,
                                )
                            ),
                          ],
                        ),
                        pw.SizedBox(
                          height: 10,
                        ),
                        pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Text(
                                "Total Collection:",
                                style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold,
                                  fontSize: 16,
                                )
                            ),
                            pw.Text(
                                '${_loanCollectionController.loanCollectionData.value.totalCollection ?? '0.0'}',
                                style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold,
                                  fontSize: 16,
                                )
                            ),
                          ],
                        ),
                        pw.SizedBox(
                          height: 10,
                        ),
                        pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Text(
                                "Balance:",
                                style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold,
                                  fontSize: 16,
                                )
                            ),
                            pw.Text(
                                '${totalAmount-totalCollectionParsed}',
                                style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold,
                                  fontSize: 16,
                                )
                            ),
                          ],
                        ),
                        pw.SizedBox(
                          height: 10,
                        ),
                        pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Text(
                                "Previous Due:",
                                style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold,
                                  fontSize: 16,
                                )
                            ),
                            pw.Text(
                                '${controller.data.value.previousDue ?? '0.0'}',
                                style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold,
                                  fontSize: 16,
                                )
                            ),
                          ],
                        ),
                        pw.SizedBox(
                          height: 10,
                        ),
                        pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Text(
                                "Fine:",
                                style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold,
                                  fontSize: 16,
                                )
                            ),
                            pw.Text(
                                '${controller.data.value.fine ?? '0.0'}',
                                style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold,
                                  fontSize: 16,
                                )
                            ),
                          ],
                        ),
                        pw.SizedBox(
                          height: 10,
                        ),
                        pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Text(
                                "Note:",
                                style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold,
                                  fontSize: 16,
                                )
                            ),
                            pw.Text(
                                '${controller.data.value.note ?? ''}',
                                style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold,
                                  fontSize: 16,
                                )
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

              pw.SizedBox(
                height: 20,
              ),
              // Add more data as needed...
            ],
          ),
        );
      },
    ));

    // Get the app's temporary directory
    final output = await getTemporaryDirectory();
    final pdfFile = File("${output.path}/loan_invoice_(${controller.data.value.member!.memberName}).pdf");

    // Save the PDF to the temporary directory
    await pdfFile.writeAsBytes(await pdf.save());

    return pdfFile;
  }

  @override
  Widget build(BuildContext context) {
    int isClose = 0;
    return SafeArea(
      child: Scaffold(
        body: Obx(() {
          if (controller.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          } else {
            var balance = totalAmount - totalCollectionParsed;
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                shrinkWrap: true,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: AppText(
                      text: '${controller.company.value.name ?? ''}',
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Center(
                    child: AppText(
                      text: '${controller.company.value.address ?? ''}',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(
                          text: 'Contact No:',
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        AppText(
                          text: '${controller.company.value.number ?? ''}',
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: AppText(
                      text: "Loan Collection Invoice",
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Divider(
                    thickness: 2,
                    color: CustomColor.grey,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      AppText(
                        text: 'Date:',
                        // fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      AppText(
                        text: '${formattedDate},',
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      AppText(
                        text: 'Time:',
                      ),
                      AppText(
                        text: '${formattedTime}',
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      AppText(
                        text: 'Account No:',
                        // fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      AppText(
                        text: '${controller.data.value.member!.memberNo ?? ''}',
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      AppText(
                        text: 'Name:',
                        // fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      AppText(
                        text:
                            '${controller.data.value.member!.memberName ?? ''}',
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      AppText(
                        text: "Father's Name:",
                        // fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      AppText(
                        text:
                            '${controller.data.value.member!.membersFatherName ?? ''}',
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      AppText(
                        text: "Phone:",
                        // fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      AppText(
                        text: '${controller.data.value.member!.mobileNo ?? ''}',
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      AppText(
                        text: "Loan Collection No:",
                        // fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      AppText(
                        text:
                            '${controller.data.value.installmentCollectionsNo ?? ''}',
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    thickness: 2,
                    color: CustomColor.grey,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  DottedBorder(
                    dashPattern: [10],
                    color: CustomColor.grey,
                    strokeWidth: 3,
                    child: Container(
                      padding: EdgeInsets.only(
                          left: 20, top: 20, bottom: 20, right: 10),
                      // decoration: BoxDecoration(
                      //   border: Border.all(
                      //     color: CustomColor.grey,
                      //     width: 3
                      //
                      //   ),
                      // ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppText(
                                text: "Installment Amount:",
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              AppText(
                                text:
                                    '${controller.amountPerInstallment.value.installmentAmount ?? ''}',
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppText(
                                text: "Loan Amount:",
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              AppText(
                                text:
                                    '${_loanCollectionController.loanCollectionData.value.data!.totalAmount}',
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppText(
                                text: "Today's Collection:",
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              AppText(
                                text:
                                    '${controller.data.value.installmentCollection ?? '0.0'}',
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppText(
                                text: "Total Collection:",
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              AppText(
                                text:
                                    '${_loanCollectionController.loanCollectionData.value.totalCollection ?? '0.0'}',
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppText(
                                text: "Balance:",
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              AppText(
                                text: '${balance}',
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppText(
                                text: "Previous Due:",
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              AppText(
                                text:
                                    '${controller.data.value.previousDue ?? '0.0'}',
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppText(
                                text: "Fine:",
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              AppText(
                                text: '${controller.data.value.fine ?? '0.0'}',
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppText(
                                text: "Note:",
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              AppText(
                                text: '${controller.data.value.note ?? ''}',
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () async {
                            File pdfFile = await generateAndSavePDF();
                            if (pdfFile != null) {
                              Share.shareFiles([pdfFile.path]);
                            }
                            setState(() {
                              isClose = 0;
                            });
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Icon(Icons.search),
                                  AppText(
                                    text: 'Share',
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
                            Get.to(() => LoanInvoiceViewPOSprint());
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
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
                ],
              ),
            );
          }
        }),
      ),
    );
  }
}
