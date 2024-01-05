import 'package:dokan_pos/app/View/Collection/invoice_print_printer_select.dart';
import 'package:dokan_pos/app/View/printer_settings_view.dart';
import 'package:dokan_pos/app/constraints/custom_color.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class InvoicePrintView extends StatefulWidget {
  const InvoicePrintView({Key? key}) : super(key: key);

  @override
  State<InvoicePrintView> createState() => _InvoicePrintViewState();
}

class _InvoicePrintViewState extends State<InvoicePrintView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor:  CustomColor.backgroundColor,
          title: Text("Invoice Print", style: TextStyle(fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20.0, right: 20, left: 20),
          child: Container(
            //height: double.infinity,
            // color: Colors.deepPurple,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  //height: MediaQuery.of(context).size.height / 3,
                  child: Text("Dokan POS Pharmacy", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  //height: MediaQuery.of(context).size.height / 3,
                  child: Text("Shop no: 123, Panthapath, Dhanmondi, Dhaka -1205", style: TextStyle(fontSize: 18))
                ),
                Container(
                    alignment: Alignment.topLeft,
                    //height: MediaQuery.of(context).size.height / 3,
                    child: Text("Contact No: 01978866977", style: TextStyle(fontSize: 18)),
                ),
                SizedBox(height: 10),
                Container(
                  alignment: Alignment.topCenter,
                  //height: MediaQuery.of(context).size.height / 3,
                  child: Text("BILL NO 25", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  //height: MediaQuery.of(context).size.height / 3,
                  child: Row(
                    children: [
                      Text("08/13/2023", style: TextStyle(fontSize: 18)),
                      SizedBox(width: 100),
                      Text("11:48 AM", style: TextStyle(fontSize: 18)),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  //height: MediaQuery.of(context).size.height / 3,
                  child: Text("Customar : Deepali Kaathe", style: TextStyle(fontSize: 18)),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  //height: MediaQuery.of(context).size.height / 3,
                  child: Text("Phone : 01964937829", style: TextStyle(fontSize: 18)),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  //height: MediaQuery.of(context).size.height / 3,
                  child: Text("Address : Panthapath, Dhanmondi, Dhaka -1205", style: TextStyle(fontSize: 18)),
                ),
                SizedBox(height: 20),
                DottedLine(
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.center,
                  lineLength: double.infinity,
                  lineThickness: 2.0,
                  dashLength: 5.0,
                  dashColor: Colors.black,
                  dashRadius: 0.0,
                  dashGapLength: 4.0,
                  dashGapColor: Colors.transparent,
                  dashGapRadius: 5.0,
                ),
                SizedBox(height: 10),
                Container(
                  alignment: Alignment.topLeft,
                  //height: MediaQuery.of(context).size.height / 3,
                  child: Row(
                    children: [
                      Text("#", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      SizedBox(width: 30),
                      Text("Item", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      SizedBox(width: 70),
                      Text("QTY", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      SizedBox(width: 40),
                      Text("Rate", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      SizedBox(width: 45),
                      Text("Amount", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                DottedLine(
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.center,
                  lineLength: double.infinity,
                  lineThickness: 2.0,
                  dashLength: 5.0,
                  dashColor: Colors.black,
                  dashRadius: 0.0,
                  dashGapLength: 4.0,
                  dashGapColor: Colors.transparent,
                  dashGapRadius: 5.0,
                ),
                SizedBox(height: 10),
                Container(
                  alignment: Alignment.topLeft,
                  //height: MediaQuery.of(context).size.height / 3,
                  child: Row(
                    children: [
                      Text("1", style: TextStyle(fontSize: 18)),
                      SizedBox(width: 30),
                      Text("Item 1", style: TextStyle(fontSize: 18)),
                      SizedBox(width: 70),
                      Text("8", style: TextStyle(fontSize: 18)),
                      SizedBox(width: 60),
                      Text("10", style: TextStyle(fontSize: 18)),
                      SizedBox(width: 80),
                      Text("80", style: TextStyle(fontSize: 18)),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  //height: MediaQuery.of(context).size.height / 3,
                  child: Row(
                    children: [
                      Text("2", style: TextStyle(fontSize: 18)),
                      SizedBox(width: 30),
                      Text("Item 2", style: TextStyle(fontSize: 18)),
                      SizedBox(width: 70),
                      Text("3", style: TextStyle(fontSize: 18)),
                      SizedBox(width: 60),
                      Text("38", style: TextStyle(fontSize: 18)),
                      SizedBox(width: 75),
                      Text("114", style: TextStyle(fontSize: 18)),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  //height: MediaQuery.of(context).size.height / 3,
                  child: Row(
                    children: [
                      Text("3", style: TextStyle(fontSize: 18)),
                      SizedBox(width: 30),
                      Text("Item 3", style: TextStyle(fontSize: 18)),
                      SizedBox(width: 70),
                      Text("5", style: TextStyle(fontSize: 18)),
                      SizedBox(width: 60),
                      Text("25", style: TextStyle(fontSize: 18)),
                      SizedBox(width: 75),
                      Text("125", style: TextStyle(fontSize: 18)),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  //height: MediaQuery.of(context).size.height / 3,
                  child: Row(
                    children: [
                      Text("4", style: TextStyle(fontSize: 18)),
                      SizedBox(width: 30),
                      Text("Item 4", style: TextStyle(fontSize: 18)),
                      SizedBox(width: 70),
                      Text("2", style: TextStyle(fontSize: 18)),
                      SizedBox(width: 60),
                      Text("30", style: TextStyle(fontSize: 18)),
                      SizedBox(width: 80),
                      Text("60", style: TextStyle(fontSize: 18)),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                DottedLine(
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.center,
                  lineLength: double.infinity,
                  lineThickness: 2.0,
                  dashLength: 5.0,
                  dashColor: Colors.black,
                  dashRadius: 0.0,
                  dashGapLength: 4.0,
                  dashGapColor: Colors.transparent,
                  dashGapRadius: 5.0,
                ),
                SizedBox(height: 10),
                Container(
                  alignment: Alignment.topLeft,
                  //height: MediaQuery.of(context).size.height / 3,
                  child: Row(
                    children: [
                      Text("4/18", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                      SizedBox(width: MediaQuery.of(context).size.width/1.62),
                      Text("TOTAL = 379", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                DottedLine(
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.center,
                  lineLength: double.infinity,
                  lineThickness: 2.0,
                  dashLength: 5.0,
                  dashColor: Colors.black,
                  dashRadius: 0.0,
                  dashGapLength: 4.0,
                  dashGapColor: Colors.transparent,
                  dashGapRadius: 5.0,
                ),
                SizedBox(height: 20),
                Container(
                  alignment: Alignment.topLeft,
                  //height: MediaQuery.of(context).size.height / 3,
                  child: Text("Thank you, Visit again.", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  //height: MediaQuery.of(context).size.height / 3,
                  child: Text("Goods once sold cannot be refunned", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 3.5),
                Container(
                  alignment: Alignment.bottomRight,
                    child: FloatingActionButton(onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => InvoicePrintPrinterSelect()),
                      );
                    },
                      child: Icon(Icons.print),
                      backgroundColor: CustomColor.backgroundColor,),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
