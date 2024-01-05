import 'package:crm/app/modules/dashboard/settings/change_password_view.dart';
import 'package:crm/app/modules/dashboard/settings/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: 1),
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.deepPurple,
              boxShadow: [BoxShadow(color: Colors.black, blurRadius: 2, offset: Offset(1, 1))]
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  //crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Image.asset('assets/crm_logo-noBG.png',
                      height: 80,
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Name: ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),),
                        Text('Designation: ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white.withOpacity(0.8)),),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(thickness: 1, color: Colors.black26.withOpacity(0.2),),
          ListTile(
            onTap: (){
              Get.to(() => ProfileView());
            },
            leading: Icon(Icons.person, color: Colors.lightGreen, size: 30, shadows: [BoxShadow(color: Colors.black, blurRadius: 5, offset: Offset(1, 1))],),
            title: Text('Profile', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black54),),
            trailing: Icon(Icons.chevron_right, color: Colors.lightGreen, size: 30, shadows: [BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 5, offset: Offset(1, 1))],),
            tileColor: Colors.blueGrey.withOpacity(0.3),
          ),
          SizedBox(height: 5),
          //Divider(thickness: 1, color: Colors.black26.withOpacity(0.2),),
          ListTile(
            onTap: (){},
            leading: Icon(Icons.contact_mail, color: Colors.lightGreen, size: 30, shadows: [BoxShadow(color: Colors.black, blurRadius: 5, offset: Offset(1, 1))],),
            title: Text('Contact Us', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black54),),
            trailing: Icon(Icons.chevron_right, color: Colors.lightGreen, size: 30, shadows: [BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 5, offset: Offset(1, 1))],),
            tileColor: Colors.blueGrey.withOpacity(0.3),
          ),
          SizedBox(height: 5),
          //Divider(thickness: 1, color: Colors.black26.withOpacity(0.2),),
          ListTile(
            onTap: (){},
            leading: Icon(Icons.contact_support, color: Colors.lightGreen, size: 30, shadows: [BoxShadow(color: Colors.black, blurRadius: 5, offset: Offset(1, 1))],),
            title: Text('Ticket', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black54),),
            trailing: Icon(Icons.chevron_right, color: Colors.lightGreen, size: 30, shadows: [BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 5, offset: Offset(1, 1))],),
            tileColor: Colors.blueGrey.withOpacity(0.3),
          ),
          SizedBox(height: 5),
          //Divider(thickness: 1, color: Colors.black26.withOpacity(0.2),),
          ListTile(
            onTap: (){},
            leading: Icon(Icons.video_collection_outlined, color: Colors.lightGreen, size: 30, shadows: [BoxShadow(color: Colors.black, blurRadius: 5, offset: Offset(1, 1))],),
            title: Text('Tutorial', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black54),),
            trailing: Icon(Icons.chevron_right, color: Colors.lightGreen, size: 30, shadows: [BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 5, offset: Offset(1, 1))],),
            tileColor: Colors.blueGrey.withOpacity(0.3),
          ),
          SizedBox(height: 5),
          //Divider(thickness: 1, color: Colors.black26.withOpacity(0.2),),
          ListTile(
            onTap: (){
              Get.to(() => ChangePasswordView());
            },
            leading: Icon(Icons.password, color: Colors.lightGreen, size: 30, shadows: [BoxShadow(color: Colors.black, blurRadius: 5, offset: Offset(1, 1))],),
            title: Text('Change Password', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black54),),
            trailing: Icon(Icons.chevron_right, color: Colors.lightGreen, size: 30, shadows: [BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 5, offset: Offset(1, 1))],),
            tileColor: Colors.blueGrey.withOpacity(0.3),
          ),
          SizedBox(height: 5),
          //Divider(thickness: 1, color: Colors.black26.withOpacity(0.2),),
          ListTile(
            onTap: (){},
            leading: Icon(Icons.logout, color: Colors.lightGreen, size: 30, shadows: [BoxShadow(color: Colors.black, blurRadius: 5, offset: Offset(1, 1))],),
            title: Text('Logout', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black54),),
            trailing: Icon(Icons.chevron_right, color: Colors.lightGreen, size: 30, shadows: [BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 5, offset: Offset(1, 1))],),
            tileColor: Colors.blueGrey.withOpacity(0.3),
          ),
          Divider(thickness: 1, color: Colors.black26.withOpacity(0.2),),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          Center(
            child: Column(
              children: [
                Text('Develop by Creative Software', style: TextStyle(fontSize: 16, color: Colors.black.withOpacity(0.5)),),
                Text('Version 1.0.0', style: TextStyle(fontSize: 16, color: Colors.black.withOpacity(0.5)),),
              ],
            ),
          ),
          SizedBox(height: 30,),
        ]
      ),
    );
  }
}
