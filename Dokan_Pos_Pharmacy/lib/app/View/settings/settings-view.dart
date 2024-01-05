import 'package:dokan_pos/app/constraints/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:dokan_pos/app/View/printer_settings_view.dart';
import 'package:dokan_pos/app/widgets/app_text.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // Name,phone,
        appBar: AppBar(
          backgroundColor: CustomColor.backgroundColor,
          title: Text("Settings", style: TextStyle(fontWeight: FontWeight.bold)),
          centerTitle: true,
          elevation: 0,
        ),
        body: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.all(15),
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PrinterSettingsView()));
              },
              child: ListTile(
                  trailing: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                    ),
                  ),
                  leading: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: CustomColor.backgroundColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Icon(
                      Icons.person_outline,
                      color: Colors.white,
                    ),
                  ),
                  selectedColor: Colors.amber,
                  contentPadding: const EdgeInsets.only(left: 14),
                  title: AppText(text: 'Profile')),
            ),
            const Divider(),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PrinterSettingsView()));
              },
              child: ListTile(
                  trailing: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                    ),
                  ),
                  leading: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: CustomColor.backgroundColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Icon(
                      Icons.print_outlined,
                      color: Colors.white,
                    ),
                  ),
                  selectedColor: Colors.amber,
                  contentPadding: const EdgeInsets.only(left: 14),
                  title: AppText(text: 'Printer Setings')),
            ),
            const Divider(),
          ],
        ),
        // bottomSheet: Padding(
        //   padding: const EdgeInsets.only(left: 25.0),
        //   child: Container(
        //     //color: CustomColor.white,
        //     height: 100,
        //     child: Column(
        //       //crossAxisAlignment: CrossAxisAlignment.center,
        //       //mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         AppText(
        //           text: 'Develop by Creative Software',
        //           textAlign: TextAlign.center,
        //         ),
        //         AppText(
        //           text: 'version: 1.0.1+15',
        //           textAlign: TextAlign.center,
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
