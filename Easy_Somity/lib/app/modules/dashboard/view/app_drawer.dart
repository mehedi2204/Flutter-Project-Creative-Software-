import 'package:easy_somity/app/const/color_constant.dart';
import 'package:easy_somity/app/const/widgets/app_text.dart';
import 'package:easy_somity/app/modules/dashboard/view/dashboard_view.dart';
import 'package:easy_somity/app/modules/dashboard/view/printer_settings_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../const/size_config.dart';
import '../../../const/storage_healper.dart';
import '../../../routes/app_pages.dart';
import '../../signin/loginController.dart';
import '../Drawer Menue/profile.dart';
class AppDrawer extends StatelessWidget {
  AppDrawer({Key? key}) : super(key: key);
  final AuthController _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Scaffold(
        // Name,phone,
        body: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                // color: CustomColor.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('assets/logo.png',
                    height: 80,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(text: '${_authController.user.value.data.name}',fontWeight: FontWeight.bold,),
                        AppText(text: '${_authController.user.value.data.mobile}',fontWeight: FontWeight.bold,),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardView()));
              },
              child: ListTile(
                trailing: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Icon(Icons.arrow_forward_ios,color: CustomColor.darkGrey,),
                ),
                leading: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.lightGreen.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.dashboard,
                    color: CustomColor.darkGrey,
                  ),
                ),
                selectedColor: CustomColor.primary.withOpacity(0.7),
                contentPadding:
                const EdgeInsets.only(left: 14),
                title: AppText(text: 'Dashboard') ,//privacy policy, logout, version,
              ),
            ),
            const Divider(),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileView()));
              },
              child: ListTile(
                leading: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.pinkAccent.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.person,
                    color: CustomColor.darkGrey,
                  ),
                ),
                trailing: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Icon(Icons.arrow_forward_ios,color: CustomColor.darkGrey,),
                ),
                selectedColor: CustomColor.primary.withOpacity(0.7),
                contentPadding:
                const EdgeInsets.only(left: 14),
                title: AppText(text: 'Profile')
              ),
            ),
            const Divider(),
            ListTile(
              trailing: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Icon(Icons.arrow_forward_ios,color: CustomColor.darkGrey,),
              ),
                leading: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.lightGreen.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.share,
                    color: CustomColor.darkGrey,
                  ),
                ),
                selectedColor: CustomColor.primary.withOpacity(0.7),
                contentPadding:
                const EdgeInsets.only(left: 14),
                title: AppText(text: 'Share') ,//privacy policy, logout, version,
            ),
            const Divider(),
            ListTile(
                trailing: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Icon(Icons.arrow_forward_ios,color: CustomColor.darkGrey,),
                ),
                leading: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xffcb84fb).withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.privacy_tip,
                    color: CustomColor.darkGrey,
                  ),
                ),
                selectedColor: CustomColor.primary.withOpacity(0.7),
                contentPadding:
                const EdgeInsets.only(left: 14),
                title: AppText(text: 'Privacy Policy')
            ),
            const Divider(),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PrinterSettingsView()));
              },
              child: ListTile(
                  trailing: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Icon(Icons.arrow_forward_ios,color: CustomColor.darkGrey,),
                  ),
                  leading: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.lightGreen.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.print,
                      color: CustomColor.darkGrey,
                    ),
                  ),
                  selectedColor: CustomColor.primary.withOpacity(0.7),
                  contentPadding:
                  const EdgeInsets.only(left: 14),
                  title: AppText(text: 'Printer Setings')
              ),
            ),
            const Divider(),
            GestureDetector(
              onTap: () {
                StorageHelper.eraseAll();
                Get.offAllNamed(Routes.HOME);
              },
              child: ListTile(
                trailing: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Icon(Icons.arrow_forward_ios,color: CustomColor.darkGrey,),
                ),
                leading: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xfffc7f7f).withOpacity(0.6),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.exit_to_app,
                    color: CustomColor.darkGrey,
                  ),
                ),
                selectedColor: CustomColor.primary.withOpacity(0.7),
                contentPadding: const EdgeInsets.only(left: 14),
                iconColor: CustomColor.darkGrey,
                title:  AppText(text: 'Logout'),
              ),
            ),
          ],
        ),
        bottomSheet: Container(
          //color: CustomColor.white,
          height: 50,
          child: Center(
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Develop by Creative Software',
                  style: TextStyle(fontSize: 15, fontFamily: GoogleFonts.robotoMono().fontFamily),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'version: 1.0.1+15',
                  style: TextStyle(fontSize: 15, fontFamily: GoogleFonts.robotoMono().fontFamily),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
