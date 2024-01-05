import 'package:crm/app/modules/dashboard/settings/change_password_view.dart';
import 'package:crm/app/modules/dashboard/settings/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../controller/admin_email_signin_api_controller.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView>{

  final LoginController _loginController = Get.put(LoginController());

  Future<String> fetchData() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final accessToken = sharedPreferences.getString('accessToken');
    return '$accessToken';
  }

  Future<String> fetchDataName() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final message = sharedPreferences.getString('message');
    List<String> words = message!.split(RegExp(r'[ ,]'));
    String name = words.length > 1 ? words[1] : '';
    return '$name';
  }

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
                        FutureBuilder<String>(
                          future: fetchDataName(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              // Show a loading indicator while waiting for the future
                              return CircularProgressIndicator();
                            } else if (snapshot.hasError) {
                              // Show an error message if there's an error
                              return Text('Error: ${snapshot.error}');
                            } else {
                              // Display the data from the future when it's available
                              return Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Name: ${snapshot.data}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),),
                                  ],
                                ),
                              );
                            }
                          },
                        ),
                        FutureBuilder<String>(
                          future: fetchData(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              // Show a loading indicator while waiting for the future
                              return CircularProgressIndicator();
                            } else if (snapshot.hasError) {
                              // Show an error message if there's an error
                              return Text('Error: ${snapshot.error}');
                            } else {
                              // Display the data from the future when it's available
                              return Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Token:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),),
                                    Container(
                                        width: 250,
                                        child: Text('${snapshot.data}', style: TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.8)),)),
                                  ],
                                ),
                              );
                            }
                          },
                        ),
                      ]
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
            onTap: () => _loginController.logout(),
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
