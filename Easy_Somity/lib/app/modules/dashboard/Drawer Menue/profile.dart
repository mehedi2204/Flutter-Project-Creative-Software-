import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../const/color_constant.dart';
import '../../../const/storage_healper.dart';
import '../../../const/widgets/app_text.dart';
import '../../../routes/app_pages.dart';
import '../../signin/loginController.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final AuthController _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    int isClose = 0;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Profile",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.deepPurple.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(90),
                ),
                child: Center(
                    child: Icon(
                  Icons.person_outline,
                  size: 70,
                )),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.deepPurple.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Name : ${_authController.user.value.data.name}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                //width: 200,
                decoration: BoxDecoration(
                  color: Colors.deepPurple.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Mobile : ${_authController.user.value.data.mobile}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                //width: 200,
                decoration: BoxDecoration(
                  color: Colors.deepPurple.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Email : ${_authController.user.value.data.email}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              GestureDetector(
                onTap: () {
                  isClose = 0;
                  print(isClose);
                  StorageHelper.eraseAll();
                  Get.offAllNamed(Routes.HOME);

                },
                child: Container(
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                      color: isClose == 0
                          ? CustomColor.primary
                          : Colors.transparent,
                      border: Border.all(width: 2, color: Colors.grey[600]!),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Icon(Icons.search),
                        AppText(
                          text: 'Logout',
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: isClose == 0? CustomColor.white: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
